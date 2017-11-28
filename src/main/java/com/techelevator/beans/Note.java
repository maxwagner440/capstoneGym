package com.techelevator.beans;

import java.time.LocalDateTime;

public class Note {
	private String content;
	private LocalDateTime timeStamp;
	private long client_id;
	private String clientUsername;
	private long trainer_id;
	private String trainerUsername;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDateTime getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(LocalDateTime timeStamp) {
		this.timeStamp = timeStamp;
	}
	public long getClient_id() {
		return client_id;
	}
	public void setClient_id(long client_id) {
		this.client_id = client_id;
	}
	public long getTrainer_id() {
		return trainer_id;
	}
	public void setTrainer_id(long trainer_id) {
		this.trainer_id = trainer_id;
	}
	public String getClientUsername() {
		return clientUsername;
	}
	public void setClientUsername(String clientUsername) {
		this.clientUsername = clientUsername;
	}
	public String getTrainerUsername() {
		return trainerUsername;
	}
	public void setTrainerUsername(String trainerUsername) {
		this.trainerUsername = trainerUsername;
	}
	

}
