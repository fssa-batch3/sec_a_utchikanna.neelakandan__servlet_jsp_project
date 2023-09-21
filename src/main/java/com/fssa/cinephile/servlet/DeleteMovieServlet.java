package com.fssa.cinephile.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.cinephile.model.Movie;
import com.fssa.cinephile.services.MovieService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * This servlet handles the deletion of a movie from a cinephile's collection.
 * It receives a movie ID as a parameter and deletes the corresponding movie record.
 * After deletion, it retrieves the updated list of movies and forwards the user back to the home page.
 */
@WebServlet("/DeleteMovieServlet")
public class DeleteMovieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles the GET request for deleting a movie.
     * 
     * @param request  The HTTP request object containing the movie ID parameter.
     * @param response The HTTP response object to send a response to the client.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs while processing the request.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve the movie ID parameter from the request
        String id = request.getParameter("Id");
        Integer movieId = Integer.parseInt(id);

        // Create a MovieService instance to perform movie-related operations
        MovieService movieService = new MovieService();

        List<Movie> movies = null;

        try {
            // Delete the movie with the specified ID
            movieService.deleteMovie(movieId);

            // Retrieve the updated list of movies
            movies = movieService.listAllMovies();

            // Set the list of movies as an attribute in the request
            request.setAttribute("movieList", movies);

            // Forward the request to the home.jsp page
            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
            dispatcher.forward(request, response);
        } catch (ServiceException e) {
            // Handle any service-related exceptions by printing an error message
            PrintWriter out = response.getWriter();
            out.println(e.getMessage());
            e.printStackTrace();
        }
    }
}
