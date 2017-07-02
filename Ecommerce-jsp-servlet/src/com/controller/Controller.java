package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controller() {
		super();
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");

		try {
			out.println("<h1>Servlet Controller at " + request.getContextPath() + "</h1>");
		} finally {
			out.close();
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);

		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String login_name;
		String login_password;
		String registration_username;
		String registration_password;
		String username_exists;
		boolean result;

		// registration

		if (request.getParameter("registration_submit") != null) {

			registration_username = request.getParameter("registration_username");
			registration_password = request.getParameter("registration_password");

			System.out.println("registration_username before trimming = " + registration_username);
			System.out.println("registration_password before trimming = " + registration_password);
			
			System.out.println("registration username after trimming = " + registration_username.trim());
			System.out.println("registration_password after trimming = " + registration_password.trim());

			// Below code checks if the username or password is Null.
			// The following code is not necessary becauase, i have used
			// JavaScript for Form Validations.
			// Just kept this code as backup and understanding purposes!

			// server-side Validations
			if (registration_password.trim().equals("") || registration_username.trim().equals("")) {
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");
				try {
					out.println("<h1> Username or Password cannot be Null </h1>");
				} finally {
					out.close();
				}
			}

			username_exists = new Register().if_username_exists(registration_username.trim());
			System.out.println("username_exists true or false= " + username_exists);
			if (username_exists.equals("true")) {
				PrintWriter out = response.getWriter();
				try {
					out.println("<h1> Username Taken </h1>");
				} finally {
					out.close();
				}
			}

			else {

				result = new Register().register_user(registration_username.trim(), registration_password.trim());
				if (result == true) {
					PrintWriter out = response.getWriter();
					try {
						RequestDispatcher dispatcher = request.getRequestDispatcher("registersuccess.jsp");
						dispatcher.forward(request, response);
						// out.println("<h1> Registration Successful </h1>");
					} finally {
						out.close();
					}
				}
			}

		} else {

			PrintWriter out = response.getWriter();
			try {
				out.println("<h1> Registration Failure </h1>");
			} finally {
				out.close();
			}
		}
	}

}
