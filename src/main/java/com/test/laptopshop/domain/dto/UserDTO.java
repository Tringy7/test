package com.test.laptopshop.domain.dto;

import com.test.laptopshop.service.validator.RegisterChecked;

import jakarta.validation.constraints.Email;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
@RegisterChecked
public class UserDTO {
    private String firstName;
    private String lastName;
    private String password;
    @Email
    private String email;
    private String confirmPassword; 
}
