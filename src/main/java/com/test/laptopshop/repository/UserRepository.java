package com.test.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.laptopshop.domain.User;

public interface UserRepository extends JpaRepository<User, Long>{
    boolean existsByEmail(String email);
}
