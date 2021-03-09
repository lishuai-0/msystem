package com.bug1024.msystem.utils.mymvc;

//通过元注解 给当前注解做一个描述


import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.PARAMETER)
public @interface Param {

    String value();//方法 将注解中存储的信息搬运走 给后续的反射
}
