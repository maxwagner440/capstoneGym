package com.techelevator.trainer.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.beans.Client;
import com.techelevator.beans.Trainer;
import com.techelevator.beans.User;
import com.techelevator.trainer.model.UserDAO;

@Controller
@SessionAttributes("loginMessage")

public class AuthenticationController {
	private UserDAO userDAO;

	@Autowired
	public AuthenticationController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/login", method=RequestMethod.GET)
	public String displayLoginForm(ModelMap modelHolder, HttpSession session ) {
		if(! modelHolder.containsAttribute("user")){
			User user = new User(); 
			if(user.getId()==-1){
				user.setId(0);
			} 
			modelHolder.addAttribute("user", user);
			
			modelHolder.addAttribute("loginMessage", "Incorrect Username or Password"+ user.getId());
			return "login";
		}
		
		return "login";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String login(ModelMap model,
						
						@RequestParam String email, 
						@RequestParam String password,
						@RequestParam(required=false) String destination,
						HttpServletRequest request, RedirectAttributes attr,
						HttpSession session) {
		String userRole=userDAO.getUserRole(email);
		String page="";
		String userName="";
		if(userDAO.searchForEmailAndPassword(email, password)) {
			
			request.changeSessionId();
			if(userRole.equalsIgnoreCase("trainer")){
				Trainer trainer=userDAO.getTrainerByEmail(email);
				session.setAttribute("user", trainer);
				userName=trainer.getUsername();
				page+="trainerDashboard";
			} else if(userRole.equalsIgnoreCase("client")){
				Client client=userDAO.getClientByEmail(email);
				session.setAttribute("user", client);
				userName=client.getUsername();
				page+="clientDashboard";
			}
			
			
			if(isValidRedirect(destination)) { //check to see if this works.
				return "redirect:"+destination;
			} else {
				return "redirect:/"+ page;
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
		model.remove("user");
		session.removeAttribute("user");
		session.invalidate();
		return "redirect:/";
	}
}
