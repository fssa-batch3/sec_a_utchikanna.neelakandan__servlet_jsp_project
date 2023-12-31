package com.fssa.cinephile.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.cinephile.model.Movie;
import com.fssa.cinephile.services.MovieService;
import com.fssa.cinephile.services.RatingService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * This servlet handles the addition of a new movie to the cinephile's collection.
 * It receives movie information as parameters from a POST request, creates a new Movie instance,
 * and adds it to the collection using the MovieService. It then redirects to the list of all movies.
 */
@WebServlet("/AddMovieServlet")
public class MovieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles the POST request for adding a new movie.
     *
     * @param request  The HTTP request object containing movie information.
     * @param response The HTTP response object to send a response to the client.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs while processing the request.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Retrieve movie information from the request parameters
  
        String title = request.getParameter("title");
        String imageUrl = request.getParameter("imageUrl");
        String Trailer = request.getParameter("Trailer");
        String Type = request.getParameter("Type");
        

        
        
        
        // Create a new Movie instance with the provided information
        Movie movie = new Movie(title, imageUrl,Trailer,Type);
        
        try {
            // Create a MovieService instance to perform movie-related operations
            MovieService movieService = new MovieService();
            movieService.createMovie(movie);

            response.sendRedirect("GetMovieIdServlet");
            
     
        } catch (ServiceException e) {
            // Redirect back to the movie-form.jsp page with an error message in the query parameter
            response.sendRedirect("movie-form.jsp?error=" + e.getMessage());
        }
    }
}
