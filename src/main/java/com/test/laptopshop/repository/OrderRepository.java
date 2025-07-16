package com.test.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.laptopshop.domain.Order;
import com.test.laptopshop.domain.User;

public interface OrderRepository extends JpaRepository<Order, Long> {
    Order save(Order order);

    List<Order> findByUser(User user);
}
