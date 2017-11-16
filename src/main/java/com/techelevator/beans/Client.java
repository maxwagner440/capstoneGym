package com.techelevator.beans;

public class Client extends User{
	private String weightInPounds;
	private int heightInInches;
	private String goals;
	private String modalityPreference;
	public String getWeightInPounds() {
		return weightInPounds;
	}
	public void setWeightInPounds(String weightInPounds) {
		this.weightInPounds = weightInPounds;
	}
	public int getHeightInInches() {
		return heightInInches;
	}
	public void setHeightInInches(int heightInInches) {
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
