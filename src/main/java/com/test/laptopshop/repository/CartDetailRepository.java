package com.test.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.laptopshop.domain.Cart;
import com.test.laptopshop.domain.CartDetail;
import com.test.laptopshop.domain.Product;

public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {

    CartDetail findByCartAndProduct(Cart cart, Product product);

}
