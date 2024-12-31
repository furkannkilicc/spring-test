package com.example.furkantest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String sayHello() {
        return "Selam, Furkan! Bu uygulama Docker üzerinde çalışıyor. WEBHOOK TEST";
    }
}