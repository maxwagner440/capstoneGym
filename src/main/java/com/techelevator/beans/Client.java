package com.techelevator.beans;

import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotBlank;

public class Client extends User{
	
	private Long clientId;
	
	@Min(value=0, message="Weight Must Be Positive")
	private Double weightInPounds ;
	
	@Min(value=0, message="Height Must Be Positive")
	private Double heightInInches ;
	
	@NotBlank(message="Please Enter Your Goals")
	private String goals;
	
	@NotBlank(message="What Do You Like?")
	private String modalityPreference;
	
	
	public Double getWeightInPounds() {
		return weightInPounds;
	}
	public void setWeightInPounds(Double weightInPounds) {
		this.weightInPounds = weightInPounds;
	}
	public Double getHeightInInches() {
		return heightInInches;
	}
	public void setHeightInInches(Double heightInInches) {
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
	public Long getClientId() {
		return clientId;
	}
	public void setClientId(Long clientId) {
		this.clientId = clientId;
	}
	
	
}
