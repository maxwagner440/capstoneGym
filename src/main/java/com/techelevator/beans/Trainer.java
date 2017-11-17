package com.techelevator.beans;

import java.math.BigDecimal;

public class Trainer extends User {
	private double rating;
	private String bio;
	private String pastExperience;
	private String pastClientSuccessStories;
	private BigDecimal trainerHourlyPrice;
	private String exercisePhilosophy;
	
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
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
	public String getPastClientSuccessStories() {
		return pastClientSuccessStories;
	}
	public void setPastClientSuccessStories(String pastClientSuccessStories) {
		this.pastClientSuccessStories = pastClientSuccessStories;
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
} 
