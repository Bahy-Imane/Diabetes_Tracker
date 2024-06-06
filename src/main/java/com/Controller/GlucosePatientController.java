package com.Controller;

import com.Models.GlucoseLevel;
import com.Models.Patient;
import com.Services.GlucoseLevelService;
import com.Services.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@Transactional
public class GlucosePatientController {

    @Autowired
    GlucoseLevelService glucoseLevelService;
    PatientService patientService;


    @RequestMapping("/homeDiabetes")
    public ModelAndView home(){
        List<GlucoseLevel> listGlucoseLevel = glucoseLevelService.listAll();
        ModelAndView mav = new ModelAndView("/GlucoseLevel/displayGlucoseLevel");
        mav.addObject("listGlucoseLevel", listGlucoseLevel);
        return mav;
    }

    @RequestMapping("/new1")
    public String addNewGlucoseLevel(@RequestParam ("patientId") Long patientId, Model model){
        GlucoseLevel glucoseLevel = new GlucoseLevel();
        Patient patient = new Patient();
        String pId = String.valueOf(patientService.getPatient(patientId));
        model.addAttribute("glucoseLevel",glucoseLevel);
        model.addAttribute("pId", pId);
        return "/GlucoseLevel/addGlucoseLevel";

    }

    @RequestMapping(value = "/addGlucoseLevel",method = RequestMethod.POST)
    public String addGlucoseLevel(@ModelAttribute("glucoseLevel")GlucoseLevel glucoseLevel){
        glucoseLevelService.addGlucoseLevel(glucoseLevel);
        return "/GlucoseLevel/displayGlucoseLevel";
    }



    @RequestMapping("/deleteGlucose")
    public String deleteGlucoseLevelForm(@RequestParam long ID) {
        glucoseLevelService.deleteGlucoseLevel(ID);
        return "/GlucoseLevel/displayGlucoseLevel";
    }
}
