package com.techelevator.trainer.model;

import java.util.List;

import com.techelevator.beans.Client;
import com.techelevator.beans.Trainer;
import com.techelevator.beans.User;

public interface UserDAO {
	public void saveUser(User user, String password);
	public void saveTrainer(Trainer trainer, long id);
	public void saveClient(Client client, long id);
	public boolean searchForUsernameAndPassword(String user, String password);
	public void updatePassword(String user, String password);
	public String getUserRole(String username);
	public Trainer getTrainerByUsername(String username);
	public Client getClientByUsername(String username);
	public boolean seeIfUsernameExists(String username);
}
