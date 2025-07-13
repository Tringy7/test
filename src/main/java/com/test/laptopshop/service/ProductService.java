package com.test.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.test.laptopshop.domain.Cart;
import com.test.laptopshop.domain.CartDetail;
import com.test.laptopshop.domain.Product;
import com.test.laptopshop.domain.User;
import com.test.laptopshop.repository.ProductRepository;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final ServletContext servletContext;
    private final UserService userService;
    private final CartService cartService;
    private final CartDetailService cartDetailService;
    @Autowired
    private ModelMapper modelMapper;

    public ProductService(ProductRepository productRepository, ServletContext servletContext, UserService userService, CartService cartService, CartDetailService cartDetailService) {
        this.productRepository = productRepository;
        this.servletContext = servletContext;
        this.userService = userService;
        this.cartService = cartService;
        this.cartDetailService = cartDetailService;
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

    public void handleAddProductToCart(String email, Long productId, HttpSession session) {
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
                    cartDetail.setQuantity(1L);

                    Long sumTemp = cart.getSum() + 1;
                    cart.setSum(sumTemp);
                    this.cartDetailService.saveCartDetail(cartDetail);
                    session.setAttribute("sum", sumTemp);
                } else {
                    cartDetailCheck.setQuantity(cartDetailCheck.getQuantity() + 1);
                    this.cartDetailService.saveCartDetail(cartDetailCheck);
                }
            }

        }
    }
}
