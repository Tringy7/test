package com.test.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.laptopshop.domain.Product;
import com.test.laptopshop.service.ProductService;
import com.test.laptopshop.service.UserService;

@Controller
public class ProductController {

    private final UserService userService;

    private final ProductService productService;

    public ProductController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/admin/product")
    public String getProduct(Model model) {
        model.addAttribute("Product", this.productService.getProduct());
        model.addAttribute("usertable", this.userService.getUser());

        return "/admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String showProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "/admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(@ModelAttribute Product product, Model model) {
        return "redirect:/admin/product";
    }

}
