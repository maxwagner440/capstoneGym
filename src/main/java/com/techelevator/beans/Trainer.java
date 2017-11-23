package com.techelevator.beans;

import java.math.BigDecimal;

import javax.validation.constraints.DecimalMin;

import org.hibernate.validator.constraints.NotBlank;

public class Trainer extends User {		
	private Long trainerId;
	
	@NotBlank(message="Please Enter a Bio")
	private String bio;
	
	@NotBlank(message="Please Enter Your Past Experience")
	private String pastExperience;
	
	@DecimalMin(value="0", message="Please Enter a Minimum Price")
	private BigDecimal trainerHourlyPrice;
	
	@NotBlank(message="Please Let Us Know About Your Training Philosophy")
	private String exercisePhilosophy;
	
	private boolean visibility;
	
	public String getFullName(){
		return super.getFirstName() + " " + super.getLastName();
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	public String getPastExperience() {
		return pastExperience;
	}
	public void setPastExperience(String pastExperience) {
		this.pastExperience = pastExperience;
	}
	
	public BigDecimal getTrainerHourlyPrice() {
		return trainerHourlyPrice;
	}
	public void setTrainerHourlyPrice(BigDecimal trainerHourlyPrice) {
		this.trainerHourlyPrice = trainerHourlyPrice;
	}
	public String getExercisePhilosophy() {
		return exercisePhilosophy;
	}
	public void setExercisePhilosophy(String exercisePhilosophy) {
		this.exercisePhilosophy = exercisePhilosophy;
	}
	public boolean isVisibility() {
		return visibility;
	}
	public void setVisibility(boolean visibility) {
		this.visibility = visibility;
	}

	public Long getTrainerId() {
		return trainerId;
	}
	
	public void setTrainerId(Long trainerId) {
		this.trainerId = trainerId;
	}

} 
