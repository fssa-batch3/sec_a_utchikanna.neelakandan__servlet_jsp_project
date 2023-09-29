package com.fssa.cinephile.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.cinephile.model.Movie;
import com.fssa.cinephile.services.MovieService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 MovieService movieService = new MovieService();
	        

	        try {
	            // Retrieve the list of all movies from the MovieService
	        	List<Movie> result = movieService.listAllMovies();
	            
	            // Set the list of movies as an attribute in the request
	            request.setAttribute("searchMovieList", result);

	            // Forward the request to the home.jsp page for display
	            RequestDispatcher dispatcher = request.getRequestDispatcher("header.jsp");
	            dispatcher.forward(request, response);
	        } catch (ServiceException e) {
	            // Handle any service-related exceptions by printing a stack trace
	            e.printStackTrace();
	        }
	}


}
