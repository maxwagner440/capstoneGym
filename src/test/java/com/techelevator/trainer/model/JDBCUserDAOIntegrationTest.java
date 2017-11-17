package com.techelevator.trainer.model;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.junit.Assert.*;

import java.sql.SQLException;

import org.apache.commons.dbcp2.BasicDataSource;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.techelevator.beans.Client;
import com.techelevator.beans.Trainer;
import com.techelevator.beans.User;
import com.techelevator.trainer.model.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration("/test-config.xml")
@Transactional
public class JDBCUserDAOIntegrationTest {

	@Autowired private BasicDataSource dataSource;
	@Autowired private UserDAO userDAO;
	
	@After
	public void rollback() throws SQLException {
		dataSource.getConnection().rollback();
	}

	@Test
	public void returns_true_if_userName_and_password_match() {
		User spidey=new User();
		spidey.setUsername("spiderman");
		spidey.setRole("Superhero");
		userDAO.saveUser(spidey, "uncleBen");
		boolean result = userDAO.searchForUsernameAndPassword("spiderman", "uncleBen");
		assertThat(result, equalTo(true));
	}

	@Test
	public void returns_false_if_userName_does_not_exist() {
		User spidey=new User();
		spidey.setUsername("spiderman");
		spidey.setRole("Superhero");
		User anty=new User();
		anty.setUsername("antman");
		
		userDAO.saveUser(spidey, "uncleBen");
		boolean result = userDAO.searchForUsernameAndPassword(anty.getUsername(), "uncleBen");
		assertThat(result, equalTo(false));
	}

	@Test
	public void returns_false_if_userName_exists_but_password_is_incorrect() {
		User spidey=new User();
		spidey.setUsername("spiderman");
		spidey.setRole("Superhero");
		userDAO.saveUser(spidey, "uncleBen");
		boolean result = userDAO.searchForUsernameAndPassword("spiderman", "uncleBob");
		assertThat(result, equalTo(false));
	}
	
	@Test
	public void password_is_case_sensitive() {
		User spidey=new User();
		spidey.setUsername("spiderman");
		spidey.setRole("Superhero");
		userDAO.saveUser(spidey, "uncleBen");
		boolean result = userDAO.searchForUsernameAndPassword("spiderman", "uncleben");
		assertThat(result, equalTo(false));
	}
	
	@Test
	public void password_update_works(){
		User spidey = new User();
		spidey.setUsername("spiderman");
		spidey.setRole("Superhero");
		userDAO.saveUser(spidey, "uncleBen");
		userDAO.updatePassword("spiderman", "heyHey");
		boolean result = userDAO.searchForUsernameAndPassword("spiderman", "heyHey");
		assertThat(result, equalTo(true));
	}
	
	@Test
	public void test_to_see_if_user_exists(){
		User spidey = new User();
		spidey.setUsername("spiderman");
		spidey.setRole("Superhero");
		userDAO.saveUser(spidey, "uncleBen");
		boolean result = userDAO.seeIfUsernameExists("spiderman");
		assertThat(result, equalTo(true));
	}
	
	@Test
	public void test_get_client_by_username(){
		Client spidey = new Client();
		spidey.setUsername("spiderman");
		spidey.setRole("Superhero");
		userDAO.saveUser(spidey, "uncleBen");
		Client result = userDAO.getClientByUsername("spiderman");
		
		assertEquals(result.getUsername(), spidey.getUsername());
	}
	
	@Test 
	public void test_get_trainer_by_username(){
		Trainer spidey = new Trainer();
		spidey.setUsername("spiderman");
		spidey.setRole("Superhero");
		userDAO.saveUser(spidey, "uncleBen");
		Trainer result = userDAO.getTrainerByUsername("spiderman");
		
		assertEquals(result.getUsername(), spidey.getUsername());
	}
	
	
}
