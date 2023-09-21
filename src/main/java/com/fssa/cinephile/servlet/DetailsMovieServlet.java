package com.fssa.cinephile.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.cinephile.model.MovieDetails;
import com.fssa.cinephile.model.User;
import com.fssa.cinephile.services.MovieDetailsService;
import com.fssa.cinephile.services.RatingService;
import com.fssa.cinephile.services.UserService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * Servlet implementation class DetailsMovieServlet
 */
@WebServlet("/DetailsServlet")
public class DetailsMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * Handles the GET request for displaying movie details.
	 *
	 * @param request  The HTTP request object for receiving the request.
	 * @param response The HTTP response object for sending the response.
	 * @throws ServletException If a servlet-specific error occurs.
	 * @throws IOException      If an I/O error occurs while processing the request.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    int movieDetailsId = Integer.parseInt(request.getParameter("id"));
	    String email = request.getParameter("email");
	    MovieDetailsService movieDetailsService = new MovieDetailsService();
	    RatingService ratingService = new RatingService();
	    UserService userService = new UserService();
	    try {
	        // Retrieve movie details by movieDetailsId
	        MovieDetails movieDetails = movieDetailsService.getMovieDetailsById(movieDetailsId);
	        User user = userService.getUserByEmail(email);
	        int userId = user.getUserId();
	       Map<String, Object> avg =  ratingService.getAverageRatingAndCountByMovie(movieDetailsId);
	       
	       int moviesRating = ratingService.getRatingByMovieAndUser(movieDetailsId, userId);
	        
         
	        if (movieDetails != null) {
	            // Forward the movie details to a JSP for rendering
	            request.setAttribute("movieDetails", movieDetails);
	            request.setAttribute("average", avg);
	            request.setAttribute("rating", moviesRating);
	            request.setAttribute("userId", userId);
	            request.setAttribute("movieId", movieDetailsId);
	          
	            RequestDispatcher dispatcher = request.getRequestDispatcher("movie-details.jsp");
	            dispatcher.forward(request, response);
	        }
	    } catch (ServiceException e) {
	        // Handle any service-related exceptions by printing a stack trace
	    	response.sendRedirect("movie-details.jsp?errorMessage=" + e.getMessage());
	        e.printStackTrace();
	    }
	}

}
