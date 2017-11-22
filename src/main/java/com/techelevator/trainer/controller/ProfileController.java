package com.techelevator.trainer.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.beans.Client;
import com.techelevator.beans.Trainer;
import com.techelevator.trainer.model.UserDAO;

@Controller
public class ProfileController {
	private UserDAO userDAO;

	@Autowired
	public ProfileController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path="/trainerProfile", method=RequestMethod.GET) //how can this url be abused? What if you don't have a trainer in your flash attribute
	public String getTrainerProfile(Map<String, Object> model, HttpSession session){ 
		//flash attribute from search controller /finaAllTrainers POST adds in a trainer whose profile can be built. That's one option. Reconsidered with session.
		model.put("trainer", (Trainer) session.getAttribute("profileToView"));
	
		return "trainerProfileDummy";
	}
	
	@RequestMapping(path="/signUpWithTrainer", method=RequestMethod.POST)
	public String signUpWithTrainer(Map<String, Object> model, RedirectAttributes attr, HttpSession session){ //what if they aren't a client?
		Trainer machop=(Trainer) session.getAttribute("profileToView");
		Client thisClient=(Client) session.getAttribute("user");
		userDAO.saveClientTrainerRelsationship(thisClient.getId(), machop.getId());
		attr.addFlashAttribute("message", "Congratulations you've signed up with "+ machop.getUsername());
		return "redirect:/success";
	}
	
	@RequestMapping(path="/success", method=RequestMethod.GET)
	public String success(){
		//message gets different depending on page you come from. Handled by flash attribute.
		return "success";
	}
	
	

}
