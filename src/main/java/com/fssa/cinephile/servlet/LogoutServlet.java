package com.fssa.cinephile.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * This servlet handles user logout functionality.
 * It invalidates the user's session, removing session attributes and redirects the user to the login page.
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles the GET request for user logout.
     *
     * @param request  The HTTP request object for receiving the request.
     * @param response The HTTP response object for sending the response.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs while processing the request.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Remove the "loggedInEmail" session attribute
            session.removeAttribute("loggedInEmail");
            System.out.println("Existing Session ID:" + session.getId());

            // Invalidate the session, removing all session attributes
            session.invalidate();
        } else {
            System.out.println("No Session Exists");
        }

        // Redirect to the login page since the user has logged out
        response.sendRedirect("login.jsp");
    }
}
