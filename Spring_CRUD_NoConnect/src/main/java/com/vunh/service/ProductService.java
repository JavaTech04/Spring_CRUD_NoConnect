package com.vunh.service;

import com.vunh.entity.Category;
import com.vunh.entity.Product;
import com.vunh.repository.HandleDataRepository;
import lombok.Getter;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
@Getter
public class ProductService extends HandleDataRepository {
    private final List<Product> products;

    public ProductService() {
        products = HandleDataRepository.getAllProduct();
    }

    public List<Product> getProducts(String q) {
        return this.products.stream().filter(prd ->
                prd.getName().trim().toLowerCase().contains(q.trim().toLowerCase())
                        || prd.getCategoryId().toLowerCase().trim().contains(q.trim().toLowerCase())
        ).toList();
    }

    public Product finById(int id) {
        return products.stream().filter(product -> product.getId() == id).findFirst().orElse(null);
    }

    public List<Category> getCategories() {
        return HandleDataRepository.getAllCategory();
    }

    public void delete(int id) {
        products.removeIf(product -> product.getId() == id);
    }

    public void save(Product product) {
        product.setId(this.getProducts().size() + 1);
        products.add(product);
    }

    public void update(Product product) {
        this.getProducts().stream().filter(prd -> Objects.equals(prd.getId(), product.getId())).findFirst().ifPresent(prd -> {
            prd.setName(product.getName());
            prd.setPrice(product.getPrice());
            prd.setCategoryId(product.getCategoryId());
            prd.setImage(product.getImage());
            prd.setAvailable(product.getAvailable());
        });
    }
}
