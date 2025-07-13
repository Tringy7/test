package com.test.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.laptopshop.service.ProductService;
import com.test.laptopshop.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ItemController {

    private ProductService productService;
    private UserService userService;

    public ItemController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
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

}
