package com.techelevator.trainer.controller;

import org.jboss.logging.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	public String sendMessagePage(){
		return "/messaging/sendMessage";
	}
	
	@RequestMapping(path="/sendMessage", method=RequestMethod.POST)
	public String processSendMessageRequest(@ModelAttribute Message msg){
		userDAO.saveMessage();
		return "redirect:/success";
	}
	
	

}
