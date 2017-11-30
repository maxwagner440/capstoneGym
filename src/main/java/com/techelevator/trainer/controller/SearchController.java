package com.techelevator.trainer.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.beans.Client;
import com.techelevator.beans.Trainer;
import com.techelevator.trainer.model.UserDAO;

@Controller
@SessionAttributes("trainers")
public class SearchController {
	private UserDAO userDAO;

	@Autowired
	public SearchController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/findAllTrainers", method=RequestMethod.GET)
	public String getAllTrainersWhenLookedForByClients(Map<String, Object> model){ //what if they aren't a client?
		if(model.get("trainers") == "" || model.get("trainers") == null){
			model.put("trainers", userDAO.getAllPublicTrainers()); //this has both the user and trainer data in trainer
		}
		
		return "findAllTrainersForClient";
	}
	
	@RequestMapping(path="/searchTrainers", method=RequestMethod.POST)
	public String getTrainersSearchedFor(RedirectAttributes attr, @RequestParam String keyword){
		List<Trainer> trainers = userDAO.searchForTrainer(keyword);
		attr.addFlashAttribute("trainers", trainers);
		return "redirect:/findAllTrainers";
	}
	@RequestMapping(path="/findAllTrainers", method=RequestMethod.POST)
	public String getAllTrainersWhenLookedForByClients(Map<String, Object> model, @RequestParam long userID, HttpSession session){ //what if they aren't a client?
		session.setAttribute("profileToView", userDAO.getTrainerById(userID));

		return "redirect:/clientViewTrainer";
	}
	
	@RequestMapping(path="/clientViewTrainer", method=RequestMethod.GET)
	public String viewSpecificTrainer(HttpSession session, ModelMap model){
		
		return "clientViewTrainer";
		
	}
	
	@RequestMapping(path="/viewAllClients", method=RequestMethod.GET)
	public String seeAllClients(HttpSession session, ModelMap modelHolder){
		Trainer trainer = (Trainer) session.getAttribute("user");
		List<Client> allClients = userDAO.getAllClientsFromTrainerId(trainer.getTrainerId());
		modelHolder.addAttribute("clients", allClients);
		return "viewAllClients";
	}
	
	@RequestMapping(path="/viewAllClients", method=RequestMethod.POST)
	public String viewClientsProfile(HttpSession session, RedirectAttributes attr, @RequestParam long userID){
		attr.addFlashAttribute("clientID", userID);
		return "redirect:/trainerNotes";
	}
	
	@RequestMapping(path="/viewThisClientForTrainer", method=RequestMethod.GET)
	public String viewClientNotesPage(HttpSession session, ModelMap modelHolder, @ModelAttribute("client") Client clientToView){
		modelHolder.addAttribute("clientToView", clientToView);
		return "messaging/viewThisClientForTrainer";
	}
}
