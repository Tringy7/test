package com.test.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.laptopshop.service.ProductService;

@Controller
public class HomePageController {

    private ProductService productService;

    public HomePageController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/homepage")
    public String getHomePage(Model model) {
        model.addAttribute("Product", this.productService.getProduct());
        return "/client/homepage/show";
    }

}
