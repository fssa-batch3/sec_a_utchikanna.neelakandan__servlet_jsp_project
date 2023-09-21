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
 * Servlet implementation class UpdateUserDetailsServlet
 */
@WebServlet("/UpdateUserDetails")
public class UpdateUserDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Handles the GET request for viewing and editing a user's details.
	 *
	 * @param request  The HTTP request object containing the movie ID parameter.
	 * @param response The HTTP response object to send a response to the client.
	 * @throws ServletException If a servlet-specific error occurs.
	 * @throws IOException      If an I/O error occurs while processing the request.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("userDetails");

		UserService userService = new UserService();

		try {

			User user = userService.getUserByEmail(email);
            request.setAttribute("UserDetails", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("editProfile.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			response.sendRedirect("editProfile.jsp?errorMessage=" + e.getMessage());

			e.printStackTrace();
		}

	}

	/**
	 * Handles the POST request for updating a user's information.
	 *
	 * @param request  The HTTP request object containing movie information for
	 *                 updating.
	 * @param response The HTTP response object to send a response to the client.
	 * @throws ServletException If a servlet-specific error occurs.
	 * @throws IOException      If an I/O error occurs while processing the request.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String phoneNo = request.getParameter("phoneNo");
		String email = request.getParameter("email");
       
		long phoneNo1 = Long.parseLong(phoneNo);

		User editUser = new User(email,firstname ,lastname,phoneNo1);

		UserService userService = new UserService();

		try {

			userService.updateUser(editUser);

			 response.sendRedirect("ListAllMovieServlet");
		} catch (ServiceException e) {
			response.sendRedirect("editProfile.jsp?errorMessage=" + e.getMessage());
			e.printStackTrace();
		}
	}
}
