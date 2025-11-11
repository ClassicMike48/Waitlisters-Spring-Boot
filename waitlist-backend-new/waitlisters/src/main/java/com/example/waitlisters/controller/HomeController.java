package com.example.waitlisters.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController{

    @GetMapping("/")
    public String getHomePage() {
        return "Hello World!";
    }
    
}
