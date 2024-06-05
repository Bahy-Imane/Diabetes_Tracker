package com.Services;
import com.Models.Patient;
import com.repository.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

import java.util.List;


@Service
@Transactional
public class PatientService {

    @Autowired
    private PatientRepository patientRepository;

    public  void addPatient(Patient patient){
        patientRepository.save(patient);
    }

    public List<Patient> listAll() {
        return (List<Patient>) patientRepository.findAll();
    }

    public void deletePatient(Long pId){
        patientRepository.deleteById(pId);
    }
}




