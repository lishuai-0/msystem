package com.bug1024.msystem.utils.mymvc;

public class ControllerNotFoundException extends RuntimeException {

    public ControllerNotFoundException(){}
    public ControllerNotFoundException(String message){
        super(message);
    }
}
