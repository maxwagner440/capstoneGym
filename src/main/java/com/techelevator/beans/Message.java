package com.techelevator.beans;

import java.time.LocalDateTime;

public class Message {
	private String content;
	private LocalDateTime dateTime;
	private long messageCreatorUserId;
	private long messageReceiverUserId;
	private String username;
	
	public String getDate(){
		return dateTime.getMonthValue() + "-" + dateTime.getDayOfMonth() + "-" + dateTime.getYear();
	}
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
	public long getMessageReceiverUserId() {
		return messageReceiverUserId;
	}
	public void setMessageReceiverUserId(long messageReceiverUserId) {
		this.messageReceiverUserId = messageReceiverUserId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
