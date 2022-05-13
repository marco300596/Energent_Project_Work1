package com.energent.controller;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.apache.coyote.http11.upgrade.UpgradeApplicationBufferHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.energent.bean.Message;
import com.energent.entity.Academy;
import com.energent.entity.Student;
import com.energent.service.AcademyService;
import com.energent.service.StudentService;

@Controller
public class AcademyController {
	
	/*
	 * è da chiedere a salvatore se il mav può essere salvato staticamente
	 * e se in questo modo si può tenere traccia degli eventi che affronta
	 * quest'ultimo.
	 */
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AcademyService academyService;
	
	@Autowired
	private StudentService studentService;
	
	private static ModelAndView mav = new ModelAndView();
	private String page = "redirect:/academies";
	
	@GetMapping("/home")
	public ModelAndView showHomePage() {
		
		mav.setViewName("/HomePage");
		
		return mav;
	}
	
	@PostMapping("/academiesHP")
	public ModelAndView showAcademyHomePage() {
		
		mav.setViewName("/HomePageAcademy");
		Academy academy = new Academy();
		
		mav.addObject("academy", academy);
		mav.addObject("message", new Message());
		
		return mav;
	}
	
	@PostMapping("/academy")
	public ModelAndView addAcademy(@ModelAttribute ("academy") Academy academy) {
		
		mav.setViewName("/academy");
		mav.addObject("academy", academy);
		return mav;
	}
	
	@PostMapping("/AcademyConfirm")
	public ModelAndView confirmAcademy(@ModelAttribute ("academy") Academy academy) {
		
		mav.setViewName("/ConfirmAcademyAdded");
		mav.addObject("academy", academy);
		return mav;
	}
	
	@PostMapping("/academies")
	public ModelAndView showAcademies(@ModelAttribute("academy")Academy academy, @ModelAttribute("message")Message message) {
		/*
		 * this method is in charge of check if everything is inserted correctly
		 * and to call the page and method that is in charge with the 
		 * system's response.
		 */
		if(mav.getViewName() == "/ConfirmAcademyAdded") {
			int res = academyService.addAcademy(academy);
			if (res == 2)// in case the date inserted is not right
				
				mav.setViewName("/academy");
			if (res == 1) { // in case we inserted an already existing code
				
				mav.setViewName("/NotifAcademy");
				mav.addObject("academy",academy);
			}if(res == 0){ //in case everything checks out
				
				mav.setViewName("/academies");
				mav.addObject("message", new Message());
				List<Academy> academies = academyService.findAllAcademies();
				mav.addObject("academies",academies);
				return mav;
			}
		}else {	//this part is in case we come from an update page
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			mav.setViewName("/academies");
			log.info(message.getCode());
			if(!(message.getCode() == null)) {
				
				List<Academy> academies = new ArrayList<>();
				Academy academy1 = academyService.findAcademybyId(message.getCode());
				academies.add(academy1);
				if(!(academies.get(0) == null))
					mav.addObject("academies",academies);
				return mav;
			}if(!(message.getName() == null)) {
				
				List<Academy> academies = academyService.findAcademiesByTitle(message.getName());
				mav.addObject("academies",academies);
				return mav;
			}if(!(message.getLocation() == null)) {
				
				List<Academy> academies = academyService.findAcademiesByLocation(message.getLocation());
				mav.addObject("academies",academies);
				return mav;
			}if(!(message.getEdate()==null)){
				if(!(message.getSdate()==null)){
					if((!(message.getEdate().toLocalDate().format(formatter) == "01/01/1900"))&&(!(message.getSdate().toLocalDate().format(formatter) == "01/01/1900"))){
						
						List<Academy> academies = academyService.findAcademiesByStartAndEndDate(message.getEdate().toLocalDate().format(formatter), message.getSdate().toLocalDate().format(formatter));
						mav.addObject("academies",academies);
						return mav;
					}
				}if(!(message.getEdate().toLocalDate().format(formatter) == "01/01/1900")){
					
					List<Academy> academies = academyService.findAcademiesByEndDate(message.getEdate().toLocalDate().format(formatter));
					mav.addObject("academies",academies);
					return mav;
				}
			}if(!(message.getSdate()==null)){
				if(!(message.getSdate().toLocalDate().format(formatter) == "01/01/1900")){
					
					List<Academy> academies = academyService.findAcademiesByStartDate(message.getSdate().toLocalDate().format(formatter));
					mav.addObject("academies",academies);
					return mav;
				}
			}else {
				
				List<Academy> academies = academyService.findAllAcademies();
				mav.addObject("academies",academies);
				return mav;
			
			}
			return mav;
		}
		return mav;
}
	
	@PostMapping("/academies/{codeId}/update")
	public ModelAndView updateAcademy(@PathVariable String codeId) {
		/*
		 * this method take a selected academy from the academies page and update it
		 * this academy will be shown in its info documented in the page
		 */
		mav.setViewName("/updateAcademy");
		
		Academy academy = academyService.findAcademybyId(codeId);
		mav.addObject("academy", academy);
		return mav;
		
	}
	
	@PostMapping("/AcademyApproved")
	public ModelAndView updateAcademies(@ModelAttribute("academy")Academy academy) {
		/*
		 * this method is called when we come from updating an accademy from the home page,
		 * after doing that if everything checks out we will be send to the academies's list
		 * page
		 */
		if (!academyService.updateAcademy(academy)) // in case the date inserted is not right
			mav.setViewName("/academy");
		else {	// in case everything checks out we have to set a new page to land to otherwise we will be stuck in a loop
			academyService.updateAcademy(academy);
			Academy academy1 = academyService.findAcademybyId(academy.getCodeId());
			mav.setViewName("/AcademyApproved");
			mav.addObject("academy", academy1);
		}
		return mav;
	}
	
	@GetMapping("/academies/{codeId}/addStudent")
	public ModelAndView newStudentForAcademy(@PathVariable String id) {
		/*
		 * this method is called when we click the "add student" button inside the
		 * "student's list" in the academy page, it will pass a student object, for
		 * the student we will insert and the academy object to link to it, this 
		 * will be passed inside the page and the collected from the StudentController
		 */
		Academy academy = academyService.findAcademybyId(id);
		mav.setViewName("newStudent");
		mav.addObject("academy", academy);
		mav.addObject("student", new Student());
		
		return mav;
	}
	
	@PostMapping("/academies/{codeId}/remove")
	public ModelAndView removeWarningAcademy(@PathVariable String codeId) {
		/*
		 * this method take a selected academy from the academies page and update it
		 * this academy will be shown in its info documented in the page
		 */
		mav.setViewName("/ConfirmAcademyDelete");
		Academy academy = academyService.findAcademybyId(codeId);
		List<Student> students = studentService.findStudentsByAcademy(academyService.findAcademybyId(codeId));
		mav.addObject("academy", academy);
		mav.addObject("students", students);
		return mav;
		
	}
	
	@PostMapping("/academies/{codeId}/remove/confirm")
	public ModelAndView removeAcademy(@PathVariable String codeId) {
		/*
		 * this method take a selected academy from the academies page and update it
		 * this academy will be shown in its info documented in the page
		 */
		List<Student> students = studentService.findStudentsByAcademy(academyService.findAcademybyId(codeId));
		for(Student student: students)
			studentService.removeStudent(student.getfCode());
		academyService.removeAcademy(codeId);
		mav.setViewName("/RemoveAcademy");
		return mav;
		
	}
	
}
