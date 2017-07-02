package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Register {

	String username = "";
	String password = "";
	Connection con;
	String query;
	PreparedStatement pstmt;
	ResultSet rs;
	Statement stmt;
	int i;
	boolean registration_successful;
	String username_exists = "false";

	// check user already exists
	public String if_username_exists(String username) {

		this.username = username;
		query = "select username from login_details";
		con = DBconnection.getMysqlConnection();

		try {

			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while (rs != null && rs.next()) {
				if (rs.getString(1).equalsIgnoreCase(username)) {
					System.out.println("usrename_exists_in_database with the name\t\t" + rs.getString(1));
					username_exists = "true";
				} else {
					System.out.println("This is a new User about to SignUp\t\t" + username);
				}
			}

		}

		catch (Exception ex) {
			System.out.println("exception caught while reading username = " + ex);

		} finally {

			DBconnection.closeMysqlConnection(con);
		}

		return username_exists;
	}

	// register
	public boolean register_user(String username, String password) {
		this.username = username;
		this.password = password;
		System.out.println("username =" + username + ",password=" + password + "about to register***");
		try {
			con = DBconnection.getMysqlConnection();
			query = "insert into login_details values(?,?,?,?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, null);
			pstmt.setString(2, username);
			pstmt.setString(3, password);
			pstmt.setString(4, "user");
			i = pstmt.executeUpdate();
			if (i > 0) {
				System.out.println("User information successfully added to database********");
			}
			registration_successful = true;
		} catch (SQLException ex) {
			// Logger.getLogger(register.class.getName()).log(Level.SEVERE,
			// null, ex);
		} finally {

			DBconnection.closeMysqlConnection(con);
		}
		return registration_successful;
	}

}
