package com.techelevator.trainer.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.beans.Client;
import com.techelevator.beans.Trainer;
import com.techelevator.trainer.model.UserDAO;

@Controller
@SessionAttributes("currentUser")
public class AuthenticationController {
	private UserDAO userDAO;

	@Autowired
	public AuthenticationController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/login", method=RequestMethod.GET)
	public String displayLoginForm() {
		return "login";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String login(Map<String, Object> model, 
						@RequestParam String email, 
						@RequestParam String password,
						@RequestParam(required=false) String destination,
						HttpSession session) {
		String userRole=userDAO.getUserRole(email);
		String page="";
		String userName="";
		
		if(userDAO.searchForEmailAndPassword(email, password)) {
			session.invalidate();
			if(userRole.equalsIgnoreCase("trainer")){
				Trainer trainer=userDAO.getTrainerByEmail(email);
				model.put("trainer", trainer);
				userName=trainer.getUsername();
				page+="trainerDashboard";
			} else if(userRole.equalsIgnoreCase("client")){
				Client client=userDAO.getClientByEmail(email);
				model.put("client", client);
				userName=client.getUsername();
				page+="clientDashboard";
			}
			
			if(isValidRedirect(destination)) { //check to see if this works.
				return "redirect:"+destination;
			} else {
				return "redirect:/"+ page + "/"+userName;
			}
		} else {
			return "redirect:/login";
		}
	}

	private boolean isValidRedirect(String destination) {
		return destination != null && destination.startsWith("http://localhost");
	}

	@RequestMapping(path="/logout", method=RequestMethod.POST)
	public String logout(Map<String, Object> model, HttpSession session) {
		model.remove("currentUser");
		session.removeAttribute("currentUser");
		return "redirect:/";
	}
}
