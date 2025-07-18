package com.test.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.test.laptopshop.domain.Cart;
import com.test.laptopshop.domain.CartDetail;
import com.test.laptopshop.domain.Order;
import com.test.laptopshop.domain.OrderDetail;
import com.test.laptopshop.domain.Product;
import com.test.laptopshop.domain.User;
import com.test.laptopshop.repository.OrderDetailRepository;
import com.test.laptopshop.repository.OrderRepository;
import com.test.laptopshop.repository.ProductRepository;
import com.test.laptopshop.service.spectifiaction.ProductSpecs;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final ServletContext servletContext;
    private final UserService userService;
    private final CartService cartService;
    private final CartDetailService cartDetailService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    @Autowired
    private ModelMapper modelMapper;

    public ProductService(ProductRepository productRepository, ServletContext servletContext, UserService userService, CartService cartService, CartDetailService cartDetailService, OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.servletContext = servletContext;
        this.userService = userService;
        this.cartService = cartService;
        this.cartDetailService = cartDetailService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Long getCount() {
        return this.productRepository.count();
    }

    public Product getProductDetail(Long id) {
        return this.productRepository.findById(id).get();
    }

    public List<Product> getProduct() {
        return this.productRepository.findAll();
    }

    public String hadleUploadImageFile(MultipartFile file, String folder) {
        String finalName = "";
        try {
            byte[] bytes = file.getBytes();
            String rootPath = this.servletContext.getRealPath("/resources/images");
            File dir = new File(rootPath + File.separator + folder);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            // Create the file on server
            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (IOException e) {
            return "You failed to upload " + finalName + " => " + e.getMessage();
        }
        return finalName;
    }

    public Product productCreate(Product newProduct) {
        return this.productRepository.save(newProduct);
    }

    public Product productUpdate(Product newProduct) {
        Product temp = this.productRepository.findById(newProduct.getId()).get();
        if (temp != null) {
            temp = modelMapper.map(newProduct, temp.getClass());
        }
        return this.productRepository.save(temp);
    }

    public void deleteProduct(Long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, Long productId, HttpSession session, Long quantity) {
        User user = this.userService.getUserByEmail(email);

        // User exist
        if (user != null) {
            Cart cart = this.cartService.getUserByCart(user);
            // Create new cart
            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setSum(0L);
                newCart.setUser(user);
                cart = this.cartService.saveCart(newCart);
            }
            // Save cart detail
            Optional<Product> productCheck = this.productRepository.findById(productId);
            if (productCheck.isPresent()) {
                Product product = productCheck.get();
                CartDetail cartDetailCheck = this.cartDetailService.findByCartandProduct(cart, product);// Cart Detail of user not exist product
                if (cartDetailCheck == null) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setPrice(product.getPrice());
                    cartDetail.setProduct(product);
                    cartDetail.setQuantity(quantity);

                    Long sumTemp = cart.getSum() + 1;
                    cart.setSum(sumTemp);
                    this.cartDetailService.saveCartDetail(cartDetail);
                    session.setAttribute("sum", sumTemp);
                } else {
                    cartDetailCheck.setQuantity(cartDetailCheck.getQuantity() + quantity);
                    this.cartDetailService.saveCartDetail(cartDetailCheck);
                }
            }

        }
    }

    @Transactional
    public void deleteProductCart(Long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailCheck = this.cartDetailService.findByCartDetail(cartDetailId);
        if (cartDetailCheck.isPresent()) {
            CartDetail cartDetail = cartDetailCheck.get();
            Cart cart = cartDetail.getCart();

            this.cartDetailService.deleteCartDetail(cartDetailId);

            if (cart.getSum() > 1) {
                Long sumTemp = cart.getSum() - 1;
                cart.setSum(sumTemp);
                session.setAttribute("sum", sumTemp);
                this.cartService.saveCart(cart);
            } else {
                cart.setSum(0L);
                session.setAttribute("sum", 0);
                this.cartService.saveCart(cart);
            }
        }
    }

    @Transactional
    public void handleCartBeforeCheckOut(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cartDetailCheck = this.cartDetailService.findByCartDetail(cartDetail.getId());
            if (cartDetailCheck.isPresent()) {
                CartDetail temp = cartDetailCheck.get();
                temp.setQuantity(cartDetail.getQuantity());
                this.cartDetailService.saveCartDetail(temp);
            }
        }
    }

    @Transactional
    public void handleOrder(String receiverName, String receiverAddress, String receiverPhone, User user, HttpSession session) {
        // Get cart
        Cart cart = this.cartService.getUserByCart(user);

        if (cart != null) {
            Order order = new Order();
            order.setReceiverName(receiverName);
            order.setReceiverAddress(receiverAddress);
            order.setReceiverPhone(receiverPhone);
            order.setUser(user);
            order.setStatus("PENDING");
            order = this.orderRepository.save(order);

            double total = 0;
            List<CartDetail> cartDetails = cart.getCartDetails();
            for (CartDetail it : cartDetails) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrder(order);
                orderDetail.setQuantity(it.getQuantity());
                orderDetail.setProduct(it.getProduct());
                total = total + it.getPrice() * it.getQuantity();
                this.orderDetailRepository.save(orderDetail);
            }

            order.setTotalPrice(total);

            cart.setSum(0L);
            this.cartService.saveCart(cart);

            for (CartDetail it : cartDetails) {
                this.cartDetailService.deleteCartDetail(it.getId());
            }

            session.setAttribute("sum", 0);
        }
    }

    public Page<Product> getPageAdmin(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }

    // public Page<Product> getPage(Pageable pageable, String name) {
    //     return this.productRepository.findAll(ProductSpecs.productNameLike(name), pageable);
    // }
    public Page<Product> getPage(Pageable pageable, String name) {
        return this.productRepository.findAll(ProductSpecs.productNameLike(name), pageable);
    }
}
