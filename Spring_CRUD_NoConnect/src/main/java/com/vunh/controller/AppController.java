package com.vunh.controller;

import com.vunh.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class AppController {
    @Autowired
    private ProductService productService;

    @GetMapping
    public String index(Model model, @RequestParam(name = "q", defaultValue = "", required = false) String q) {
        model.addAttribute("fragment", "fragments/main.jsp");
        model.addAttribute("q", q.trim());
        model.addAttribute("products", this.productService.getProducts(q));
        return "index";
    }

    @GetMapping("/{id}")
    public String detail(@PathVariable int id, Model model) {
        model.addAttribute("product", this.productService.finById(id));
        model.addAttribute("fragment", "products/product_detail.jsp");
        return "index";
    }

    @RequestMapping("/img/{photo}")
    ResponseEntity<ByteArrayResource> getImage(@PathVariable("photo") String photo) {
        if (photo != null && !photo.isEmpty()) {
            try {
                Path fileName = Paths.get("gallery", photo);
                byte[] buffer = Files.readAllBytes(fileName);
                ByteArrayResource byteArrayResource = new ByteArrayResource(buffer);
                MediaType mediaType;
                if (photo.toLowerCase().endsWith(".jpg") || photo.toLowerCase().endsWith(".jpeg")) {
                    mediaType = MediaType.IMAGE_JPEG;
                } else if (photo.toLowerCase().endsWith(".png")) {
                    mediaType = MediaType.IMAGE_PNG;
                } else {
                    return ResponseEntity.badRequest().build();
                }
                return ResponseEntity.ok()
                        .contentLength(buffer.length)
                        .contentType(mediaType)
                        .body(byteArrayResource);
            } catch (Exception e) {
                throw new RuntimeException("Not found!");
            }
        }
        return ResponseEntity.badRequest().build();
    }
}
