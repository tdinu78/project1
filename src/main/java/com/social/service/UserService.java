package com.social.service;

import com.social.model.Location;
import com.social.model.Picture;
import com.social.model.User;

import java.util.List;

public interface UserService {
    void save(User user);

    void save(Location location);

    void save(Picture picture);

//    List<Picture> listPictures();
//
//    Picture getFile(Long id);

    User findByUsername(String username);

    User findByEmail(String email);

    Location getClientLocation();

    String getClientIpAddr();
}
