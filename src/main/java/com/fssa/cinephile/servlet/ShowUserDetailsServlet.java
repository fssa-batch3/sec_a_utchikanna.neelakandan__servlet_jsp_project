package com.fssa.cinephile.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.cinephile.model.User;
import com.fssa.cinephile.services.UserService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * Servlet implementation class ShowUserDetailsServlet
 */
@WebServlet("/ShowUserDetailsServlet")
public class ShowUserDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 /**
     * Handles the GET request for User Details.
     *
     * @param request  The HTTP request object for receiving the request.
     * @param response The HTTP response object for sending the response.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs while processing the request.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    	String email = request.getParameter("email");
        UserService userService = new UserService();
        
        try {
        	User user = userService.getUserByEmail(email);
            request.setAttribute("userDetails", user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
            dispatcher.forward(request, response);
        } catch (ServiceException e) {
            // Handle any service-related exceptions by printing a stack trace
            e.printStackTrace();
        }
    }
}
