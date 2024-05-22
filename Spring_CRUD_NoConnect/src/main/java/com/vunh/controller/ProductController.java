package com.vunh.controller;

import com.vunh.entity.Product;
import com.vunh.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

import static java.lang.StringTemplate.STR;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping
    String index(Model model, @RequestParam(required = false, name = "q", defaultValue = "") String q) {
        model.addAttribute("products", this.productService.getProducts(q).reversed());
        model.addAttribute("q", q);
        model.addAttribute("fragment", "products/index.jsp");
        return "index";
    }

    void setup(Model model, Product product, String title, String action, String url) {
        model.addAttribute("product", product);
        model.addAttribute("action", action);
        model.addAttribute("title", title);
        model.addAttribute("category", this.productService.getCategories());
        model.addAttribute("fragment", STR."products/\{url}");
    }

    @GetMapping("/{id}")
    String delete(@PathVariable int id, Model model) {
        this.productService.delete(id);
        return "redirect:/product?deleted";
    }

    @GetMapping("/add")
    String create(Model model) {
        setup(model, new Product(), "New", "/product/add", "product_new.jsp");
        return "index";
    }

    @PostMapping("/add")
    String add(
            @Validated
            @ModelAttribute("product") Product product,
            BindingResult bindingResult, Model model,
            @RequestParam("__") MultipartFile image
    ) throws IOException {
        if (image.isEmpty()) {
            bindingResult.rejectValue("image", "error", "Please select an image file");
        }
        if (product.getCategoryId().contains("Please select a category")) {
            bindingResult.rejectValue("categoryId", "error", "Please select a category");
        }
        if (bindingResult.hasErrors()) {
            setup(model, product, "New", "/product/add", "product_new.jsp");
            model.addAttribute("error", true);
            return "index";
        }
        product.setImage(this.productService.handleMultipartFile(image));
        this.productService.save(product);
        return "redirect:/product?new_success";
    }

    @GetMapping("/edit/{id}")
    String edit(Model model, @PathVariable int id) {
        setup(model, this.productService.finById(id), "Update", STR."/product/edit?id=\{id}", "product_edit.jsp");
        return "index";
    }

    @PostMapping("/edit")
    String update(@Validated @ModelAttribute("product") Product product,
                  BindingResult bindingResult, Model model,
                  @RequestParam("__") MultipartFile image
    ) throws IOException {
        if (image.isEmpty()) {
            product.setImage(this.productService.finById(product.getId()).getImage());
        } else {
            product.setImage(this.productService.handleMultipartFile(image));
        }
        if (product.getCategoryId().contains("Please select a category")) {
            bindingResult.rejectValue("categoryId", "error", "Please select a category");
        }
        if (bindingResult.hasErrors()) {
            setup(model, product, "Update", STR."/product/edit?id=\{product.getId()}", "product_edit.jsp");
            model.addAttribute("error", true);
            return "index";
        }
        this.productService.update(product);
        return "redirect:/product?update_success";
    }
}
