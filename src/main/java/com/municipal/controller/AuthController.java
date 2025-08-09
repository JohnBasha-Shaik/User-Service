package com.municipal.controller;

import com.municipal.entity.Role;
import com.municipal.entity.User;
import com.municipal.service.UserService;
import com.municipal.util.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class AuthController {
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private JwtUtil jwtUtil;
    
    @Autowired
    private AuthenticationManager authenticationManager;
    
    // Display login page
    @GetMapping("/login")
    public String loginPage(Model model) {
        return "login";
    }
    
    // Display registration page
    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("roles", Role.values());
        return "register";
    }
    
    // Handle login form submission
    @PostMapping("/auth/login")
    @ResponseBody
    public ResponseEntity<?> authenticateUser(@RequestParam String email, 
                                              @RequestParam String password) {
        try {
            // Authenticate user
            authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(email, password)
            );
            
            UserDetails userDetails = userService.loadUserByUsername(email);
            User user = userService.findByEmail(email).orElseThrow();
            
            String token = jwtUtil.generateToken(userDetails, user.getRole().name());
            
            Map<String, Object> response = new HashMap<>();
            response.put("token", token);
            response.put("role", user.getRole().name());
            response.put("name", user.getName());
            response.put("email", user.getEmail());
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", "Invalid email or password");
            return ResponseEntity.badRequest().body(error);
        }
    }
    
    // Handle registration form submission
    @PostMapping("/auth/register")
    @ResponseBody
    public ResponseEntity<?> registerUser(@RequestParam String name,
                                          @RequestParam String email,
                                          @RequestParam String password,
                                          @RequestParam String role) {
        try {
            Role userRole = Role.valueOf(role.toUpperCase());
            User user = userService.registerUser(name, email, password, userRole);
            
            Map<String, Object> response = new HashMap<>();
            response.put("message", "User registered successfully");
            response.put("userId", user.getId());
            response.put("name", user.getName());
            response.put("email", user.getEmail());
            response.put("role", user.getRole().name());
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }
}