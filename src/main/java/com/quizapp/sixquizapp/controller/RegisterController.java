package com.quizapp.sixquizapp.controller;

import com.quizapp.sixquizapp.model.User;
import com.quizapp.sixquizapp.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class RegisterController {

    private final UserService userService;

    public RegisterController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String showRegisterPage() {
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user, @RequestParam("type") String type, Model model, HttpServletRequest request) {
        if ("admin".equals(type)) {
            user.setIsAdmin(true);
        } else {
            user.setIsAdmin(false);
        }

        User savedUser = userService.createUser(user);
        if (savedUser != null) {
            model.addAttribute("message", "User registered successfully!");
            // Set user in session
            HttpSession session = request.getSession();
            session.setAttribute("user", savedUser);
        } else {
            model.addAttribute("message", "Failed to register user. Please try again.");
        }
        return "register";
    }
}
