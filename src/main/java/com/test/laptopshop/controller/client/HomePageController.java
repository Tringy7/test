package com.test.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.laptopshop.domain.dto.UserDTO;
import com.test.laptopshop.service.ProductService;
import com.test.laptopshop.service.UserService;

import jakarta.validation.Valid;

@Controller
public class HomePageController {

    private ProductService productService;
    private UserService userService;

    public HomePageController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/homepage")
    public String getHomePage(Model model) {
        model.addAttribute("Product", this.productService.getProduct());
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String showRegister(Model model) {
        model.addAttribute("newUser", new UserDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String saveRegister(
            @Valid @ModelAttribute("newUser") UserDTO userDTO,
            BindingResult userBindingResult
    ) {
        if (userBindingResult.hasErrors()) {
            return "client/auth/register";
        }

        this.userService.saveRegister(userDTO);

        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLogin(Model model) {
        model.addAttribute("user", new UserDTO());
        return "client/auth/login";
    }

    @PostMapping("/login")
    public String saveLogin(
            @Valid @ModelAttribute("user") UserDTO userDTO,
            BindingResult userBindingResult
    ) {

        if (userBindingResult.hasErrors()) {
            return "client/auth/login";
        }

        return "redirect:/homepage";
    }

    @GetMapping("/access-deny")
    public String showFormDeny() {
        return "client/auth/deny";
    }

    @GetMapping("/cart")
    public String showCart() {
        return "client/cart/show";
    }

}
