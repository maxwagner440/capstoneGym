package com.techelevator.trainer.model;

import java.util.List;

import com.techelevator.beans.Client;
import com.techelevator.beans.Message;
import com.techelevator.beans.Note;
import com.techelevator.beans.Request;
import com.techelevator.beans.Trainer;
import com.techelevator.beans.User;

public interface UserDAO {
	public void saveUser(User user, String password);
	public void saveTrainer(Trainer trainer, long id);
	public void saveClient(Client client, long id);
	public boolean searchForEmailAndPassword(String email, String password);
	public Client getClientById(long userID);
	public boolean searchForUsernameAndPassword(String user, String password);
	public void updatePassword(String user, String password);
	public String getUserRole(String email);
	public String getUserRole(long userId);
	public Trainer getTrainerByEmail(String email);
	public Trainer getTrainerById (long trainerId);
	public User getUserById(long userID);
	public Client getClientByEmail(String email);
	public boolean seeIfEmailExists(String email);
	public boolean getTrainerPrivacySetting(long userId);
	public void toggleTrainerPrivacySetting(long userId);
	public Trainer getTrainerByUsername(String username);
	//public Client getClientByUsername(String username);
	//public boolean seeIfUsernameExists(String username);
	
	//search
	public List<Trainer> getAllTrainers();
	public void saveClientTrainerRelsationship(long clientId, long trainerId);
	public List<Trainer> searchForTrainer(String keyword);
	
	//Messaging
	public void saveMessage(String msg, Long loggedInId, Long receiverId);
	public List<Message> getMessagesRankedByTimeForUser(long userId);
	public boolean trainerCanMessageClient(long trainerId, long clientId); //for restricting to whom trainer can send message to
	public List<Message> getRecentConversationBetweenTrainerAndClient(long receiverId, long senderId, int numOfRecentMessagesInThePast);
	//Notes
	
	public void saveThisTrainersNoteForThatClient(long trainerId, long clientId, Note note);
	public List<Note> viewAllNotesBetweenATrainerAndAClient(long clientId, long trainerId);
	public List<Note> trainerOptionViewAllMySentNotes(long trainerId);
	public List<Note> clientOptionViewAllMyRecievedNotes(long clientId);
	//public void viewAllNotesForThisTrainer(long trainerId);
	//public void viewAllNotesForThisClient(long clientId);
	User getUserByName(String first, String last);
	
	//Request Trainer
	public void acceptRequest(long clientID, long trainerID);
	public void denyRequest(long clientID, long trainerID);
	public List<Request> getAllRequestsForTrainer(long trainerId);

	public List<Client> viewAllClientsRequestingForTrainer(long trainerId);

	public List<Trainer> viewAllTrainersForClient(long clientId);

	public User getUserByUsername(String Username);
	public List<Client> getAllClientsFromTrainerId(Long trainerId);
	public Client getClientByClientId(long id);
	public List<Trainer> getAllPublicTrainers();


}
