package com.Controller;
import com.Models.Patient;
import com.Services.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;


@Controller
@RequestMapping
public class PatientController {

    @Autowired
    private PatientService patientService;


    @RequestMapping("/")
    public ModelAndView home(){
        List<Patient> listPatient = patientService.listAll();
        ModelAndView mav = new ModelAndView("displayPatient");
        mav.addObject("listPatient", listPatient);
        return mav;
    }


    @RequestMapping("/new")
    public String addNewPatient(Model model){
        Patient patient = new Patient();
        model.addAttribute("patient",patient);
        return "addPatient";

    }

    @RequestMapping(value = "/addPatientAction",method = RequestMethod.POST)
    public String addPatient(@ModelAttribute("patient")Patient patient){
        patientService.addPatient(patient);
        return "redirect:/";
    }



    @RequestMapping("/delete")
    public String deletePatientForm(@RequestParam long id) {
        patientService.deletePatient(id);
        return "redirect:/";
    }
}
