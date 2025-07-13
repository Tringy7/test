package com.test.laptopshop.service;

import com.test.laptopshop.domain.Cart;
import com.test.laptopshop.domain.CartDetail;
import com.test.laptopshop.domain.Product;
import com.test.laptopshop.repository.CartDetailRepository;
import org.springframework.stereotype.Service;

@Service
public class CartDetailService {
    private final CartDetailRepository cartDetailRepository;

    public CartDetailService(CartDetailRepository cartDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
    }

    public void saveCartDetail(CartDetail cartDetail) {
        cartDetailRepository.save(cartDetail);
    }

    public CartDetail findByCartandProduct(Cart cart, Product product) {
        return this.cartDetailRepository.findByCartAndProduct(cart, product);
    }
}
