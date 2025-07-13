package com.test.laptopshop.repository;

import com.test.laptopshop.domain.Cart;
import com.test.laptopshop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartRepository extends JpaRepository<Cart,Long> {
    Cart findByUser(User user);
}
