package com.test.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.laptopshop.domain.Cart;
import com.test.laptopshop.domain.User;

public interface CartRepository extends JpaRepository<Cart,Long> {
    Cart findByUser(User user);
}
