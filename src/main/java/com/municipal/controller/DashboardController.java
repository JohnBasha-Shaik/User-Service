package com.municipal.controller;

import com.municipal.entity.Role;
import com.municipal.entity.User;
import com.municipal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class DashboardController {
    
    @Autowired
    private UserService userService;
    
    // Home page - redirects to appropriate dashboard based on role
    @GetMapping("/")
    public String home() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication == null || !authentication.isAuthenticated() || 
            authentication.getPrincipal().equals("anonymousUser")) {
            return "redirect:/login";
        }
        
        String email = authentication.getName();
        User user = userService.findByEmail(email).orElse(null);
        
        if (user != null) {
            switch (user.getRole()) {
                case ADMIN:
                    return "redirect:/admin/dashboard";
                case MUNICIPAL_STAFF:
                    return "redirect:/staff/dashboard";
                case CITIZEN:
                    return "redirect:/citizen/dashboard";
            }
        }
        
        return "redirect:/login";
    }
    
    // Admin Dashboard
    @GetMapping("/admin/dashboard")
    @PreAuthorize("hasRole('ADMIN')")
    public String adminDashboard(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        User currentUser = userService.findByEmail(email).orElse(null);
        
        List<User> allUsers = userService.getAllUsers();
        long citizenCount = userService.countUsersByRole(Role.CITIZEN);
        long staffCount = userService.countUsersByRole(Role.MUNICIPAL_STAFF);
        long adminCount = userService.countUsersByRole(Role.ADMIN);
        
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("allUsers", allUsers);
        model.addAttribute("citizenCount", citizenCount);
        model.addAttribute("staffCount", staffCount);
        model.addAttribute("adminCount", adminCount);
        model.addAttribute("totalUsers", allUsers.size());
        
        return "adminHome";
    }
    
    // Municipal Staff Dashboard
    @GetMapping("/staff/dashboard")
    @PreAuthorize("hasAnyRole('MUNICIPAL_STAFF', 'ADMIN')")
    public String staffDashboard(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        User currentUser = userService.findByEmail(email).orElse(null);
        
        List<User> citizens = userService.findByRole(Role.CITIZEN);
        long citizenCount = userService.countUsersByRole(Role.CITIZEN);
        
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("citizens", citizens);
        model.addAttribute("citizenCount", citizenCount);
        
        return "staffHome";
    }
    
    // Citizen Dashboard
    @GetMapping("/citizen/dashboard")
    @PreAuthorize("hasAnyRole('CITIZEN', 'MUNICIPAL_STAFF', 'ADMIN')")
    public String citizenDashboard(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        User currentUser = userService.findByEmail(email).orElse(null);
        
        model.addAttribute("currentUser", currentUser);
        
        return "citizenHome";
    }
    
    // Logout
    @GetMapping("/logout")
    public String logout() {
        SecurityContextHolder.clearContext();
        return "redirect:/login";
    }
}