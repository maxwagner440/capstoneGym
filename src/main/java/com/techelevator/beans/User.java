package com.techelevator.beans;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class User {
	
	private long id;
	
	
	@NotBlank(message="Please enter an email") 
	@Email(message="Email must be a valid email address")
	private String email;

	@NotBlank(message="Please Enter a Username") 
	private String username;
	
	@NotBlank(message="Please Enter a First Name") 
	private String firstName;
	
	@NotBlank(message="Please Enter a Last Name") 
	private String lastName;
	
	@Min(value=13, message="Must Be At Least 13 Years Of Age")
	private int age;
	
	@NotBlank(message="Select A Box")
	private String role;

	private boolean isCorrectRole;
	
	@AssertTrue(message="Role Not Allowd")
	public boolean isCorrectRole(){
		return this.role.equalsIgnoreCase("trainer") || this.role.equalsIgnoreCase("client");
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	
}
