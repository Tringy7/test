package com.test.laptopshop.service.spectifiaction;

import org.springframework.data.jpa.domain.Specification;

import com.test.laptopshop.domain.Product;
import com.test.laptopshop.domain.Product_;

import java.util.List;

public class ProductSpecs {

    public static Specification<Product> productCheckFactory(List<String> factory) {
        return (root, query, criteriaBuilder) ->
            criteriaBuilder.in(root.get(Product_.FACTORY)).value(factory);
    }

    public static Specification<Product> productChecTarget(List<String> target) {
        return (root, query, criteriaBuilder) ->
                criteriaBuilder.in(root.get(Product_.TARGET)).value(target);
    }

    public static Specification<Product> productChecPrice(double min, double max) {
        return (root, query, criteriaBuilder) ->
                criteriaBuilder.between(root.get(Product_.PRICE), min, max);
    }
}
