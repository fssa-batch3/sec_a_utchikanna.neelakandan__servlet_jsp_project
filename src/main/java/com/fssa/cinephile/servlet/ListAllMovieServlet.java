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
 * This servlet handles the listing of all movies in the cinephile's collection.
 * It retrieves the list of movies from the MovieService and forwards it to the home.jsp page for display.
 */
@WebServlet("/ListAllMovieServlet")
public class ListAllMovieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles the GET request for listing all movies.
     *
     * @param request  The HTTP request object for receiving the request.
     * @param response The HTTP response object for sending the response.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs while processing the request.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Create a MovieService instance to perform movie-related operations
    	
        MovieService movieService = new MovieService();
        

        try {
            // Retrieve the list of all movies from the MovieService
        	List<Movie> result = movieService.listAllMovies();
            
            // Set the list of movies as an attribute in the request
            request.setAttribute("movieList", result);

            // Forward the request to the home.jsp page for display
            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
            dispatcher.forward(request, response);
        } catch (ServiceException e) {
            // Handle any service-related exceptions by printing a stack trace
            e.printStackTrace();
        }
    }
}
