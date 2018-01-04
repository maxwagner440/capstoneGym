package com.techelevator.trainer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String displayHomePage() {
		return "home";
	}
	
	@RequestMapping(path="/about", method=RequestMethod.GET)
	public String displayAboutPage() {
		return "about";
	}
	
	@RequestMapping(path="/facility", method=RequestMethod.GET)
	public String displayPricePage() {
		return "facility";
	}
	
	@RequestMapping(path="contact", method=RequestMethod.GET)
	public String displayContactPage() {
		return "contact";
	}
	
	@RequestMapping(path="/testimonial", method=RequestMethod.GET)
	public String displayTestimonialPage() {
		return "testimonial";
	}
	
	@RequestMapping(path="/benefits", method=RequestMethod.GET)
	public String displayBenefitsPage() {
		return "benefits";
	}
	
	@RequestMapping(path="/services", method=RequestMethod.GET)
	public String displayServicesPage(){
		return "services";
	}
	
}
