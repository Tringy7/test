package com.test.laptopshop.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.test.laptopshop.domain.Product;

public interface ProductRepository extends JpaRepository<Product, Long>{
    Page<Product> findAll(Pageable page);
}
