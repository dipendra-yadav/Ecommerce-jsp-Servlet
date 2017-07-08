package com.controller;

public class SessionBean {

	private String name;
	private String password;

	// const
	public void setName(String name) {
		System.out.println("Setting the bean name as = " + name);
		this.name = name;
	}

	// getters+setters
	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
