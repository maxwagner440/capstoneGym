package com.techelevator.trainer.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		userDAO.saveClientTrainerRelsationship(thisClient.getClientId(), machop.getTrainerId());
		attr.addFlashAttribute("message", "You have requested to sign up with "+ machop.getUsername() + ". They will get back to you as soon as possible.");
		
		return "redirect:/clientDashboard";
	}
	
	@RequestMapping(path="/success", method=RequestMethod.GET)
	public String success(){
		//message gets different depending on page you come from. Handled by flash attribute.
		return "success";
	}

	//Cloudinary Controller
//	@RequestMapping(path="/trainerProfile", method=RequestMethod.POST)
//	public String updateTrainerPicture(@ModelAttribute ("trainerProf") Trainer trainerProf, RedirectAttributes attr, HttpSession session, @RequestParam ){
//	attr.addFlashAttribute("trainerProf", trainerProf);	
//		
//		if(!userDAO.getTrainerById()) { 
//		    
//			  <!--   //NEXT LINE IS THE VIP- MUST BE LINKED TO THE OBJECT -->
//			        trainerProf.setImageUrl("http://res.cloudinary.com/annaKonchak/" + trainerProf.getImageUrl());
//			
//			
//			return "redirect:/trainerProfile";
//		}
//	}
//	
//	@RequestMapping(path="/clientProfile", method=RequestMethod.POST)
//	public String updateClientPicture()
//}
}
