package com.test.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.laptopshop.domain.User;
import com.test.laptopshop.repository.UserRepository;
import com.test.laptopshop.service.OrderService;
import com.test.laptopshop.service.ProductService;
import com.test.laptopshop.service.UserService;

@Controller
public class DashboardController {

    private UserService userService;
    private ProductService productService;
    private OrderService orderService;

    public DashboardController(OrderService orderService, ProductService productService, UserService userService) {
        this.orderService = orderService;
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("countUser", userService.getCount());
        model.addAttribute("countProduct", productService.getCount());
        model.addAttribute("countOrder", orderService.getCount());
        return "admin/dashboard/show";
    }
}
