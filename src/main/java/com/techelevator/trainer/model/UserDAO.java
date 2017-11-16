package com.techelevator.trainer.model;

import com.techelevator.beans.User;

public interface UserDAO {
	public void saveUser(User user, String password);

	public boolean searchForUsernameAndPassword(String user, String password);

	public void updatePassword(String user, String password);
	
	
}
