package com.example.municipal.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Set;
import java.util.stream.Collectors;

@Controller
public class HomeController {

    @GetMapping("/")
    public String root(Authentication authentication) {
        if (authentication == null || !authentication.isAuthenticated()) {
            return "redirect:/auth/login";
        }
        Set<String> roles = authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.toSet());
        if (roles.contains("ROLE_ADMIN")) {
            return "redirect:/admin/home";
        } else if (roles.contains("ROLE_STAFF")) {
            return "redirect:/staff/home";
        } else {
            return "redirect:/citizen/home";
        }
    }

    @PreAuthorize("hasRole('CITIZEN')")
    @GetMapping("/citizen/home")
    public String citizenHome(Model model, Authentication auth) {
        model.addAttribute("username", auth.getName());
        return "citizenHome";
    }

    @PreAuthorize("hasRole('STAFF')")
    @GetMapping("/staff/home")
    public String staffHome(Model model, Authentication auth) {
        model.addAttribute("username", auth.getName());
        return "staffHome";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/admin/home")
    public String adminHome(Model model, Authentication auth) {
        model.addAttribute("username", auth.getName());
        return "adminHome";
    }
}