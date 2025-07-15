package com.test.laptopshop.service;

import com.test.laptopshop.domain.Order;
import com.test.laptopshop.domain.OrderDetail;
import com.test.laptopshop.domain.User;
import com.test.laptopshop.repository.OrderRepository;
import com.test.laptopshop.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;

    public OrderService(OrderRepository orderRepository, UserRepository userRepository) {
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
    }

    public List<Order> getOrder() {
        return this.orderRepository.findAll();
    }

    public List<OrderDetail> getOrderDetailList(Long id) {
        Optional<Order> orderCheck = this.orderRepository.findById(id);
        if(orderCheck.isPresent()) {
            return orderCheck.get().getOrderDetails();
        }
        return new ArrayList<>();
    }

    public Order getOrderDetail(Long id) {
       return this.orderRepository.findById(id).get();
    }

    public void updateOrder(Order order) {
        Order orderTemp = this.orderRepository.findById(order.getId()).get();
        if (orderTemp != null) {
            User user =  orderTemp.getUser();
            user.setFullName(order.getUser().getFullName());
            this.userRepository.save(user);
            orderTemp.setUser(user);
            orderTemp.setStatus(order.getStatus());
            this.orderRepository.save(orderTemp);
        }
    }

    public void deleteOrder(Long id) {
        this.orderRepository.deleteById(id);
    }
}
