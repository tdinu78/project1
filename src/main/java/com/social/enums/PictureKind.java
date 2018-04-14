package com.social.enums;

public enum PictureKind {
    AVATAR("AVATAR"),
    PUBLIC("PUBLIC"),
    PRIVATE("PRIVATE");

    private String type;

    PictureKind(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

}
