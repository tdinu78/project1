package com.social.service;

import com.social.model.Location;
import com.social.model.Picture;
import com.social.model.User;

public interface UserService {
    void save(User user);

    void save(Location location);

    void save(Picture picture);

    User findByUsername(String username);

    User findByEmail(String email);

    Location getClientLocation();

    String getClientIpAddr();
}
