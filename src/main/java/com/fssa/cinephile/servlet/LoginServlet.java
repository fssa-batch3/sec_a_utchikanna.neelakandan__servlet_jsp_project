package com.fssa.cinephile.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.cinephile.model.Movie;
import com.fssa.cinephile.model.User;
import com.fssa.cinephile.services.MovieService;
import com.fssa.cinephile.services.UserService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * Servlet implementation class LoginServlet
 * 
 *@author UtchikannaNeelakanda
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Paramaeter of the login post
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// Instance of the user model
		User user = new User(email, password);
//		// Instance of the UserService logIn user Service
		UserService logInService = new UserService();

		PrintWriter out = response.getWriter();


			try {
				if (logInService.logInUser(user)) {
					out.println("Login Successfully");

					HttpSession session = request.getSession();
					session.setAttribute("loggedInEmail", email);
					
					response.sendRedirect("ListAllMovieServlet");
				     
				
				} 

			} catch (ServiceException e) {
				response.sendRedirect("login.jsp?errorMessage="+e.getMessage());	
//				out.println(e.getMessage());
			}
		}
		
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}

}