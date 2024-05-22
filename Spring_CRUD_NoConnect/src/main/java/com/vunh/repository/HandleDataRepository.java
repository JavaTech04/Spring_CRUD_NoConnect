package com.vunh.repository;

import com.vunh.entity.Category;
import com.vunh.entity.Product;
import com.vunh.entity.User;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public abstract class HandleDataRepository {
    private final String location = "gallery/";
    Path path = Paths.get(location);

    public static List<User> getAllUser() {
        List<User> users = new ArrayList<>();
        users.add(new User("admin", "admin", "Nong Hoang Vu", "vunhph33506@fpt.edu.vn", true, true));
        users.add(new User("alice01", "aliceWonder", "Alice Wonderland", "alice@example.com", true, true));
        users.add(new User("bob123", "bobBuilder", "Bob Builder", "bob@example.com", true, false));
        users.add(new User("charlieP", "charliePeace", "Charlie Peace", "charlie@example.com", false, true));
        users.add(new User("davidG", "davidGamer", "David Gamer", "david@example.com", true, false));
        users.add(new User("eve007", "eveAgent", "Eve Agent", "eve@example.com", false, true));
        users.add(new User("frank88", "frankTank", "Frank Tank", "frank@example.com", true, false));
        users.add(new User("graceL", "graceLover", "Grace Lover", "grace@example.com", false, false));
        users.add(new User("henryH", "henryHero", "Henry Hero", "henry@example.com", true, true));
        users.add(new User("ivyI", "ivyIvy", "Ivy Ivy", "ivy@example.com", false, false));
        users.add(new User("jackJ", "jackJack", "Jack Jack", "jack@example.com", true, true));
        return users;
    }


    public static List<Category> getAllCategory() {
        List<Category> categories = new ArrayList<>();
        categories.add(new Category(0, "Please select a category"));
        categories.add(new Category(1, "IPhone"));
        categories.add(new Category(2, "Android"));
        categories.add(new Category(3, "Window"));
        categories.add(new Category(4, "Mac"));
        return categories;
    }

    public static List<Product> getAllProduct() {
        List<Product> products = new ArrayList<>();
        products.add(new Product(1, "Apple iPhone 15 Pro Max 256GB phone", "IPhone", "id1.png", 1.18133, true));
        products.add(new Product(2, "Apple iPhone 13 128GB phone", "IPhone", "id2.png", 537.47, true));
        products.add(new Product(11, "Lenovo think pad X1 carbon Gen 6 laptop i7-8650u/16Gb ram/1Tb ", "Window", "id11.png", 278.75, false));
        products.add(new Product(2, "Apple iPhone 14 128GB phone", "IPhone", "id3.png", 663.10, true));
        products.add(new Product(4, "Apple iPhone 15 128GB phone", "IPhone", "id4.png", 773.03, true));
        products.add(new Product(5, "Redmi Note 13 phone (6GB/128GB) - Genuine", "Android", "id5.png", 168.43, true));
        products.add(new Product(6, "Xiaomi Redmi Note 13 6GB/128GB Phone - Genuine Product", "Android", "id6.png", 161.71, true));
        products.add(new Product(7, "XIAOMI BLACK SHARK 5 INTERNATIONAL PHONE (Snapdragon 870 5G)", "Android", "id7.png", 134.74, true));
        products.add(new Product(8, "Xiaomi Black Shark phone (8G/128GB) - 12T warranty", "Android", "id8.png", 352.04, true));
        products.add(new Product(9, "Dell Latitude 3520 (Intel Core i3-1115G4/ 4GB/ 256GB SSD/ 15.6'' HD/ Fedora Linux", "Window", "id9.png", 475.83, true));
        products.add(new Product(10, "Apple MacBook Air (2020) M1 Chip Laptop, 13.3-inch, 8GB, 256GB SSD", "Mac", "id10.png", 737.70, true));
        return products;
    }

    public String handleMultipartFile(MultipartFile multipartFile) throws IOException {
        InputStream inputStream = multipartFile.getInputStream();
        Files.copy(inputStream, path.resolve(Objects.requireNonNull(multipartFile.getOriginalFilename())), StandardCopyOption.REPLACE_EXISTING);
        return multipartFile.getOriginalFilename();
    }
}
