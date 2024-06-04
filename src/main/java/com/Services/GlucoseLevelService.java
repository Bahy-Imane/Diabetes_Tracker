package com.Services;

import Models.GlucoseLevel;
import Models.Patient;
import com.repository.GlucoseLevelRepository;
import com.repository.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class GlucoseLevelService {

    @Autowired
    private GlucoseLevelRepository glucoseLevelRepository;

    @Transactional
    public void addGlucoseLevel(GlucoseLevel glucoseLevel) {
        glucoseLevelRepository.save(glucoseLevel);
    }


    public void displayGlucoseLevel(GlucoseLevel glucoseLevel) {
        glucoseLevelRepository.findAll();
    }


    public void deleteGlucoseLevel(GlucoseLevel glucoseLevel) {
        glucoseLevelRepository.delete(glucoseLevel);

    }

}
