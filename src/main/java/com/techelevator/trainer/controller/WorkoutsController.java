package com.techelevator.trainer.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.trainer.model.UserDAO;

@Controller
public class WorkoutsController {

	private UserDAO userDAO;
	
	@Autowired
	public WorkoutsController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path="/allWorkouts", method=RequestMethod.GET)
	public String showAllWorkouts(){
		return "allWorkouts";
	}
	
	@RequestMapping(path="/runningWorkout", method=RequestMethod.GET)
	public String showRunningWorkouts(){
		return "runningWorkout";
	}
	
	@RequestMapping(path="/currentWorkoutPlan", method=RequestMethod.GET)
	public String showCurrentWorkoutPlan(HttpSession session){
		return "currentWorkoutPlan";
	}
}
