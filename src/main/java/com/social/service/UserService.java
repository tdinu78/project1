package com.social.service;

import com.social.model.Location;
import com.social.model.User;

public interface UserService {
    void save(User user);

    void save(Location location);

    User findByUsername(String username);

    User findByEmail(String email);

    Location getClientLocation();

    public String getClientIpAddr();
}
