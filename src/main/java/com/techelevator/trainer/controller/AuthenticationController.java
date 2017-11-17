package com.techelevator.trainer.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
						@RequestParam String userName, 
						@RequestParam String password,
						@RequestParam(required=false) String destination,
						HttpSession session) {
		String userRole=userDAO.getUserRole(userName);
		String page="";
		
		if(userDAO.searchForUsernameAndPassword(userName, password)) {
			session.invalidate();
			if(userRole.equalsIgnoreCase("trainer")){
				Trainer trainer=userDAO.getTrainerByUsername(userName);
				model.put("trainer", trainer);
				page+="trainerDashboard";
			} else if(userRole.equalsIgnoreCase("client")){
				Client client=userDAO.getClientByUsername(userName);
				model.put("client", client);
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
