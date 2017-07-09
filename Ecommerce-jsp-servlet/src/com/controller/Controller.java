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
    HashMap map = new HashMap();

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

		HttpSession session = request.getSession();
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
        session.invalidate();
        System.out.println("\nSession destroyed!");
        rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }

    
    
    //admin db insertion
    if (request.getParameter("admin_category") != null) {
        String classifier_name = (String) request.getParameter("admin_classifer_choice");
        System.out.println("\n\nthe product selected by admin is = " + classifier_name);
        session.setAttribute("classifier_name", classifier_name);
        request.setAttribute("db_insertion_result","success");

        String admin_mode = (String) session.getAttribute("admin_mode");
        if (admin_mode.equals("insert")) {
            rd = request.getRequestDispatcher("/admin_insert.jsp");
            rd.forward(request, response);
        }
        if (admin_mode.equals("update")) {
            rd = request.getRequestDispatcher("/admin_update.jsp");
            rd.forward(request, response);
        }
        if (admin_mode.equals("remove")) {
            rd = request.getRequestDispatcher("/admin_remove.jsp");
            rd.forward(request, response);
        }
    }
    
    //admin db insert/update 
    if (request.getParameter("admin_db_changes") != null) {
        String admin_mode = (String) session.getAttribute("admin_mode"); //using admin mode to switch between insert/update
        String classifier_name = (String) session.getAttribute("classifier_name");
        String admin_product_name = request.getParameter("admin_product_name");
        String admin_product_author_store_name = request.getParameter("admin_product_author_store_name");
        String admin_product_description = request.getParameter("admin_product_description");
        String admin_product_price = request.getParameter("admin_product_price");
        if (admin_mode.equals("insert")) {
            String db_insertion_result;
            db_insertion_result = new Query().insert_data_into_db(classifier_name, admin_product_name, admin_product_author_store_name, admin_product_description, admin_product_price);
            session.setAttribute("db_insertion_result", db_insertion_result);
            rd = request.getRequestDispatcher("/admin_insert.jsp");
            rd.forward(request, response);

        }
        if (admin_mode.equals("update")) {
            String db_update_result="";
            String admin_product_id=request.getParameter("admin_product_id");
            db_update_result = new Query().update_data_into_db(classifier_name, admin_product_id, admin_product_name, admin_product_author_store_name, admin_product_description, admin_product_price);
            session.setAttribute("db_update_result", db_update_result);
            rd = request.getRequestDispatcher("/admin_update.jsp");
            rd.forward(request, response);

        }
    }//admin db insertion/update ends here

   
    
  //admin db delete
    if (request.getParameter("admin_db_delete") != null) {            
        String classifier_name = (String) session.getAttribute("classifier_name");
        String admin_radio_selection = request.getParameter("admin_radio_delete");
        //System.out.println("admin_radio_selection = " + admin_radio_selection);
        String admin_id_or_name = request.getParameter("admin_id_or_name");
        //System.out.println("admin_id_or_name = " + admin_id_or_name);
        String db_deletion_result = "";
        db_deletion_result = new Query().remove_data(classifier_name,admin_radio_selection,admin_id_or_name);
        session.setAttribute("db_deletion_result",db_deletion_result);
        rd = request.getRequestDispatcher("/admin_remove.jsp");
        rd.forward(request, response);
    }
    
    
    
    //admin view all mode
    if (request.getParameter("admin_view_all_products") != null) {            
        String classifier_name = request.getParameter("admin_classifer_choice");
        session.setAttribute("classifier_name",classifier_name);
        System.out.println("\nclassifier_name from view all = " + classifier_name);
        map = new Query().get_product_info(classifier_name);            
        session.setAttribute("productname", map.get("productname"));
        session.setAttribute("brandname", map.get("brandname"));
        session.setAttribute("productdescription", map.get("productdescription"));
        session.setAttribute("productprice", map.get("productprice"));            
        session.setAttribute("productid", map.get("productid"));            
        rd = request.getRequestDispatcher("/admin_view_all.jsp");
        rd.forward(request, response);            
    }     


    
    
    
 }//ends doPost
}//ends controller
