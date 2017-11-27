package com.techelevator.beans;

public class Request {

	private Long clientId;
	private Long trianerId;
	private int accept;
	
	
	public Long getClientId() {
		return clientId;
	}
	public void setClientId(Long clientId) {
		this.clientId = clientId;
	}
	public Long getTrianerId() {
		return trianerId;
	}
	public void setTrianerId(Long trianerId) {
		this.trianerId = trianerId;
	}
	public int getAccept() {
		return accept;
	}
	public void setAccept(int accept) {
		this.accept = accept;
	}
}
