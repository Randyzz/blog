package com.xiaoji.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="blog")
public class BloggerController {
    @RequestMapping(value = "hello")
    public String hello(){
        return "admin/index/index";
    }
}
