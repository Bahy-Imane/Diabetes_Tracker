package com.Services;

import Models.Patient;
import com.repository.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class PatientService {

    @Autowired
    private PatientRepository patientRepository;

    @Transactional
    public void addPatient(Patient patient) {
        patientRepository.save(patient);

    }

    public void deletePatient(Patient patient){
        patientRepository.delete(patient);
    }

}

