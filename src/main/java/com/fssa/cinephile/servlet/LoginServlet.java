package com.fssa.cinephile.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.cinephile.model.User;
import com.fssa.cinephile.services.UserService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * This servlet handles user login functionality.
 * It receives user email and password as parameters from a POST request, validates the login credentials using the UserService,
 * and either logs the user in, sets a session attribute, and redirects to the list of all movies, or displays an error message and redirects back to the login page.
 * 
 * @author UtchikannaNeelakanda
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles the POST request for user login.
     *
     * @param request  The HTTP request object containing user login information.
     * @param response The HTTP response object to send a response to the client.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs while processing the request.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Parameters from the login POST request
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Create an instance of the User model
        User user = new User(email, password);

        // Create an instance of the UserService to handle user login
        UserService logInService = new UserService();

        PrintWriter out = response.getWriter();

        try {
            if (logInService.logInUser(user)) {

                // Create a session and set the loggedInEmail attribute
                HttpSession session = request.getSession();
                session.setAttribute("loggedInEmail", email);

                // Redirect to the ListAllMovieServlet to display the list of movies
                response.sendRedirect("ListAllMovieServlet");
            } 
        } catch (ServiceException e) {
            // Redirect back to the login page with an error message in the query parameter
            response.sendRedirect("login.jsp?errorMessage=" + e.getMessage());
        }
    }

    /**
     * Handles the GET request for the login page.
     *
     * @param req  The HTTP request object for receiving the request.
     * @param resp The HTTP response object for sending the response.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs while processing the request.
     */
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
