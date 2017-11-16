package com.techelevator.beans;

public class Trainer extends User {
	private int rating;
	private String bio;
	private String pastExperience;
	private String pastClientSuccessStories;
	private double trainerHourlyPrice;
	private String exercisePhilosophy;
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
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
	public double getTrainerHourlyPrice() {
		return trainerHourlyPrice;
	}
	public void setTrainerHourlyPrice(double trainerHourlyPrice) {
		this.trainerHourlyPrice = trainerHourlyPrice;
	}
	public String getExercisePhilosophy() {
		return exercisePhilosophy;
	}
	public void setExercisePhilosophy(String exercisePhilosophy) {
		this.exercisePhilosophy = exercisePhilosophy;
	}
} 
