package com.test.laptopshop.repository;

import com.test.laptopshop.domain.Order;
import com.test.laptopshop.domain.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
    Order save(Order order);
}
