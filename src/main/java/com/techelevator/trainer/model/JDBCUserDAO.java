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
		jdbcTemplate.update("INSERT INTO users(username, password, salt, role) VALUES (?, ?, ?, ?)", user.getUsername(), hashedPassword, saltString, user.getRole());
	}
	
	@Override
	public void saveTrainer(Trainer trainer, long id) { //need tests.
		jdbcTemplate.update("INSERT INTO trainers (age, bio, exercise_philosophy, first_name, last_name, "
				+ "past_client_success_stories, past_experience, rating, trainer_hourly_price, trainer_id" 
				+ ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
				trainer.getAge(), trainer.getBio(), trainer.getExercisePhilosophy(), 
				trainer.getFirstName(), trainer.getLastName(), trainer.getPastClientSuccessStories(), 
				trainer.getPastExperience(), trainer.getRating(), trainer.getTrainerHourlyPrice(), id);
	}
	
	@Override
	public void saveClient(Client client, long id) {
		jdbcTemplate.update("INSERT INTO trainers (age, goal, height_in_inches, first_name, last_name, "
				+ "modality_preference, weight_in_pounds, client_id" 
				+ ") VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
				client.getAge(), client.getGoals(), client.getHeightInInches(), 
				client.getFirstName(), client.getLastName(), client.getModalityPreference(), 
				client.getWeightInPounds(), id);
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
	public String getUserRole(String username) { 
		// TODO Auto-generated method stub
		String sqlSearchForUser = "SELECT role "+
			      "FROM users "+
			      "WHERE username = ?";

		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, username);
		if(results.next()){
			return results.getString("role");
		} else{
			return null;
		}
	}

	@Override
	public Trainer getTrainerByUsername(String username) { //need to test.
		// TODO Auto-generated method stub
		String sqlSearchForTrainer = "SELECT * "+
			      "FROM users u JOIN trainers t ON u.user_id=t.trainer_id"+
			      "WHERE username = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForTrainer, username);
		
		if(results.next()){
			return mapRowToTrainer(results);
		} else{
			return null;
		}
	}

	@Override
	public Client getClientByUsername(String username) { //need to test.
		// TODO Auto-generated method stub
		String sqlSearchForClient = "SELECT * "+
			      "FROM users u JOIN clients c ON u.user_id=c.client_id"+
			      "WHERE username = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForClient, username);
		
		if(results.next()){
			return mapRowToClient(results);
		} else{
			return null;
		}
	}
	
	private Trainer mapRowToTrainer(SqlRowSet results){ //need to test.
		Trainer tBone=new Trainer();
		
		mapGenericUserInfoFromRowToRoleType(tBone, results);
		
		tBone.setBio(results.getString("bio"));
		tBone.setExercisePhilosophy(results.getString("exercise_philosophy"));
		tBone.setPastClientSuccessStories(results.getString("past_client_success_stories"));
		tBone.setPastExperience(results.getString("past_experience"));
		tBone.setRating(results.getDouble("rating"));
		tBone.setTrainerHourlyPrice(results.getBigDecimal("trainer_hourly_price"));
		
		return tBone;
	}
	
	private Client mapRowToClient(SqlRowSet results){ //need to test.
		Client guy=new Client();
		
		mapGenericUserInfoFromRowToRoleType(guy, results);
		
		guy.setGoals(results.getString("goals"));
		guy.setHeightInInches(results.getDouble("height_in_inches"));
		guy.setModalityPreference(results.getString("modalityPreference"));
		guy.setWeightInPounds(results.getDouble("weightInPounds"));
		
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
	
	public boolean seeIfUsernameExists(String username){ //need to test.
		String sqlGetAllUsernames = "SELECT username FROM users WHERE username = ?";
			     
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllUsernames, username);
		
		return results.next();
		
	}
	
	@Override
	public void updatePassword(String userName, String password) {
		byte[] salt = passwordHasher.generateRandomSalt();
		String hashedPassword = passwordHasher.computeHash(password, salt);
		String saltString = new String(Base64.encode(salt));
		jdbcTemplate.update("UPDATE users SET password = ?, salt = ? WHERE username = ?", hashedPassword, saltString, userName);
	}
}

