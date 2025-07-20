package com.test.laptopshop.domain.dto;

import lombok.*;

import java.util.List;
import java.util.Optional;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductCriteriaDTO {
    private Optional<String> page;
    private Optional<List<String>> factory;
    private Optional<List<String>> target;
    private Optional<List<String>> price;
    private Optional<String> sort;
}

