package com.techelevator.trainer.controller;

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
@SessionAttributes("clientID")
public class NoteController{
	private UserDAO userDAO;

	@Autowired
	public NoteController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path="/trainerNotes", method=RequestMethod.GET)
	public String seeClientPageAsTrainer(HttpSession session, ModelMap model, RedirectAttributes attr){
		Client client = userDAO.getClientByClientId((long)model.get("clientID"));
		model.addAttribute("client", client);
		Trainer trainer = (Trainer)session.getAttribute("user");
		model.addAttribute("notes", userDAO.viewAllNotesBetweenATrainerAndAClient(client.getClientId(), trainer.getTrainerId()) );
		return "messaging/trainerNoteForClient";
	}
	
	@RequestMapping(path="/trainerNotes", method=RequestMethod.POST)
	public String saveNoteForClient(HttpSession session, RedirectAttributes attr, @RequestParam String note, @RequestParam long clientId){
		Trainer trainer = (Trainer)session.getAttribute("user");
		userDAO.saveThisTrainersNoteForThatClient(trainer.getTrainerId(), clientId, note);
		attr.addFlashAttribute("clientID", clientId);
		return "redirect:/trainerNotes";
	}
	
	
}