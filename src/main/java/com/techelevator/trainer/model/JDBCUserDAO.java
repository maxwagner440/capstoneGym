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
		jdbcTemplate.update("INSERT INTO users(email, username, password, first_name, last_name, age, salt, role) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)", user.getEmail(), user.getUsername(), hashedPassword, user.getFirstName(), user.getLastName(),
				user.getAge(), saltString, user.getRole());
	}
	
	@Override
	public void saveTrainer(Trainer trainer, long id) { //need tests.
		jdbcTemplate.update("INSERT INTO trainers (bio, philosophy, "
				+ "success_stories, experience, hourly_price, trainer_id" 
				+ ") VALUES (?, ?, ?, ?, ?, ?)",
				trainer.getBio(), trainer.getExercisePhilosophy(),
				trainer.getTrainerHourlyPrice(), id);
	}
	
	@Override
	public void saveClient(Client client, long id) {
		jdbcTemplate.update("INSERT INTO clients (goal, height, modality, weight, client_id " 
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
	
//	@Override
//	public boolean searchForUsernameAndPassword(String userName, String password) {
//		String sqlSearchForUser = "SELECT * "+
//							      "FROM users "+
//							      "WHERE username = ?";
//		
//		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, userName);
//		if(results.next()) {
//			String storedSalt = results.getString("salt");
//			String storedPassword = results.getString("password");
//			String hashedPassword = passwordHasher.computeHash(password, Base64.decode(storedSalt));
//			return storedPassword.equals(hashedPassword);
//		} else {
//			return false;
//		}
//	}

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
	
	@Override
	public Trainer getTrainerByEmail(String email) { //need to test.
		// TODO Auto-generated method stub
		String sqlSearchForTrainer = "SELECT * "+
			      "FROM users u LEFT JOIN trainers t ON u.user_id=t.trainer_id "+
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
			      "FROM users u LEFT JOIN clients c ON u.user_id=c.client_id "+
			      "WHERE email = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForClient, email);
		
		if(results.next()){
			return mapRowToClient(results);
		} else{
			return null;
		}
	}

//	@Override
//	public Trainer getTrainerByUsername(String username) { //need to test.
//		// TODO Auto-generated method stub
//		String sqlSearchForTrainer = "SELECT * "+
//			      "FROM users u LEFT JOIN trainers t ON u.user_id=t.trainer_id "+
//			      "WHERE username = ?";
//		
//		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForTrainer, username);
//		
//		if(results.next()){
//			return mapRowToTrainer(results);
//		} else{
//			return null;
//		}
//	}
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
		
		return tBone;
	}
	
	private Client mapRowToClient(SqlRowSet results){ //need to test.
		Client guy=new Client();
		
		mapGenericUserInfoFromRowToRoleType(guy, results);
		
		guy.setGoals(results.getString("goal"));
		guy.setHeightInInches(results.getDouble("height"));
		guy.setModalityPreference(results.getString("modality"));
		guy.setWeightInPounds(results.getDouble("weight"));
		
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

	@Override
	public boolean getTrainerPrivacySetting(String userName) {
		String command = "SELECT visibillity FROM trainers WHERE username = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(command, userName);
		results.next();
		return results.getBoolean("visibillity");
	}

	@Override
	public void toggleTrainerPrivacySetting(String userName) {
		String command = "UPDATE trainers SET visibillity=? WHERE username=?";
		jdbcTemplate.update(command, !getTrainerPrivacySetting(userName), userName);
	}
}

