package com.fssa.cinephile.servlet;

import java.io.IOException;

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
 * This servlet handles user registration functionality.
 * It receives user registration information as parameters from a POST request,
 * creates a new User instance, and attempts to register the user using the UserService.
 * It then forwards the user to the login page if registration is successful or displays an error message and redirects back to the registration page.
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles the POST request for user registration.
     *
     * @param request  The HTTP request object containing user registration information.
     * @param response The HTTP response object to send a response to the client.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs while processing the request.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Retrieve user registration information from the request parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String phoneNo = request.getParameter("phoneNo");
        
        // Parse phone number to a long
        long phoneNo1 = Long.parseLong(phoneNo);
        
        // Create a new User instance with the provided registration information
        User user = new User(email, password, firstname, lastname, phoneNo1);
        
        // Create a UserService instance to handle user registration
        UserService userService = new UserService();
        
        try {
            // Attempt to register the user using the UserService
            if (userService.registerUser(user)) {
                // Forward the user to the login.jsp page if registration is successful
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (ServiceException e) {
            // Redirect back to the register.jsp page with an error message in the query parameter
            response.sendRedirect("register.jsp?errorMessage=" + e.getMessage());
        }
    }
}
