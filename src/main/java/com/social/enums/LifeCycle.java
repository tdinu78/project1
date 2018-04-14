package com.social.enums;

public enum LifeCycle {
    CREATED("CREATED"),
    APPROVED("APPROVED"),
    DELETED("DELETED");

    private String type;

    LifeCycle(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

}
