package com.test.laptopshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.test.laptopshop.domain.CartDetail;
import com.test.laptopshop.service.CartDetailService;
import com.test.laptopshop.service.ProductService;
import com.test.laptopshop.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class ItemController {

    private final CartDetailService cartDetailService;
    private final ProductService productService;
    private final UserService userService;

    public ItemController(ProductService productService, UserService userService, CartDetailService cartDetailService) {
        this.productService = productService;
        this.userService = userService;
        this.cartDetailService = cartDetailService;
    }

    @GetMapping("/product/{id}")
    public String getProductDetail(@PathVariable("id") Long id, Model model) {
        model.addAttribute("productDetail", this.productService.getProductDetail(id));
        return "client/product/show";
    }

    @PostMapping("/product/{id}")
    public String addProductToCart(
            @PathVariable("id") Long id,
            Model model,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, id, session);
        return "redirect:/homepage";
    }

    @GetMapping("/cart")
    public String showCartDetail(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        List<CartDetail> cartDetails = this.cartDetailService.getCarDetailList(email);
        double totalPrice = 0L;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
        }
        model.addAttribute("cartDetail", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        return "client/cart/show";
    }

    @PostMapping("/cart/{id}")
    public String deleteProductCart(@RequestBody String entity) {
        //TODO: process POST request
        
        return entity;
    }
    
}
