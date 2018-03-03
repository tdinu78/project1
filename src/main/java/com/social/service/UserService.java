package com.social.service;

import com.social.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
