package com.techelevator.trainer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.techelevator.trainer.model.UserDAO;

@Controller
public class NoteController{
	private UserDAO userDAO;

	@Autowired
	public NoteController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	
	@RequestMapping(path="/", method=RequestMethod>GET)
}