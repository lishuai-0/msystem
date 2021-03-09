package com.bug1024.msystem.utils.pool;

public class ConnectionPoolBusyException extends RuntimeException {

    public ConnectionPoolBusyException(){}
    public ConnectionPoolBusyException(String mess){
        super(mess);
    }
}
