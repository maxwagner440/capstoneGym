package com.techelevator.trainer.controller;

import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.beans.Client;
import com.techelevator.beans.Trainer;
import com.techelevator.beans.User;
import com.techelevator.trainer.model.UserDAO;

@Controller
public class UserController {

	private UserDAO userDAO;

	@Autowired
	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/newUserRegistration", method=RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute("user") User user, BindingResult results, RedirectAttributes flashAttr,
												@RequestParam String password, HttpSession session, ModelMap modelHolder) {
		
		if(! userDAO.seeIfEmailExists(user.getEmail())){
			if(results.hasErrors()){
				flashAttr.addFlashAttribute("user", user);
				flashAttr.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", results);
				return "redirect:/login#signup";
			}
			userDAO.saveUser(user, password);
			session.setAttribute("user", user);
			return "redirect:/" + user.getRole().toLowerCase() + "Attributes";
		}
		else{
			return "redirect:/login";
		}
	}
	
	
	@RequestMapping(path="/clientAttributes", method=RequestMethod.GET)
	public String displayBioInputClient(ModelMap modelHolder, HttpSession session){
		if(session.getAttribute("user") == null){
			
			return "redirect:/login";
		}
		if(! modelHolder.containsAttribute("client")){
			Client client = new Client();
			modelHolder.addAttribute("client", client);
			
		}
		
		return "clientAttributes";
	}

	@RequestMapping(path="/clientAttributes", method=RequestMethod.POST)
	public String postWithClientAttributes(@Valid @ModelAttribute("client") Client client,
											 BindingResult result, RedirectAttributes attr, HttpSession session){
		User user = (User) session.getAttribute("user");
		
		if(result.hasErrors()){
			attr.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "client", result);
			attr.addFlashAttribute("client", client);
			return "redirect:/clientAttributes";
		}
		userDAO.saveClient(client, user.getId());
		fillInUserVarsForClient(client, user);
		session.setAttribute("user", client);
		return "redirect:/clientDashboard";
		
	}
	
	@RequestMapping(path="/trainerAttributes", method=RequestMethod.GET)
	public String displayBioInputTrainer(ModelMap modelHolder, HttpSession session){
		if(session.getAttribute("user") == null){
			
			return "redirect:/login";
		}
		if(! modelHolder.containsAttribute("trainer")){
			Trainer trainer = new Trainer();
			modelHolder.addAttribute("trainer", trainer);
			
		}
	return "trainerAttributes";
	}
	
	@RequestMapping(path="/trainerAttributes", method=RequestMethod.POST)
	public String postWithTrainerAttributes(@Valid @ModelAttribute("trainer") Trainer trainer,
											BindingResult result, RedirectAttributes attr, HttpSession session){
		User user = (User) session.getAttribute("user");
		if(result.hasErrors()){
			attr.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "trainer", result);
			attr.addFlashAttribute("trainer", trainer);
			return "redirect:/trainerAttributes";
		}
		
		userDAO.saveTrainer(trainer, user.getId());
		fillInUserVarsForTrainer(trainer, user);
		session.setAttribute("user", trainer);
	
		return "redirect:/trainerDashboard";
		
	}
	
	private void fillInUserVarsForTrainer(Trainer trainer, User user){
		trainer.setAge(user.getAge());
		trainer.setId(user.getId());
		trainer.setEmail(trainer.getEmail());
		trainer.setUsername(user.getUsername());
		trainer.setFirstName(user.getFirstName());
		trainer.setLastName(user.getLastName());
		trainer.setRole(user.getRole());
		trainer.setVisibility(true);
	}
	

	public void fillInUserVarsForClient(Client client, User user){
		client.setAge(user.getAge());
		client.setId(user.getId());
		client.setEmail(client.getEmail());
		client.setUsername(user.getUsername());
		client.setFirstName(user.getFirstName());
		client.setLastName(user.getLastName());
		client.setRole(user.getRole());
	}
	

}
