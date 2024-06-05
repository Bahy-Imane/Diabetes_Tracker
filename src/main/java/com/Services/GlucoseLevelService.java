package com.Services;

import java.util.List; // Import for retrieving all glucose levels

import com.Models.GlucoseLevel;
import com.repository.GlucoseLevelRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class GlucoseLevelService {

    @Autowired
    private GlucoseLevelRepository glucoseLevelRepository;

    public void addGlucoseLevel(GlucoseLevel glucoseLevel) {
        glucoseLevelRepository.save(glucoseLevel);
    }

    public List<GlucoseLevel> listAll(){
        return (List<GlucoseLevel>)glucoseLevelRepository.findAll();
    }

    public void deleteGlucoseLevel(Long gId) {
        glucoseLevelRepository.deleteById(gId);
    }
}


