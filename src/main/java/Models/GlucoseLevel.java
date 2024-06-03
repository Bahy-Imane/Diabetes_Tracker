package Models;

import java.time.LocalDateTime;

public class GlucoseLevel {
    private Integer gId;
    private LocalDateTime dateTime;
    private Double glucoseLevel;
    private Patient patient;

    public GlucoseLevel() {
    }

    public GlucoseLevel(Integer gId, LocalDateTime dateTime, Double glucoseLevel, Patient patient) {
        this.gId = gId;
        this.dateTime = dateTime;
        this.glucoseLevel = glucoseLevel;
        this.patient = patient;
    }

    public Integer getgId() {
        return gId;
    }

    public void setgId(Integer gId) {
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
}
