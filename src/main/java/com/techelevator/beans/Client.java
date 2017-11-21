package com.techelevator.beans;

import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotBlank;

public class Client extends User{
	@Min(value=0, message="Weight Must Be Positive")
	private double weightInPounds ;
	
	@Min(value=0, message="Height Must Be Positive")
	private double heightInInches ;
	
	@NotBlank(message="Please Enter Your Goals")
	private String goals;
	
	@NotBlank(message="What Do You Like?")
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
