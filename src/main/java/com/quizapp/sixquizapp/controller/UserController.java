package com.quizapp.sixquizapp.controller;



import com.quizapp.sixquizapp.model.Quiz;
import com.quizapp.sixquizapp.model.User;
import com.quizapp.sixquizapp.service.QuizService;
import com.quizapp.sixquizapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/user")
public class UserController {
   @Autowired
    QuizService quizService;
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping
    public User createUser(@RequestBody User user) {
        return userService.createUser(user);

    }

    @GetMapping("/{id}")
    public Optional<User> getUserById(@PathVariable Long id) {
        return userService.getUserById(id);
    }

    @PutMapping("/{id}")
    public User updateUser(@PathVariable Long id, @RequestBody User user) {
        return userService.updateUser(id, user);
    }

    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
    }

    @GetMapping
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }

    @GetMapping("/registerUser")
    public String showUserRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/registerUser")
    public String registerUser(@ModelAttribute("user") User user) {
        user.setIsAdmin(false); // Set isAdmin to false for user registration
        userService.createUser(user);
        return "redirect:/";
    }





}
