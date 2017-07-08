package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class Authentication {

	String username = "";
	String password = "";
	boolean result;
	Connection con;
	PreparedStatement pstmt;
	Statement stmt;
	String query;
	ResultSet rs;
	String authentication_status;
	String IsAdmin;
	// holds user authentication and whether or not he is an user/admin and a
	// legitimate user.
	HashMap<String, String> authentication_status_map = new HashMap<String, String>();

	// to authenticate
	public HashMap<String, String> authenticate(String username, String password) {
		try {
			this.username = username;
			this.password = password;
			con = DBconnection.getMysqlConnection();
			query = "select password from login_details where username='" + username + "'";
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs != null && rs.next()) {
				String db_password = rs.getString(1);
				if (db_password.equals(password)) {
					System.out.println("\nThe password matches");
					authentication_status = "true";
					// check if admin
					IsAdmin = isAdmin();
				} else {
					System.out.println("\nPassword doesn't match");
					authentication_status = "false";
				}
			}
			authentication_status_map.put("authentication_status", authentication_status);
			authentication_status_map.put("IsAdmin", IsAdmin);
			System.out.println("\nauthentication_status_map = " + authentication_status_map);
		} catch (SQLException ex) {
			// Logger.getLogger(authentication.class.getName()).log(Level.SEVERE,
			// null, ex);
		} finally {

			DBconnection.closeMysqlConnection(con,null,pstmt);

		}
		return authentication_status_map;
	}

	// check for admin
	public String isAdmin() {
		try {
			query = "select role from login_details where username='" + username + "'";
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs != null && rs.next()) {
				IsAdmin = rs.getString(1);
				if (IsAdmin.equals("ADMIN")) {
					System.out.println("\nThe user is an admin");
					IsAdmin = "ADMIN";
				} else {
					IsAdmin = "user";
					System.out.println("\nThe user is an user");
				}
			}
		} catch (SQLException ex) {
			//Logger.getLogger(authentication.class.getName()).log(Level.SEVERE, null, ex);
		}
		return IsAdmin;
	}

}
