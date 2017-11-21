package com.techelevator.trainer.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.beans.Client;
import com.techelevator.beans.Trainer;
import com.techelevator.beans.User;
import com.techelevator.trainer.model.UserDAO;

@Controller
public class DashboardController {
	
	private UserDAO userDAO;

	@Autowired
	public DashboardController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path="/clientDashboard/{userName}", method=RequestMethod.GET)
	public String displayClientDashboard(Map<String, Object> model, @PathVariable String userName, HttpSession session) {
		User currentUser=(User) session.getAttribute("user");
		if(!currentUser.getRole().equalsIgnoreCase("client")){
			return "redirect:/trainerDashboard/"+currentUser.getUsername();
		}
			
		model.put("user", (Client) currentUser);
		return "clientDashboard";
	}
	
	@RequestMapping(path="/trainerDashboard", method=RequestMethod.GET)
	public String displayTrainerDashboard(Map<String, Object> model, HttpSession session) {

		return "trainerDashboard";
	}

	@RequestMapping(path="/trainerDashboard", method=RequestMethod.POST)
	public String setAccountPrivacy(HttpSession session, ModelMap modelHolder){
//		User currentUser=(User) session.getAttribute("user");
//		if(!currentUser.getRole().equalsIgnoreCase("trainer")){
//			return "redirect:/clientDashboard/"+currentUser.getUsername();
//		}
		
		Trainer trainer = (Trainer) session.getAttribute("user");
		userDAO.toggleTrainerPrivacySetting(trainer.getId());
		trainer.setVisibility(! trainer.isVisibility());
		return "redirect:/trainerDashboard";
	}
}
