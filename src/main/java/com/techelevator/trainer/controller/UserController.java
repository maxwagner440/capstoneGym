package com.techelevator.trainer.controller;

import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.beans.Client;
import com.techelevator.beans.Trainer;
import com.techelevator.beans.User;
import com.techelevator.trainer.model.UserDAO;

@Controller
public class UserController {

	private UserDAO userDAO;

	@Autowired
	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/newUserRegistration", method=RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute("user") User user, BindingResult results, RedirectAttributes flashAttr,
												@RequestParam String password, HttpSession session, ModelMap modelHolder) {
		
		if(! userDAO.seeIfEmailExists(user.getEmail()) && ! userDAO.searchForUsernameAndPassword(user.getUsername(), password)){
			if(results.hasErrors()){
				flashAttr.addFlashAttribute("user", user);
				flashAttr.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", results);
				return "redirect:/login#signup";
			}
			userDAO.saveUser(user, password);
			session.setAttribute("user", user);
			return "redirect:/" + user.getRole().toLowerCase() + "Attributes";
		}
		else{
			return "redirect:/login";
		}
	}
	
	
	@RequestMapping(path="/clientAttributes", method=RequestMethod.GET)
	public String displayBioInputClient(ModelMap modelHolder, HttpSession session){
		if(session.getAttribute("user") == null){
			
			return "redirect:/login";
		}
		if(! modelHolder.containsAttribute("client")){
			Client client = new Client();
			modelHolder.addAttribute("client", client);
			
		}
		
		return "clientAttributes";
	}

	@RequestMapping(path="/clientAttributes", method=RequestMethod.POST)
	public String postWithClientAttributes(@Valid @ModelAttribute("client") Client client,
											 BindingResult result, RedirectAttributes attr, HttpSession session){
		User user = (User) session.getAttribute("user");
		
		if(result.hasErrors()){
			attr.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "client", result);
			attr.addFlashAttribute("client", client);
			return "redirect:/clientAttributes";
		}
		userDAO.saveClient(client, user.getId());
		session.setAttribute("user", client);
		return "redirect:/clientDashboard";
		
	}
	
	@RequestMapping(path="/trainerAttributes", method=RequestMethod.GET)
	public String displayBioInputTrainer(ModelMap modelHolder, HttpSession session){
		if(session.getAttribute("user") == null){
			
			return "redirect:/login";
		}
		if(! modelHolder.containsAttribute("trainer")){
			Trainer trainer = new Trainer();
			modelHolder.addAttribute("trainer", trainer);
			
		}
	return "trainerAttributes";
	}
	
	@RequestMapping(path="/trainerAttributes", method=RequestMethod.POST)
	public String postWithTrainerAttributes(@Valid @ModelAttribute("trainer") Trainer trainer,
											BindingResult result, RedirectAttributes attr, HttpSession session){
		User user = (User) session.getAttribute("user");
		if(result.hasErrors()){
			attr.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "trainer", result);
			attr.addFlashAttribute("trainer", trainer);
			return "redirect:/trainerAttributes";
		}
		userDAO.saveTrainer(trainer, user.getId());
		session.setAttribute("user", trainer);
		return "redirect:/trainerDashboard";
		
	}
	
<<<<<<< HEAD
	//controller

//	@RequestMapping(path="/trainerProfile", method=RequestMethod.POST) //MUST BE PUT IN THE POST, NOT THE GET!!! -->
//	public String saveTrainerImage(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, RedirectAttributes flash) {

//	@RequestMapping(path="/breweries", method=RequestMethod.POST) //MUST BE PUT IN THE POST, NOT THE GET!!! -->
//	public String createBrewery(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, RedirectAttributes flash) {

//	flash.addFlashAttribute("newUser", newUser);
//
//	    if(result.hasErrors()) {
//	        flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "newBrewery", result);
//	        return "redirect:/breweries/new";
//	    }
<<<<<<< HEAD
//	    if(!userDAO.getUserByName(newUser.getFirstName(), newUser.getLastName())) { 
//	    
//	  //NEXT LINE IS THE VIP- MUST BE LINKED TO THE OBJECT 
//	        newUser.setUserImageUrl("http://res.cloudinary.com/teclebrew/" + newBrewery.getBreweryLogoUrl());      
//	        userDAO.saveUser(newUser.getUsername(), "password");
=======
//	    if(!breweryDAO.searchForBrewery(newBrewery.getName())) { 
//	    
//	  //NEXT LINE IS THE VIP- MUST BE LINKED TO THE OBJECT 
//	        newBrewery.setBreweryLogoUrl("http://res.cloudinary.com/teclebrew/" + newBrewery.getBreweryLogoUrl());  
//	        
//	        
//	        breweryDAO.saveBrewery(newBrewery.getName(), newBrewery.getAddress(), newBrewery.getCity(), newBrewery.getZipcode(), newBrewery.getPhoneNumber(), newBrewery.getDescription(), newBrewery.getBreweryLogoUrl(), newBrewery.getImgUrl(), newBrewery.getWebsiteUrl(), newBrewery.getBusinessHours());
//	        return "redirect:/breweries";
//	    } else {
//	        flash.addFlashAttribute("message", "This brewery alreadys exists");
//	        return "redirect:/breweries/new";
//	    }
//	}

