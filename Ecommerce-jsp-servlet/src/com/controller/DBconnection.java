package com.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {

	static {

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		}

		catch (Exception e) {
		}
	}

	static Connection con;

	public static Connection getMysqlConnection() {
		try {
			String dbUrl = "jdbc:mysql://localhost:3306/ecommerce_db";
			con = DriverManager.getConnection(dbUrl, "root", "");
			System.out.println("Connection established for MySQL server");
		} catch (Exception e) {
			System.out.println("Database connection exception=" + e);
		}
		return con;

	}

	public static Connection getOracleConnection() {
		return null;

	}

	public static void closeMysqlConnection(Connection con) {
		try {
			if (con != null) {
				con.close();
				System.out.println("Connection Closed***");
			}
		} catch (SQLException e) {
			System.out.println("The exception caught is = " + e);
		}

	}
	

}
