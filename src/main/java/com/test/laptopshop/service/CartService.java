package com.test.laptopshop.service;

import org.springframework.stereotype.Service;

import com.test.laptopshop.domain.Cart;
import com.test.laptopshop.domain.User;
import com.test.laptopshop.repository.CartRepository;

@Service
public class CartService {

    private CartRepository cartRepository;

    public CartService(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    public Cart getUserByCart(User user) {
        return this.cartRepository.findByUser(user);
    }

    public Cart saveCart(Cart cart) {
        return this.cartRepository.save(cart);
    }
}
