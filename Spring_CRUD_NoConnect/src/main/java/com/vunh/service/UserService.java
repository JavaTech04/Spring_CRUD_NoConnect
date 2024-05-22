package com.vunh.service;

import com.vunh.entity.User;
import com.vunh.repository.HandleDataRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    private final List<User> users;

    public UserService() {
        this.users = HandleDataRepository.getAllUser();
    }

    public List<User> findAll(String q) {
        return this.users.stream().filter(query ->
                        query.getUsername().toLowerCase().contains(q.toLowerCase()) ||
                                query.getFullName().toLowerCase().contains(q.toLowerCase()) ||
                                query.getFullName().toLowerCase().contains(q.toLowerCase()))
                .toList();
    }

    public User findByUsername(String username) {
        return this.users.stream().filter(user -> user.getUsername().equals(username)).findFirst().orElse(null);
    }

    public void save(User user) {
        this.users.add(user);
    }

    public void update(User user) {
        this.users.stream().filter(u -> u.getUsername().equals(user.getUsername())).findFirst().ifPresent(change -> {
            change.setFullName(user.getFullName());
            change.setPassword(user.getPassword());
            change.setEmail(user.getEmail());
            change.setActivity(user.getActivity());
            change.setAdmin(user.getAdmin());
        });
    }

    public void deleteByUsername(String username) {
        this.users.removeIf(u -> u.getUsername().equals(username));
    }
}
