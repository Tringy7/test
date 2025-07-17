package com.test.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.laptopshop.domain.Order;
import com.test.laptopshop.service.OrderService;

@Controller
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String showOrder(Model model, @ModelAttribute("page") Optional<String> pageNumber) {
        int page = 0;
        try {
            if (pageNumber.isPresent()) {
                page = Integer.parseInt(pageNumber.get());
            }
        } catch (Exception e) {
        }
        Pageable pageable = PageRequest.of(page, 2);
        Page<Order> pageOrders = this.orderService.fetchOrder(pageable);
        List<Order> orderList = pageOrders.getContent();
        model.addAttribute("order", orderList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", pageOrders.getTotalPages() - 1);
        return "admin/order/show";
    }

    @GetMapping("/admin/order/{id}")
    public String showOrderView(Model model, @PathVariable("id") Long id) {
        model.addAttribute("orderDetailList", this.orderService.getOrderDetailList(id));
        return "admin/order/detail";
    }

    @GetMapping("/admin/order/update/{id}")
    public String showOrderUpdate(Model model, @PathVariable("id") Long id) {
        model.addAttribute("order", this.orderService.getOrderDetail(id));
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update/{id}")
    public String updateOrder(Model model, @PathVariable("id") Long id, @ModelAttribute("order") Order order) {
        this.orderService.updateOrder(order);
        return "redirect:/admin/order";
    }

//    @GetMapping("/admin/order/delete/{id}")
//    public String showOrderDelete(Model model, @PathVariable("id") Long id) {
//        model.addAttribute("order", this.orderService.getOrderDetail(id));
//        return "admin/order/delete";
//    }
//
//    @PostMapping("/admin/order/delete/{id}")
//    public String deleteOrder(Model model, @ModelAttribute("order") Order order) {
//        this.orderService.deleteOrder(order.getId());
//        return  "redirect:/admin/order";
//    }
}
