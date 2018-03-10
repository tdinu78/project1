package com.social.model;

import com.social.enums.LifeCycle;
import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "statistics")
public class Statistics {
    private Long id;
    private User user_st;
    private Set<Logins> logins;
    private LifeCycle lifecycle;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @OneToOne(fetch = FetchType.LAZY)
    @PrimaryKeyJoinColumn
    public User getUser_st() {
        return user_st;
    }

    public void setUser_st(User user_st) {
        this.user_st = user_st;
    }

    @OneToMany(mappedBy="statistics")
    public Set<Logins> getLogins() {
        return logins;
    }

    public void setLogins(Set<Logins> logins) {
        this.logins = logins;
    }

    public LifeCycle getLifecycle() {
        return lifecycle;
    }

    public void setLifecycle(LifeCycle lifecycle) {
        this.lifecycle = lifecycle;
    }
}
