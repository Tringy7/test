package com.test.laptopshop.service;

import org.springframework.stereotype.Service;

import com.test.laptopshop.domain.Product;
import com.test.laptopshop.repository.ProductRepository;

@Service
public class ProductService {

    private ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product getProductDetail(Long id) {
        return this.productRepository.findById(id).get();
    }
}
