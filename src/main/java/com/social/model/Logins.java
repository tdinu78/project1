package com.social.model;

import com.social.enums.LifeCycle;
import javax.persistence.*;
import java.time.ZonedDateTime;


@Entity
@Table(name = "logins")
public class Logins {
    private Long id;
    private ZonedDateTime loginTime;
    private String loginLocation;
    private LifeCycle lifecycle;
    private Statistics statistics;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public ZonedDateTime getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(ZonedDateTime loginTime) {
        this.loginTime = loginTime;
    }

    public String getLoginLocation() {
        return loginLocation;
    }

    public void setLoginLocation(String loginLocation) {
        this.loginLocation = loginLocation;
    }

    public LifeCycle getLifecycle() {
        return lifecycle;
    }

    public void setLifecycle(LifeCycle lifecycle) {
        this.lifecycle = lifecycle;
    }

    @ManyToOne
    @JoinColumn(name = "statistics_id")
    public Statistics getStatistics() {
        return statistics;
    }

    public void setStatistics(Statistics statistics) {
        this.statistics = statistics;
    }
}
