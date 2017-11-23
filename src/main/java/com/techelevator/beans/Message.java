package com.techelevator.beans;

import java.time.LocalDateTime;

public class Message {
	private String content;
	private LocalDateTime dateTime;
	private long messageCreatorUserId;
	private long messageRecieverUserId;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDateTime getDateTime() {
		return dateTime;
	}
	public void setDateTime(LocalDateTime dateTime) {
		this.dateTime = dateTime;
	}
	public long getMessageCreatorUserId() {
		return messageCreatorUserId;
	}
	public void setMessageCreatorUserId(long messageCreatorUserId) {
		this.messageCreatorUserId = messageCreatorUserId;
	}
	public long getMessageRecieverUserId() {
		return messageRecieverUserId;
	}
	public void setMessageRecieverUserId(long messageRecieverUserId) {
		this.messageRecieverUserId = messageRecieverUserId;
	}
}
