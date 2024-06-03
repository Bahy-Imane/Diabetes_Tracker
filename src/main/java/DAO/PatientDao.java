package DAO;

import Models.Patient;

import java.util.List;

public interface PatientDao {
    void addPatient(Patient patient);
    void deletePatient(Patient patient);

}
