package com.Controller;

import com.Models.GlucoseLevel;
import com.Models.Patient;
import com.Services.GlucoseLevelService;
import com.Services.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@Transactional
public class GlucosePatientController {

    @Autowired
    GlucoseLevelService glucoseLevelService;
    @Autowired
    PatientService patientService;


    @RequestMapping("/homeDiabetes/{patientId}")
    public ModelAndView home(@PathVariable Long patientId, Model model){
        model.addAttribute("patientId", patientId);
        List<GlucoseLevel> listGlucoseLevel = glucoseLevelService.listAll();
        ModelAndView mav = new ModelAndView("/GlucoseLevel/displayGlucoseLevel");
        mav.addObject("listGlucoseLevel", listGlucoseLevel);
        return mav;
    }

    @GetMapping("/new1/{patientId}")
    public String addNewGlucoseLevel(@PathVariable Long patientId, Model model){
        Patient patient = patientService.getPatient(patientId);
        model.addAttribute("patient", patient);
        model.addAttribute("glucoseLevel", new GlucoseLevel());
        return "/GlucoseLevel/addGlucoseLevel";
    }

    @PostMapping(value = "/addGlucoseLevel")
    public String addGlucoseLevel(@ModelAttribute GlucoseLevel glucoseLevel){
        glucoseLevelService.addGlucoseLevel(glucoseLevel);
        System.out.println(glucoseLevel);
        return "redirect:/homeDiabetes/" + glucoseLevel.getPatient().getpId();
    }

    @RequestMapping("/deleteGlucose/{id}/{pId}")
    public String deleteGlucoseLevelForm(@PathVariable("id") Long id, @PathVariable("pId") Long pId, Model model) {
        glucoseLevelService.deleteGlucoseLevel(id);
        return "redirect:/homeDiabetes/" + pId;
    }


    @GetMapping("/glucose-chart/{patientId}")
    public String showGlucoseChart(@PathVariable Long patientId, Model model) {
        Patient patient = patientService.getPatient(patientId);
        model.addAttribute("patient", patient);
        List<GlucoseLevel> glucoseLevel = glucoseLevelService.listAll();
        model.addAttribute("glucoseLevel", glucoseLevel);
        return "/GlucoseLevel/Chart";
    }
}
