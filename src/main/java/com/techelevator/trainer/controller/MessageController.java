package com.techelevator.trainer.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.beans.Message;
import com.techelevator.beans.Trainer;
import com.techelevator.beans.User;
import com.techelevator.trainer.model.UserDAO;

@Controller
@SessionAttributes("currentUser")
public class MessageController {
	
	private UserDAO userDAO;

	@Autowired
	public MessageController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path="/sendMessage", method=RequestMethod.GET)
	public String sendMessagePage(HttpSession session){
		return "/messaging/sendMessage";
	}
	
	@RequestMapping(path="/sendMessage", method=RequestMethod.POST)
	public String processSendMessageRequest(HttpSession session, @RequestParam String message, @RequestParam String first, @RequestParam String last){
		User toUser = (User) userDAO.getUserByName(first, last);
		
		Trainer fromUser = (Trainer) session.getAttribute("user");
		userDAO.saveMessage(message, fromUser.getId(), toUser.getId());
		return "redirect:/success";
	}
	
	

}
