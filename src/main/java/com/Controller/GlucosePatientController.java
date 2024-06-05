package com.Controller;

import com.Models.GlucoseLevel;
import com.Models.Patient;
import com.Services.GlucoseLevelService;
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


    @RequestMapping("/")
    public ModelAndView home(){
        List<GlucoseLevel> listGlucoseLevel = glucoseLevelService.listAll();
        ModelAndView mav = new ModelAndView("displayPatient");
        mav.addObject("listGlucoseLevel", listGlucoseLevel);
        return mav;
    }

    @RequestMapping("/new1")
    public String addNewGlucoseLevel(Model model){
        GlucoseLevel glucoseLevel = new GlucoseLevel();
        model.addAttribute("glucoseLevel",glucoseLevel);
        return "addGlucoseLevel";

    }

    @RequestMapping(value = "/addGlucoseLevelAction",method = RequestMethod.POST)
    public String addGlucoseLevel(@ModelAttribute("glucoseLevel")GlucoseLevel glucoseLevel){
        glucoseLevelService.addGlucoseLevel(glucoseLevel);
        return "redirect:/";
    }



    @RequestMapping("/deleteGlucose")
    public String deleteGlucoseLevelForm(@RequestParam long gId) {
        glucoseLevelService.deleteGlucoseLevel(gId);
        return "redirect:/";
    }
}
