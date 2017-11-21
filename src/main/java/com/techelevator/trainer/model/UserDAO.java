package com.techelevator.trainer.model;

import java.util.List;

import com.techelevator.beans.Client;
import com.techelevator.beans.Trainer;
import com.techelevator.beans.User;

public interface UserDAO {
	public void saveUser(User user, String password);
	public void saveTrainer(Trainer trainer, long id);
	public void saveClient(Client client, long id);
	public boolean searchForEmailAndPassword(String email, String password);
	public boolean searchForUsernameAndPassword(String user, String password);
	public void updatePassword(String user, String password);
	public String getUserRole(String email);
	public Trainer getTrainerByEmail(String email);
	public Client getClientByEmail(String email);
	public boolean seeIfEmailExists(String email);
	public boolean getTrainerPrivacySetting(long userId);
	public void toggleTrainerPrivacySetting(long userId, boolean privacy);
	public Trainer getTrainerByUsername(String username);
	//public Client getClientByUsername(String username);
	//public boolean seeIfUsernameExists(String username);

}
