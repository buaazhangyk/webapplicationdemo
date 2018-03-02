package com.zhangyk.controller;

import com.zhangyk.service.DemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by yunkai on 7/8/17.
 */
@Controller
public class HelloWorldController {

    @Autowired
    private DemoService demoService;

    @RequestMapping(value = "/hello")
    @ResponseBody
    public String healthCheck() {
        return demoService.getDemo();
    }
}
