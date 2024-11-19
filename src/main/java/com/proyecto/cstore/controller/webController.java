package com.proyecto.cstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class webController {

    @GetMapping(value = {"/{path:[^\\.]*}"})
    public String redirect() {
        return "forward:/index.html";
    }
}

