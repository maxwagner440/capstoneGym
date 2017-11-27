package com.techelevator.trainer.controller;


import java.util.List;

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
	
	@RequestMapping(path="/getToMessages", method=RequestMethod.POST)
	public String getToMessagePage(HttpSession session, RedirectAttributes attr, @RequestParam Long trainerId){
		Trainer trainer = userDAO.getTrainerById(trainerId);
		attr.addFlashAttribute("trainer", trainer);
		return "redirect:/sendMessage";
	}
	
	@RequestMapping(path="/sendMessage", method=RequestMethod.GET)
	public String sendMessagePage(HttpSession session, @ModelAttribute("trainer") Trainer trainer,  ModelMap modelHolder){
		modelHolder.addAttribute("trainer", trainer);
		return "sendMessage";
	}
	
	
	@RequestMapping(path="/sendMessage", method=RequestMethod.POST)
	public String processSendMessageRequest(HttpSession session, @RequestParam String message,  @RequestParam Long receiverId){

			User fromUserTrainer = (User) session.getAttribute("user");
			userDAO.saveMessage(message, fromUserTrainer.getId(), (long) 1);
		return "redirect:/success";
	}
	
	@RequestMapping(path="/replyMessage", method=RequestMethod.GET)
	public String sendReplyMessagePage(HttpSession session, @RequestParam String receiverUsername){
		User receiverUser = (User) userDAO.getUserByUsername(receiverUsername);
		session.setAttribute("receiverUser", receiverUser);
		
		return "replyMessage";
	}
	
	@RequestMapping(path="/replyMessage", method=RequestMethod.POST)
	public String processReplyMessageRequest(HttpSession session, @RequestParam String message,  @RequestParam Long receiverId){

			User fromUserTrainer = (User) session.getAttribute("user");
			User toClientUser = (User) session.getAttribute("receiverUser");
			userDAO.saveMessage(message, fromUserTrainer.getId(), toClientUser.getId());
			String role = userDAO.getUserRole(fromUserTrainer.getId());
		return "redirect:/" + role.toLowerCase() + "Dashboard";
	}
	
	@RequestMapping(path="/viewMyMessages", method=RequestMethod.GET)
	public String viewAllMessages(HttpSession session, ModelMap modelHolder){
		User user = (User) session.getAttribute("user");
		List<Message> messages = userDAO.getMessagesRankedByTimeForUser(user.getId());
		modelHolder.put("messages", messages);
		return "messaging/viewMyMessages";
	}

}
