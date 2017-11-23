package com.techelevator.trainer.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.beans.Client;
import com.techelevator.beans.Message;
import com.techelevator.beans.Trainer;
import com.techelevator.beans.User;
import com.techelevator.trainer.security.PasswordHasher;

@Component
public class JDBCUserDAO implements UserDAO {

	private JdbcTemplate jdbcTemplate;
	private PasswordHasher passwordHasher;

	@Autowired
	public JDBCUserDAO(DataSource dataSource, PasswordHasher passwordHasher) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.passwordHasher = passwordHasher;
	}
	
	@Override
	public void saveUser(User user, String password) { //need tests.
		byte[] salt = passwordHasher.generateRandomSalt();
		String hashedPassword = passwordHasher.computeHash(password, salt);
		String saltString = new String(Base64.encode(salt));
		Long userId = jdbcTemplate.queryForObject("INSERT INTO users(email, username, password, first_name, last_name, age, salt, role) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?) returning user_id", Long.class, user.getEmail(), user.getUsername(), hashedPassword, user.getFirstName(), user.getLastName(),
				user.getAge(), saltString, user.getRole());
		user.setId(userId);
	}
	
	@Override
	public void saveTrainer(Trainer trainer, long id) { //need tests.
		jdbcTemplate.update("INSERT INTO trainers (bio, philosophy, "
				+ "experience, hourly_price, user_id, visibility" 
				+ ") VALUES (?, ?, ?, ?, ?, ?)",
				trainer.getBio(), trainer.getExercisePhilosophy(),
				trainer.getPastExperience(),
				trainer.getTrainerHourlyPrice(), id, false);
	}
	
	@Override
	public void saveClient(Client client, long id) {
		jdbcTemplate.update("INSERT INTO clients (goal, height, modality, weight, user_id " 
				+ ") VALUES (?, ?, ?, ?, ?)",
				client.getGoals(), client.getHeightInInches(),
				client.getModalityPreference(), client.getWeightInPounds(), id);
	}
	
	@Override
	public boolean searchForEmailAndPassword(String email, String password) {
		String sqlSearchForUser = "SELECT * "+
							      "FROM users "+
							      "WHERE email = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, email);
		if(results.next()) {
			String storedSalt = results.getString("salt");
			String storedPassword = results.getString("password");
			String hashedPassword = passwordHasher.computeHash(password, Base64.decode(storedSalt));
			return storedPassword.equals(hashedPassword);
		} else {
			return false;
		}
	}
	
	@Override
	public boolean searchForUsernameAndPassword(String userName, String password) {
		String sqlSearchForUser = "SELECT * "+
							      "FROM users "+
							      "WHERE username = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, userName);
		if(results.next()) {
			String storedSalt = results.getString("salt");
			String storedPassword = results.getString("password");
			String hashedPassword = passwordHasher.computeHash(password, Base64.decode(storedSalt));
			return storedPassword.equals(hashedPassword);
		} else {
			return false;
		}
	}

	@Override //needs tests
	public String getUserRole(String email) { 
		// TODO Auto-generated method stub
		String sqlSearchForUser = "SELECT role "+
			      "FROM users "+
			      "WHERE email = ?";

		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, email);
		if(results.next()){
			return results.getString("role");
		} else{
			return null;
		}
	}
	
	@Override //needs tests
	public String getUserRole(long userId) { 
		// TODO Auto-generated method stub
		String sqlSearchForUser = "SELECT role "+
			      "FROM users "+
			      "WHERE user_id = ?";

		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, userId);
		if(results.next()){
			return results.getString("role");
		} else{
			return null;
		}
	}
	
	@Override
	public Trainer getTrainerByEmail(String email) { //need to test.
		// TODO Auto-generated method stub
		String sqlSearchForTrainer = "SELECT * "+
			      "FROM users u LEFT JOIN trainers t ON u.user_id=t.user_id "+
			      "WHERE email = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForTrainer, email);
		
		if(results.next()){
			return mapRowToTrainer(results);
		} else{
			return null;
		}
	}

	@Override
	public Client getClientByEmail(String email) { //need to test.
		// TODO Auto-generated method stub
		String sqlSearchForClient = "SELECT * "+
			      "FROM users u LEFT JOIN clients c ON u.user_id=c.user_id "+
			      "WHERE email = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForClient, email);
		
		if(results.next()){
			return mapRowToClient(results);
		} else{
			return null;
		}
	}

	@Override
	public Trainer getTrainerByUsername(String username) { //need to test.
		// TODO Auto-generated method stub
		String sqlSearchForTrainer = "SELECT * "+
			      "FROM users u JOIN trainers t ON u.user_id=t.user_id "+
			      "WHERE username = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForTrainer, username);
		
		if(results.next()){
			return mapRowToTrainer(results);
		} else{
			return null;
		}
	}
