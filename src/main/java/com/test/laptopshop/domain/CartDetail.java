package com.test.laptopshop.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "cartDetails")
@Getter
@Setter
@NoArgsConstructor
public class CartDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double price;
    private Long quantity;

    @ManyToOne()
    @JoinColumn(name = "cartId")
    private Cart cart;

    @ManyToOne()
    @JoinColumn(name = "productId")
    private Product product;
}
