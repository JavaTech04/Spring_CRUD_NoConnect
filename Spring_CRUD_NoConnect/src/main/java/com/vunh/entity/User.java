package com.vunh.entity;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;
import org.springframework.stereotype.Component;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Component
public class User {
    @NotBlank
    private String username;
    @Length(min = 6)
    private String password;
    @NotBlank
    private String fullName;
    @NotBlank
    @Email
    private String email;
    private Boolean activity = false;
    private Boolean admin = false;
}
