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

import com.fssa.cinephile.model.Movie;
import com.fssa.cinephile.services.MovieService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * This servlet handles updating a movie's information.
 * It allows the user to view and edit a specific movie's details and then updates the movie using the MovieService.
 */
@WebServlet("/UpdateMovieServlet")
public class UpdateMovieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles the GET request for viewing and editing a movie's details.
     *
     * @param request  The HTTP request object containing the movie ID parameter.
     * @param response The HTTP response object to send a response to the client.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs while processing the request.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the movie ID parameter from the request
        String id = request.getParameter("Id");
        Integer movieId = Integer.parseInt(id);
        System.out.println(movieId);

        // Create a MovieService instance to perform movie-related operations
        MovieService movieService = new MovieService();
        Movie movie = null;

        try {
            // Get the movie details by ID
            movie = movieService.getMovieById(movieId);
            System.out.println(movie.getMovieId());
        } catch (ServiceException e) {
            // Handle any service-related exceptions by printing an error message
            PrintWriter out = response.getWriter();
            out.println(e.getMessage());
            e.printStackTrace();
        }

        // Set the movie to be edited as an attribute in the request
        request.setAttribute("toEditMovie", movie);

        // Forward the request to the movie-edit-form.jsp page for editing
        RequestDispatcher dispatcher = request.getRequestDispatcher("movie-edit-form.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Handles the POST request for updating a movie's information.
     *
     * @param request  The HTTP request object containing movie information for updating.
     * @param response The HTTP response object to send a response to the client.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs while processing the request.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the movie ID parameter from the request
        String id = request.getParameter("Id");
        Integer movieId = Integer.parseInt(id);
        System.out.println(movieId);

        // Retrieve updated movie information from the request parameters
        String rating = request.getParameter("rating");
        String title = request.getParameter("title");
        String imageUrl = request.getParameter("imageUrl");
        int rating1 = Integer.parseInt(rating);

        // Create a new Movie instance with the updated information
        Movie editMovie = new Movie(title, movieId, rating1, imageUrl);
        List<Movie> movies = null;
        MovieService movieService = new MovieService();

        try {
            // Update the movie using the MovieService
            movieService.updateMovie(editMovie);

            // Get the updated list of movies
            movies = movieService.listAllMovies();

            // Set the list of movies as an attribute in the request
            request.setAttribute("movieList", movies);

            // Forward the request to the home.jsp page
            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
            dispatcher.forward(request, response);
        } catch (ServiceException e) {
            // Redirect back to the movie-edit-form.jsp page with an error message in the query parameter
            response.sendRedirect("movie-edit-form.jsp?error=" + e.getMessage());
            e.printStackTrace();
        }
    }
}
