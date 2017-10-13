package com.xiaoji.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="blog")
public class BloggerController {
    @RequestMapping(value = "hello")
    @ResponseBody
    public String hello(){
        return "hello";
    }
}
