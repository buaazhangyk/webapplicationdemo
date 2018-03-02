package com.zhangyk.dao;

public class DemoDAO {

    private String value;

    public DemoDAO(String value) {
        System.out.println("create DemoDAO");
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
