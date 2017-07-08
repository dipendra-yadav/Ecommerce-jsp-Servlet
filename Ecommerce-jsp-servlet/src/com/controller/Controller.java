package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;
import com.controller.SessionBean;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controller() {
		super();
	}

	HashMap authentication_status_map = new HashMap();
	SessionBean bean = new SessionBean();

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

		HttpSession session = request.getSession(true);
		RequestDispatcher rd=null;

		// registration

		if (request.getParameter("registration_submit") != null) {

			registration_username = request.getParameter("registration_username");
			registration_password = request.getParameter("registration_password");

			//System.out.println("\nregistration_username before trimming = " + registration_username);
			//System.out.println("\nregistration_password before trimming = " + registration_password);

			System.out.println("\nregistration username after trimming = " + registration_username.trim());
			System.out.println("\nregistration_password after trimming = " + registration_password.trim());

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
			System.out.println("\nusername_exists true or false \t" + username_exists);
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
						RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
						dispatcher.forward(request, response);
						// out.println("<h1> Registration Successful </h1>");
					} finally {
						out.close();
					}
				}
			}

		} /*else {

			PrintWriter out = response.getWriter();
			try {
				out.println("<h1> Registration Failure </h1>");
			} finally {
				out.close();
			}
		}
*/
		// Login

		if (request.getParameter("login_submit") != null) {

			login_name = request.getParameter("login_name");
			login_password = request.getParameter("login_password");

			System.out.println("\nlogin_name and password  after trimming = ");
			System.out.println("\nlogin_name= " + login_name.trim());

			System.out.println("\nlogin_password = " + login_password.trim());
			username_exists = new Register().if_username_exists(login_name.trim());

			// if userName already exists
			if (username_exists.equals("false")) {
				session.setAttribute("authentication", "Auth_Failure");
				rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}

			// check auhthentication
			if (username_exists.equals("true")) {

				authentication_status_map = new Authentication().authenticate(login_name.trim(), login_password.trim()); // check
																															// for
																															// admin
																															// here.
																															// redirect
																															// 2
																															// admin
																															// page..

				String authentication_status = (String) authentication_status_map.get("authentication_status");
				String IsAdmin = (String) authentication_status_map.get("IsAdmin");
				System.out.println("\nAuthentication status = " + authentication_status + " user = " + IsAdmin);

				// if authentication is true
				if (authentication_status.equals("true")) {
					bean.setName(login_name);
					request.setAttribute("name", login_name);
					session.setAttribute("name", login_name);
					System.out.println("\nAuthentication Succesfull. User granted permission!!");

					// check for user/admin
					if (IsAdmin.equals("user")) {
						session.setAttribute("authentication", "Auth_Success");
						rd = request.getRequestDispatcher("/user_cart.jsp");
						rd.forward(request, response);
					} else {
						session.setAttribute("authentication", "Auth_Success");
						session.setAttribute("IsAdmin", "yes");
						rd = request.getRequestDispatcher("/admin.jsp");
						rd.forward(request, response);
					}

				} else {
					System.out.println("\nUsername or Password does not exists!!");
					session.setAttribute("authentication", "Auth_Failure");
					rd = request.getRequestDispatcher("/index.jsp");
					rd.forward(request, response);

				}
			}

		}
	
	
	
	// logout!

    if (request.getParameter("signout") != null) {
        System.out.println("\nReached log out in the controller!!");
        //Query.clearSession();            
       // session.setAttribute("authentication", null);
        session.removeAttribute("authentication"); //clearing the authentication
        session.setAttribute("name", null); // clearing the session name
       /* session.removeAttribute("product_name");
        session.removeAttribute("productname");
        session.removeAttribute("db_insertion_result");
        session.removeAttribute("db_deletion_result");
        session.removeAttribute("db_update_result");            
        session.removeAttribute("productdescription");
        session.removeAttribute("brandname");
        session.removeAttribute("productprice");
        session.removeAttribute("quantity_in_cart");
        session.setAttribute("product_in_cart",null);
        session.removeAttribute("product_in_cart");
        session.setAttribute("classifier_name", null);
        session.removeAttribute("classifier_name");
       // total_cart_items = 0;
        session.removeAttribute("total_cart_items");
       */ 
        
        response.setHeader("Cache-Control", "no-store"); //when you hit back, it displays "Confirm page Submission"
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        System.out.println("\nSession destroyed!");
        rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }

 }//ends doPost
}//ends controller
