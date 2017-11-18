package com.techelevator.trainer.controller;

import java.util.Map;

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

	
	@RequestMapping(path="/newUserRegistration", method=RequestMethod.GET)
	public String displayNew() {
		return "newUserRegistration";
	}
	

	@RequestMapping(path="/newUserRegistration", method=RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute User user, @RequestParam String password, RedirectAttributes attr) {
		if(! userDAO.seeIfEmailExists(user.getEmail())){
			userDAO.saveUser(user, password);
			attr.addAttribute("user", user);
			String injenction = user.getRole().substring(0,1).toUpperCase() + 
					user.getRole().substring(1).toLowerCase() ;
		return "redirect:/users" + injenction + "Attributes";
		}
		else{
			return "redirect:/newUserRegistration";
		}
	}
	
	
	@RequestMapping(path="/usersClientAttributes", method=RequestMethod.GET)
	public String displayBioInputClient(ModelMap modelHolder){
		if(! modelHolder.containsAttribute("user")){
			return "redirect:/newUserRegistration";
		}
		
		return "usersClientAttributes";
	}

	@RequestMapping(path="/usersClientAttributes", method=RequestMethod.POST)
	public String postWithClientAttributes(@Valid @ModelAttribute("client") Client client,
											BindingResult result, RedirectAttributes attr){
		userDAO.saveClient(client, client.getId());
		if(result.hasErrors()){
			attr.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "client", result);
			return "redirect:/usersClientAttributes";
		}
		return "redirect:/clientDashBoard/" + client.getUsername();
		
	}
	
	@RequestMapping(path="/usersTrainerAttritbutes", method=RequestMethod.GET)
	public String displayBioInputTrainer(ModelMap modelHolder){
		if(! modelHolder.containsAttribute("user")){
			return "redirect:/newUserRegistration";
		}
		return "usersTrainerAttributes";
	}
	
	@RequestMapping(path="/usersTrainerAttributes", method=RequestMethod.POST)
	public String postWithTrainerAttributes(@Valid @ModelAttribute("trainer") Trainer trainer,
											BindingResult result, RedirectAttributes attr){
		userDAO.saveTrainer(trainer, trainer.getId());
		if(result.hasErrors()){
			attr.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "trainer", result);
			return "redirect:/usersClientAttributes";
		}
		return "redirect:/trainerDashboard/" + trainer.getUsername();
		
	}
		
}
