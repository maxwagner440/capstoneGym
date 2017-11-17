package com.techelevator.beans;

public class Client extends User{
	private double weightInPounds;
	private double heightInInches;
	private String goals;
	private String modalityPreference;
	
	
	public double getWeightInPounds() {
		return weightInPounds;
	}
	public void setWeightInPounds(double weightInPounds) {
		this.weightInPounds = weightInPounds;
	}
	public double getHeightInInches() {
		return heightInInches;
	}
	public void setHeightInInches(double heightInInches) {
		this.heightInInches = heightInInches;
	}
	public String getGoals() {
		return goals;
	}
	public void setGoals(String goals) {
		this.goals = goals;
	}
	public String getModalityPreference() {
		return modalityPreference;
	}
	public void setModalityPreference(String modalityPreference) {
		this.modalityPreference = modalityPreference;
	}
	
	
}
