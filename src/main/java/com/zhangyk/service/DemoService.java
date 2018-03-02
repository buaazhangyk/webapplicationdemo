package com.zhangyk.service;

import com.zhangyk.dao.DemoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("demoService")
public class DemoService {

    @Autowired
    private DemoDAO demoDAO;

    public String getDemo() {
        return demoDAO.getValue();
    }
}
