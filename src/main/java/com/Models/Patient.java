package com.Models;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "patient")
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "p_id")
    private long pId;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "email")
    private String email;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "address")
    private String address;

    @Column(name = "pic")
    private String picture;

    @OneToMany(mappedBy = "patient")
    private List<GlucoseLevel> glucoseLevels = new ArrayList<>();


    public Patient() {
    }

    public Patient(long pId, String firstName, String lastName, String email, String phoneNumber, String address, String picture, List<GlucoseLevel> glucoseLevels) {
        this.pId = pId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.picture = picture;
        this.glucoseLevels = glucoseLevels;
    }

    public long getpId() {
        return pId;
    }

    public void setpId(long pId) {
        this.pId = pId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public List<GlucoseLevel> getGlucoseLevels() {
        return glucoseLevels;
    }

    public void setGlucoseLevels(List<GlucoseLevel> glucoseLevels) {
        this.glucoseLevels = glucoseLevels;
    }

    @Override
    public String toString() {
        return "Patient{" +
                "pId=" + pId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", address='" + address + '\'' +
                ", picture='" + picture + '\'' +
                ", glucoseLevels=" + glucoseLevels +
                '}';
    }
}

