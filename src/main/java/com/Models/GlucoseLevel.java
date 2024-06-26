package com.Models;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDateTime;




@Entity
@Table(name = "glucose_level")
public class GlucoseLevel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "g_id")
    private Long gId;

    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    @Column(name = "date_time")
    private LocalDateTime dateTime;

    @Column(name = "glucose_level")
    private Double glucoseLevel;

    @ManyToOne
    private Patient patient;


    public GlucoseLevel() {
    }

    public GlucoseLevel(Long gId, LocalDateTime dateTime, Double glucoseLevel, Patient patient) {
        this.gId = gId;
        this.dateTime = dateTime;
        this.glucoseLevel = glucoseLevel;
        this.patient = patient;
    }

    public Long getgId() {
        return gId;
    }

    public void setgId(Long gId) {
        this.gId = gId;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    public Double getGlucoseLevel() {
        return glucoseLevel;
    }

    public void setGlucoseLevel(Double glucoseLevel) {
        this.glucoseLevel = glucoseLevel;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    @Override
    public String toString() {
        return "GlucoseLevel{" +
                "gId=" + gId +
                ", dateTime=" + dateTime +
                ", glucoseLevel=" + glucoseLevel +
                ", patient=" + patient +
                '}';
    }
}
