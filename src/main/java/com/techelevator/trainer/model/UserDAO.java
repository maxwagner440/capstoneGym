package com.techelevator.trainer.model;

public interface UserDAO {
	public void saveUser(String user, String password);

	public boolean searchForUsernameAndPassword(String user, String password);

	public void updatePassword(String user, String password);
	
	
}