//
//	@Override
//	public Client getClientByUsername(String username) { //need to test.
//		// TODO Auto-generated method stub
//		String sqlSearchForClient = "SELECT * "+
//			      "FROM users u LEFT JOIN clients c ON u.user_id=c.client_id "+
//			      "WHERE username = ?";
//		
//		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForClient, username);
//		
//		if(results.next()){
//			return mapRowToClient(results);
//		} else{
//			return null;
//		}
//	}
	
	private Trainer mapRowToTrainer(SqlRowSet results){ //need to test.
		Trainer tBone=new Trainer();
		
		mapGenericUserInfoFromRowToRoleType(tBone, results);
		
		tBone.setBio(results.getString("bio"));
		tBone.setExercisePhilosophy(results.getString("philosophy"));
		tBone.setPastExperience(results.getString("experience"));
		tBone.setTrainerHourlyPrice(results.getBigDecimal("hourly_price"));
		tBone.setVisibility(results.getBoolean("visibility"));
		tBone.setTrainerId(results.getLong("trainer_id"));
		
		return tBone;
	}
	
	private Client mapRowToClient(SqlRowSet results){ //need to test.
		Client guy=new Client();
		
		mapGenericUserInfoFromRowToRoleType(guy, results);
		
		guy.setGoals(results.getString("goal"));
		guy.setHeightInInches(results.getDouble("height"));
		guy.setModalityPreference(results.getString("modality"));
		guy.setWeightInPounds(results.getDouble("weight"));
		guy.setClientId(results.getLong("client_id"));
		return guy;
	}
	
	private void mapGenericUserInfoFromRowToRoleType(User user, SqlRowSet results){ //need to test.
		user.setAge(results.getInt("age"));
		user.setFirstName(results.getString("first_name"));
		user.setLastName(results.getString("last_name"));
		user.setId(results.getLong("user_id"));
		user.setRole(results.getString("role"));
		user.setUsername(results.getString("username"));
	}
	
	public boolean seeIfEmailExists(String email){ //need to test.
		String sqlGetAllUsernames = "SELECT username FROM users WHERE email = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllUsernames, email);
		return results.next();
	}
	
//	public boolean seeIfUsernameExists(String username){ //need to test.
//		String sqlGetAllUsernames = "SELECT username FROM users WHERE username = ?";
//		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllUsernames, username);
//		return results.next();
//	}
	
	@Override
	public void updatePassword(String userName, String password) {
		byte[] salt = passwordHasher.generateRandomSalt();
		String hashedPassword = passwordHasher.computeHash(password, salt);
		String saltString = new String(Base64.encode(salt));
		jdbcTemplate.update("UPDATE users SET password = ?, salt = ? WHERE username = ?", hashedPassword, saltString, userName);
	}

