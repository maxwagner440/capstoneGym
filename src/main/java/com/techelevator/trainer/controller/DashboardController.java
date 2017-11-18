package com.techelevator.trainer.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class DashboardController {
	@RequestMapping(path="/clientDashboard/{userName}", method=RequestMethod.GET)
	public String displayClientDashboard(Map<String, Object> model, @PathVariable String clientName) {
		return "clientDashboard";
	}
	
	@RequestMapping(path="/trainerDashboard/{userName}", method=RequestMethod.GET)
	public String displayTrainerDashboard(Map<String, Object> model, @PathVariable String trainerName) {
		return "trainerDashboard";
	}

}
