package com.vunh.controller;

import com.vunh.entity.User;
import com.vunh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping
    String index(Model model, @RequestParam(name = "q", required = false, defaultValue = "") String q) {
        model.addAttribute("q", q);
        model.addAttribute("fragment", "users/index.jsp");
        model.addAttribute("users", this.userService.findAll(q));
        return "index";
    }

    void setup(Model model, User user, String action, String title, Boolean type) {
        model.addAttribute("user", user);
        model.addAttribute("action", "/" + action);
        model.addAttribute("title", title);
        model.addAttribute("type", type);
        model.addAttribute("fragment", "users/user_action.jsp");
    }

    @GetMapping("/add")
    String add(Model model) {
        setup(model, new User(), "user/add", "New ", false);
        return "index";
    }

    @PostMapping("/add")
    String store(@Validated @ModelAttribute("user") User user, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            setup(model, user, "user/add", "New ", false);
            model.addAttribute("error", true);
            return "index";
        }
        this.userService.save(user);
        return "redirect:/user?new_user";
    }

    @GetMapping("/edit/{username}")
    String edit(@PathVariable String username, Model model) {
        setup(model, this.userService.findByUsername(username), "user/edit", "Update ", true);
        return "index";
    }

    @PostMapping("/edit")
    String update(@Validated @ModelAttribute("user") User user, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            setup(model, user, "user/edit", "Update ", true);
            model.addAttribute("error", true);
            return "index";
        }
        this.userService.update(user);
        return "redirect:/user?new_update";
    }

    @GetMapping("/{username}")
    String show(@PathVariable String username) {
        this.userService.deleteByUsername(username);
        return "redirect:/user?delete_success";
    }
}
