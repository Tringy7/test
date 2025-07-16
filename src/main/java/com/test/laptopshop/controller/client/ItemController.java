package com.test.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.laptopshop.domain.Cart;
import com.test.laptopshop.domain.CartDetail;
import com.test.laptopshop.domain.User;
import com.test.laptopshop.service.CartDetailService;
import com.test.laptopshop.service.CartService;
import com.test.laptopshop.service.OrderService;
import com.test.laptopshop.service.ProductService;
import com.test.laptopshop.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ItemController {

    private final CartDetailService cartDetailService;
    private final ProductService productService;
    private final UserService userService;
    private final CartService cartService;
    private final OrderService orderService;

    public ItemController(ProductService productService, UserService userService, CartDetailService cartDetailService, CartService cartService, OrderService orderService) {
        this.productService = productService;
        this.userService = userService;
        this.cartDetailService = cartDetailService;
        this.cartService = cartService;
        this.orderService = orderService;
    }

    @GetMapping("/product/{id}")
    public String getProductDetail(@PathVariable("id") Long id, Model model) {
        model.addAttribute("productDetail", this.productService.getProductDetail(id));
        return "client/product/show";
    }

    @PostMapping("/product/view/{id}")
    public String addProductToCartFromDetail(@PathVariable("id") Long id,
            Model model,
            HttpServletRequest request,
            @RequestParam("quantity") Long quantity) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, id, session, quantity);
        return "redirect:/cart";
    }

    @PostMapping("/product/{id}")
    public String addProductToCart(
            @PathVariable("id") Long id,
            Model model,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, id, session, 1L);
        return "redirect:/cart";
    }

    @GetMapping("/cart")
    public String showCartDetail(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.getUserByEmail(email);
        Cart cart = new Cart();
        if (user != null) {
            cart = this.cartService.getUserByCart(user);
        }
        List<CartDetail> cartDetails = cart.getCartDetails();
        double totalPrice = 0L;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
        }
        model.addAttribute("cartDetail", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);
        return "client/cart/show";
    }

    @PostMapping("/cart/delete/{id}")
    public String deleteProductCart(@PathVariable("id") Long cartDetailId, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        this.productService.deleteProductCart(cartDetailId, session);
        return "redirect:/cart";
    }

    @PostMapping("/cart/submit")
    public String submitCartDetail(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = new ArrayList<>();
        if (cart != null) {
            cartDetails = cart.getCartDetails();
            this.productService.handleCartBeforeCheckOut(cartDetails);
        }
        return "redirect:/checkout";
    }

    @GetMapping("/checkout")
    public String showBill(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.getUserByEmail(email);
        Cart cart = new Cart();
        if (user != null) {
            cart = this.cartService.getUserByCart(user);
        }
        List<CartDetail> cartDetails = cart.getCartDetails();
        double totalPrice = 0L;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
        }
        model.addAttribute("cartDetail", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        return "client/cart/checkout";
    }

    @PostMapping("/checkout")
    public String checkout(
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.getUserByEmail(email);
        this.productService.handleOrder(receiverName, receiverAddress, receiverPhone, user, session);

        return "redirect:/checkout/success";
    }

    @GetMapping("/checkout/success")
    public String checkoutSuccess() {
        return "client/cart/success";
    }

    @GetMapping("/order-history")
    public String showOrderHistory(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.getUserByEmail(email);
        model.addAttribute("order", this.orderService.getOrder(user));
        return "client/cart/history";
    }

}
