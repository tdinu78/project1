package com.social.model;

import com.social.enums.FavEnum;

import javax.persistence.*;
import java.time.ZonedDateTime;

@Entity
@Table(name = "favorite")
public class Favorite {
    private Long id;
    private String usernameFrom;
    private String usernameTo;
    private FavEnum favorite;
    private ZonedDateTime issueTime;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsernameFrom() {
        return usernameFrom;
    }

    public void setUsernameFrom(String usernameFrom) {
        this.usernameFrom = usernameFrom;
    }

    public String getUsernameTo() {
        return usernameTo;
    }

    public void setUsernameTo(String usernameTo) {
        this.usernameTo = usernameTo;
    }

    public FavEnum getFavorite() {
        return favorite;
    }

    public void setFavorite(FavEnum favorite) {
        this.favorite = favorite;
    }

    public ZonedDateTime getIssueTime() {
        return issueTime;
    }

    public void setIssueTime(ZonedDateTime issueTime) {
        this.issueTime = issueTime;
    }
}
