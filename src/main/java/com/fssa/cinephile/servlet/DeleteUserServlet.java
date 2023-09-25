package com.fssa.cinephile.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.cinephile.services.UserService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 /**
     * Handles the GET request for deleting a user.
     * 
     * @param request  The HTTP request object containing the movie ID parameter.
     * @param response The HTTP response object to send a response to the client.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs while processing the request.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       
        String id = request.getParameter("id");
        Integer userId = Integer.parseInt(id);


        UserService userService = new UserService();


        try {
           
        	userService.deleteUser(userId);

            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        } catch (ServiceException e) {
           
            PrintWriter out = response.getWriter();
            out.println(e.getMessage());
            e.printStackTrace();
        }
    }

}
