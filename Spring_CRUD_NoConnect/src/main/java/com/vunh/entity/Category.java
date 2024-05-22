package com.vunh.entity;

import lombok.*;

@AllArgsConstructor
@Getter
public class Category {
    private int id;
    private String name;

    public Category getSelf() {
        return this;
    }
}
