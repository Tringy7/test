package com.test.laptopshop.service.spectifiaction;

import org.springframework.data.jpa.domain.Specification;

import com.test.laptopshop.domain.Product;
import com.test.laptopshop.domain.Product_;

public class ProductSpecs {

    public static Specification<Product> productNameLike(String name) {
        return (root, query, criteriaBuilder)
                -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }
}
