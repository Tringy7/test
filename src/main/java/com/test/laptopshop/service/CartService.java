package com.test.laptopshop.service;

import org.springframework.stereotype.Service;

import com.test.laptopshop.domain.Cart;
import com.test.laptopshop.domain.User;
import com.test.laptopshop.repository.CartRepository;

import java.util.Optional;

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

    public void deleteCart(Long id) {
        this.cartRepository.deleteById(id);
    }

    public Optional<Cart> findById(Long id) {
        return this.cartRepository.findById(id);
    }
}
