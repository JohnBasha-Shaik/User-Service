package com.example.municipal.controller;

import com.example.municipal.dto.JwtResponse;
import com.example.municipal.dto.LoginRequest;
import com.example.municipal.dto.RegisterRequest;
import com.example.municipal.entity.Role;
import com.example.municipal.service.UserService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class AuthController {

    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("loginRequest", new LoginRequest());
        return "login";
    }

    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("registerRequest", new RegisterRequest());
        model.addAttribute("roles", Role.values());
        return "registration";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("registerRequest") RegisterRequest request, Model model) {
        try {
            userService.register(request);
            model.addAttribute("success", "Registration successful. Please log in.");
            model.addAttribute("loginRequest", new LoginRequest());
            return "login";
        } catch (Exception ex) {
            model.addAttribute("error", ex.getMessage());
            model.addAttribute("roles", Role.values());
            return "registration";
        }
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("loginRequest") LoginRequest request, HttpServletResponse response, Model model) {
        try {
            JwtResponse jwt = userService.authenticate(request);
            Cookie cookie = new Cookie("jwt", jwt.getToken());
            cookie.setHttpOnly(true);
            cookie.setPath("/");
            // Set secure(true) if serving over HTTPS
            cookie.setSecure(false);
            cookie.setMaxAge(24 * 60 * 60); // 1 day
            response.addCookie(cookie);

            if (jwt.getRole() == Role.ADMIN) {
                return "redirect:/admin/home";
            } else if (jwt.getRole() == Role.STAFF) {
                return "redirect:/staff/home";
            } else {
                return "redirect:/citizen/home";
            }
        } catch (Exception ex) {
            model.addAttribute("error", ex.getMessage());
            model.addAttribute("loginRequest", new LoginRequest());
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletResponse response) {
        Cookie cookie = new Cookie("jwt", null);
        cookie.setPath("/");
        cookie.setHttpOnly(true);
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        return "redirect:/auth/login";
    }
}