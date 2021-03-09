package com.bug1024.msystem;

import org.junit.Test;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class msystemApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        // 配置Springboot的应用环境
        SpringApplicationBuilder sources = builder.sources(msystemApplication.class);
        return sources;
    }
    public static void main(String[] args) {
        SpringApplication.run(msystemApplication.class, args);
    }
    @Test
    void helloWorld(){
        System.out.println("helloWord");
    }

    @Test
    void hiWorld(){
        System.out.println("hi world");
    }

}
