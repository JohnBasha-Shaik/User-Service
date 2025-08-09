package com.municipal.entity;

public enum Role {
    CITIZEN("CITIZEN"),
    MUNICIPAL_STAFF("MUNICIPAL_STAFF"),
    ADMIN("ADMIN");
    
    private final String value;
    
    Role(String value) {
        this.value = value;
    }
    
    public String getValue() {
        return value;
    }
    
    @Override
    public String toString() {
        return value;
    }
}