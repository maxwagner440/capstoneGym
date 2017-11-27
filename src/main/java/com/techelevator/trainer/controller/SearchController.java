package com.techelevator.trainer.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.beans.Trainer;
import com.techelevator.trainer.model.UserDAO;

@Controller
public class SearchController {
	private UserDAO userDAO;

	@Autowired
	public SearchController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/findAllTrainers", method=RequestMethod.GET)
	public String getAllTrainersWhenLookedForByClients(Map<String, Object> model){ //what if they aren't a client?
		model.put("trainers", userDAO.getAllTrainers()); //this has both the user and trainer data in trainer
		return "findAllTrainersForClient";
	}
	
	
	@RequestMapping(path="/findAllTrainers", method=RequestMethod.POST)

	public String getAllTrainersWhenLookedForByClients(Map<String, Object> model, @RequestParam long userID, HttpSession session){ //what if they aren't a client?
		session.setAttribute("profileToView", userDAO.getTrainerById(userID));

		return "redirect:/clientViewTrainer";
	}
	
	@RequestMapping(path="/clientViewTrainer", method=RequestMethod.GET)
	public String viewSpecificTrainer(HttpSession session, ModelMap model){
		model.put("trainer", (Trainer) session.getAttribute("profileToView"));
		return "clientViewTrainer";
		
	}
}