//	@Override
//	public boolean getTrainerPrivacySetting(long userId) {
//		String command = "SELECT visibility FROM trainers WHERE user_id = ?";
//		SqlRowSet results = jdbcTemplate.queryForRowSet(command, userId);
//		results.next();
//		return results.getBoolean("visibility");
//	}

	@Override
	public void toggleTrainerPrivacySetting(long userId, boolean privacy) {
		String command = "UPDATE trainers SET visibility=? WHERE user_id=?";
		jdbcTemplate.update(command, !privacy, userId);
	}
	

	//Methods for searching for and getting different users
	@Override
	public List<Trainer> getAllTrainers(){
		List<Trainer> trainers=new ArrayList<Trainer>();
		String command="SELECT * FROM users u JOIN trainers t ON u.user_id=t.user_id WHERE u.role= 'Trainer'";
		SqlRowSet rows=jdbcTemplate.queryForRowSet(command);
		
		while(rows.next()){
			trainers.add(mapRowToTrainer(rows));
		}
		
		return trainers;
		
	}

	@Override
	public Trainer getTrainerById(long userID) {
		String command="SELECT * FROM users u JOIN trainers t ON u.user_id=t.user_id WHERE u.user_id=? ";
		SqlRowSet rows=jdbcTemplate.queryForRowSet(command, userID);
		Trainer trainer=null;
		if(rows.next()){
			trainer=mapRowToTrainer(rows);
		}
		return trainer;
	}

	@Override
	public void saveClientTrainerRelsationship(long clientID, long trainerID) {
		String command="INSERT INTO clients_trainers(client_id, trainer_id) VALUES (?, ?)";
		jdbcTemplate.update(command, clientID, trainerID);
	}

	//Messaging
	@Override
	public void saveMessage(Message msg) {
		String saveToMsgContentTable="INSERT INTO message_content message_content (content, time_stamp) VALUES (?, ?) returning message_content_id";
		Long msgContentId=jdbcTemplate.queryForObject(saveToMsgContentTable, Long.class, msg.getContent(), msg.getDateTime());
		
		String saveIntoFromUserToUserMsgTable="INSERT INTO messages_users (message_creator_id, message_reciever_id, message_content_id) VALUES (?, ?, ?)";
		jdbcTemplate.update(saveIntoFromUserToUserMsgTable, msg.getMessageCreatorUserId(), msg.getMessageRecieverUserId(), msgContentId);
		
	}

	@Override
	public List<Message> getMessagesRankedByTimeForUser(long userId) {
		// TODO Auto-generated method stub
		List<Message> messages=new ArrayList<>();
		String getMessages="SELECT * FROM message_users mu JOIN message_content mc ON mu.message_content_id=mc.message_content_id WHERE message_reciever_user_id=? ORDER BY time_stamp DESC";
		SqlRowSet rows=jdbcTemplate.queryForRowSet(getMessages, userId);
		while(rows.next()){
			messages.add(mapRowToMessage(rows));
		}
		return messages;
	}

	@Override
	public boolean trainerCanMessageClient(long trainerId, long clientId) { 
		String command="SELECT  WHERE user_id IN "
				+ "(SELECT user_id FROM clients c JOIN client_trainers ct ON c.client_id=ct.client_id WHERE client_Id IN "
				+ "(SELECT client_id FROM client_trainers WHERE trainer_id=? " //AND relationship_established='1') "
				+ "UNION "
				+ "SELECT message_creator_user_id FROM message_users WHERE message_receiver_id=?) and user_id=?";
		SqlRowSet rows=jdbcTemplate.queryForRowSet(command, trainerId, trainerId, clientId);
		
		return rows.next();
		
	}
	
	private Message mapRowToMessage(SqlRowSet rows){
		Message msg=new Message();
		msg.setContent(rows.getString("content"));
		msg.setDateTime(rows.getTimestamp("time_stamp").toLocalDateTime());
		msg.setMessageCreatorUserId(rows.getLong("message_creator_user_id"));
		msg.setMessageRecieverUserId(rows.getLong("message_receiver_user_id"));
		return msg;
	}

	//Notes
	@Override
	public void saveThisTrainersNoteForThatClient(long trainerId, long clientId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void viewAllNotesFromThatTrainerForThisClient(long clientId, long trainerId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void viewAllNotesForThatClientFromThisTrainer(long trainerId, long clientId) {
		// TODO Auto-generated method stub
		
	}
	
	
}

