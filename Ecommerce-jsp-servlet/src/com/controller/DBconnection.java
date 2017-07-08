package com.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
			System.out.println("\nConnection established for MySQL server");
		} catch (Exception e) {
			System.out.println("\nDatabase connection exception=" + e);
		}
		return con;

	}

	public static Connection getOracleConnection() {
		return null;

	}

	public static void closeMysqlConnection(Connection con, Statement stmt, PreparedStatement pstmt) {

		try {
			if (pstmt != null) {
				pstmt.close();
				System.out.println("\npstmt Closed***");
			}
		} catch (SQLException e) {
			System.out.println("\nThe exception caught is = " + e);
		}

		try {
			if (stmt != null) {
				stmt.close();
				System.out.println("\nstmt Closed***");
			}
		} catch (SQLException e) {
			System.out.println("\nThe exception caught is = " + e);
		}

		try {
			if (con != null) {
				con.close();
				System.out.println("\nConnection Closed***");
			}
		} catch (SQLException e) {
			System.out.println("\nThe exception caught is = " + e);
		}

	}

}
