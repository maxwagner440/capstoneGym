package com.techelevator.trainer.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.beans.Client;
import com.techelevator.beans.Trainer;
import com.techelevator.trainer.model.UserDAO;
@Controller
public class UserController {

	private UserDAO userDAO;

	@Autowired
	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/users/newClient", method=RequestMethod.GET)
	public String displayNewUserForm() {
		return "newClient";
	}
	
	@RequestMapping(path="/users/newTrainer", method=RequestMethod.GET)
	public String displayNewTrainer() {
		return "newTrainer";
	}
	
	@RequestMapping(path="/usersNewTrainer", method=RequestMethod.POST)
<<<<<<< HEAD
	public String createTrainer(@ModelAttribute Trainer trainer, @RequestParam String password) {
=======
	public String createClient(@ModelAttribute Trainer trainer, @RequestParam String password, HttpSession session) {
		if(! userDAO.seeIfUsernameExists(trainer.getUsername())){
>>>>>>> 533a659da9fa69fbcefd3a4cbfe0816078482da0
			userDAO.saveUser(trainer, password);
			userDAO.saveTrainer(trainer, trainer.getId());
		return "redirect:/login";
		}
		else{
			
		}
	}
	
	@RequestMapping(path="/usersNewClient", method=RequestMethod.POST)
<<<<<<< HEAD
	public String createClient(@ModelAttribute Client client, @RequestParam String password) {
		userDAO.saveUser(client, password);
		userDAO.saveClient(client, client.getId());
=======
	public String createTrainer(@ModelAttribute Client client, @RequestParam String password, HttpSession session) {
		if(! userDAO.seeIfUsernameExists(client.getUsername())){
			userDAO.saveUser(client, password);
			userDAO.saveClient(client, client.getId());
>>>>>>> 533a659da9fa69fbcefd3a4cbfe0816078482da0
		return "redirect:/login";
		}
	}
	
	@RequestMapping(path="/users/{userName}", method=RequestMethod.GET)
	public String displayDashboard(Map<String, Object> model, @PathVariable String userName) {
		return "userDashboard";
	}
		
}
