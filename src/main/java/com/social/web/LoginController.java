package com.social.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.social.model.Location;
import com.social.model.User;
import com.social.service.Messages;
import com.social.service.SecurityService;
import com.social.service.UserService;
import com.social.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.Principal;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    HttpServletRequest request;

    @Autowired
    ServletContext context;

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private Messages msg;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Your username and password is invalid.");
            return "login";
        }
        if (logout != null) {
            model.addAttribute("message", "You have been logged out successfully.");
            return "index";
        }
        return "login";
    }


    @RequestMapping(value = "/successlogin")
    public String index(ModelMap model, Principal principal){
        Location location = userService.getClientLocation();
        User loggedUser = userService.findByUsername(principal.getName());
        location.setUser_loc(loggedUser);
        userService.save(location);
        return "index";
    }
}
