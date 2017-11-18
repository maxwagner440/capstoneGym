package com.techelevator.trainer.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.trainer.model.UserDAO;

@Controller
public class DashboardController {
	
	private UserDAO userDAO;

	@Autowired
	public DashboardController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path="/clientDashboard/{userName}", method=RequestMethod.GET)
	public String displayClientDashboard(Map<String, Object> model, @PathVariable String userName) {
		model.put("userPath", userName);
		return "clientDashboard";
	}
	
	@RequestMapping(path="/trainerDashboard/{userName}", method=RequestMethod.GET)
	public String displayTrainerDashboard(Map<String, Object> model, @PathVariable String userName) {
		String privacy="public";
		if(userDAO.getTrainerPrivacySetting(userName)){
			privacy="private";
		}
			
		model.put("privacy", privacy);
		return "trainerDashboard";
	}

	@RequestMapping(path="/trainerDashboard/{userName}", method=RequestMethod.POST)
	public String setAccountPrivacy(@PathVariable String userName, @RequestParam boolean visibilityPrivate){
		userDAO.toggleTrainerPrivacySetting(userName);
		return "redirect:/trainerDashboard/" + userName;
	}
}
