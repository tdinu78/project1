package com.social.model;

import com.social.enums.LifeCycle;

import javax.persistence.*;
import java.time.ZonedDateTime;
import java.util.Set;

@Entity
@Table(name = "users")
public class User {
    private Long id;
    private String username;
    private String email;
    private String password;
    private String passwordConfirm;
    private boolean agreedTerms;
    private Set<Role> roles;
    private ZonedDateTime memeberSince;
    private ZonedDateTime lastActive;
    private Set<Location> locations;
    private String gender;
    private String heading;
    private String birthDate;
    private String lifestyle;
    private String netWorth;
    private String annualIncome;
    private String height;
    private String bodyType;
    private String ethnicity;
    private String hairColor;
    private String occupation;
    private String education;
    private String relationship;
    private String children;
    private String smoking;
    private String drinking;
    private String language;
    private Set<Picture> pics;
    private String location;
    private String descrAboutME;
    private String descrLookingFor;
    private String descrLookingForMore;
    private LifeCycle lifecycle;
    private Statistics statistics;
    private Set<Message> messagesSent;
    private Set<Message> messagesReceived;


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    @ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public ZonedDateTime getMemeberSince() {
        return memeberSince;
    }

    public void setMemeberSince(ZonedDateTime memeberSince) {
        this.memeberSince = memeberSince;
    }

    public ZonedDateTime getLastActive() {
        return lastActive;
    }

    public void setLastActive(ZonedDateTime lastActive) {
        this.lastActive = lastActive;
    }

    @OneToMany(mappedBy = "user_loc")
    public Set<Location> getLocations() {
        return locations;
    }

    public void setLocations(Set<Location> locations) {
        this.locations = locations;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getHeading() {
        return heading;
    }

    public void setHeading(String heading) {
        this.heading = heading;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getLifestyle() {
        return lifestyle;
    }

    public void setLifestyle(String lifestyle) {
        this.lifestyle = lifestyle;
    }

    public String getNetWorth() {
        return netWorth;
    }

    public void setNetWorth(String netWorth) {
        this.netWorth = netWorth;
    }

    public String getAnnualIncome() {
        return annualIncome;
    }

    public void setAnnualIncome(String annualIncome) {
        this.annualIncome = annualIncome;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getBodyType() {
        return bodyType;
    }

    public void setBodyType(String bodyType) {
        this.bodyType = bodyType;
    }

    public String getEthnicity() {
        return ethnicity;
    }

    public void setEthnicity(String ethnicity) {
        this.ethnicity = ethnicity;
    }

    public String getHairColor() {
        return hairColor;
    }

    public void setHairColor(String hairColor) {
        this.hairColor = hairColor;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getRelationship() {
        return relationship;
    }

    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }

    public String getChildren() {
        return children;
    }

    public void setChildren(String children) {
        this.children = children;
    }

    public String getSmoking() {
        return smoking;
    }

    public void setSmoking(String smoking) {
        this.smoking = smoking;
    }

    public String getDrinking() {
        return drinking;
    }

    public void setDrinking(String drinking) {
        this.drinking = drinking;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescrAboutME() {
        return descrAboutME;
    }

    public void setDescrAboutME(String descrAboutME) {
        this.descrAboutME = descrAboutME;
    }

    public String getDescrLookingFor() {
        return descrLookingFor;
    }

    public void setDescrLookingFor(String descrLookingFor) {
        this.descrLookingFor = descrLookingFor;
    }

    public String getDescrLookingForMore() {
        return descrLookingForMore;
    }

    public void setDescrLookingForMore(String descrLookingForMore) {
        this.descrLookingForMore = descrLookingForMore;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isAgreedTerms() {
        return agreedTerms;
    }

    public void setAgreedTerms(boolean agreedTerms) {
        this.agreedTerms = agreedTerms;
    }

    public LifeCycle getLifecycle() {
        return lifecycle;
    }

    public void setLifecycle(LifeCycle lifecycle) {
        this.lifecycle = lifecycle;
    }

    @OneToMany(mappedBy="user")
    public Set<Picture> getPics() {
        return pics;
    }

    public void setPics(Set<Picture> pics) {
        this.pics = pics;
    }

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "user_st")
    public Statistics getStatistics() {
        return statistics;
    }

    public void setStatistics(Statistics statistics) {
        this.statistics = statistics;
    }

    @OneToMany(mappedBy = "sender")
    public Set<Message> getMessagesSent() {
        return messagesSent;
    }

    public void setMessagesSent(Set<Message> messagesSent) {
        this.messagesSent = messagesSent;
    }

    @OneToMany(mappedBy = "receiver")
    public Set<Message> getMessagesReceived() {
        return messagesReceived;
    }

    public void setMessagesReceived(Set<Message> messagesReceived) {
        this.messagesReceived = messagesReceived;
    }
}
