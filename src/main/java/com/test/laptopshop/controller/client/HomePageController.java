package com.test.laptopshop.controller.client;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.laptopshop.domain.Product;
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

    @GetMapping("/product")
    public String showProductProduct(Model model,
            @RequestParam(value = "page") Optional<String> pageNumber,
            @RequestParam(value = "name", defaultValue = "") Optional<String> nameOptional,
            @RequestParam(value = "min-price") Optional<String> minPriceOptional
    ) {
        int page = 0;
        try {
            if (pageNumber.isPresent()) {
                page = Integer.parseInt(pageNumber.get());
            }
        } catch (Exception e) {
        }
        String name = nameOptional.get();
        String minPrice = minPriceOptional.isPresent() ? minPriceOptional.get() : "";
        Pageable pageable = PageRequest.of(page, 3);
        Page<Product> ps = this.productService.getPage(pageable, name);
        List<Product> prodList = ps.getContent();
        model.addAttribute("prodList", prodList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", ps.getTotalPages() - 1);
        return "client/product/shop";
    }
}
