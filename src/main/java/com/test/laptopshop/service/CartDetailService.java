package com.test.laptopshop.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.test.laptopshop.domain.Cart;
import com.test.laptopshop.domain.CartDetail;
import com.test.laptopshop.domain.Product;
import com.test.laptopshop.domain.User;
import com.test.laptopshop.repository.CartDetailRepository;

@Service
public class CartDetailService {

    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final CartService cartService;

    public CartDetailService(CartDetailRepository cartDetailRepository, UserService userService,  CartService cartService) {
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.cartService = cartService;
    }

    public void saveCartDetail(CartDetail cartDetail) {
        cartDetailRepository.save(cartDetail);
    }

    public CartDetail findByCartandProduct(Cart cart, Product product) {
        return this.cartDetailRepository.findByCartAndProduct(cart, product);
    }

    public List<CartDetail> getCarDetailList(String email) {
        User user = this.userService.getUserByEmail(email);
        if (user != null ) {
            Cart cart = this.cartService.getUserByCart(user);
            if (cart != null) {
                return cart.getCartDetails();
            }
        }
        return new ArrayList<CartDetail>();
    }
}
