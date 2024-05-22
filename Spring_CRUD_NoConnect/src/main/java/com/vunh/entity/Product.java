package com.vunh.entity;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.*;
import org.springframework.stereotype.Component;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Component
@ToString
public class Product {
    private Integer id;
    @NotBlank
    private String name;
    @NotNull
    private String categoryId;
    private String image;
    @NotNull
    @Positive
    private Double price;
    private Boolean available = false;

}
