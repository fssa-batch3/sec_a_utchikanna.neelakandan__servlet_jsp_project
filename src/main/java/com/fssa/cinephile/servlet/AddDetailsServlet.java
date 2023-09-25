package com.fssa.cinephile.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.cinephile.model.Movie;
import com.fssa.cinephile.model.MovieDetails;
import com.fssa.cinephile.services.MovieDetailsService;
import com.fssa.cinephile.services.exceptions.ServiceException;
import com.fssa.cinephile.validation.exceptions.ValidationException;

@WebServlet("/AddDetailsServlet")
public class AddDetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve movie details from the request parameters
        String story = request.getParameter("story");
        String releaseDateStr = request.getParameter("releaseDate");
        String awardName = request.getParameter("awardName");
        String id = request.getParameter("movieId");
        String awardWiki = request.getParameter("awardWiki");
        String movieLink = request.getParameter("movieLink");
        String directorName = request.getParameter("directorName");
        String directorWiki = request.getParameter("directorWiki");

        int  movieId= Integer.parseInt(id);

        // Create a new MovieDetails instance with the provided information
        MovieDetails movieDetails = new MovieDetails();
        movieDetails.setStory(story);
        movieDetails.setReleaseDate(releaseDateStr);
        movieDetails.setAwardName(awardName);
        movieDetails.setAwardWiki(awardWiki);
        movieDetails.setMovieLink(movieLink);
        movieDetails.setDirectorName(directorName);
        movieDetails.setDirectorWiki(directorWiki);
        // Create a new Movie instance to link with MovieDetails
        Movie movie = new Movie();
        movie.setMovieId(movieId); // Set the movie ID accordingly
        // Set the Movie object in MovieDetails
        movieDetails.setMovie(movie);

        try {
            // Create a MovieService instance to perform movie-related operations
            MovieDetailsService movieDetailsService = new MovieDetailsService();

            // Create the movie details using the MovieService
            movieDetailsService.createMovieDetails(movieDetails);

            // Redirect to a success page or another appropriate location
            response.sendRedirect("ListAllMovieServlet");
        } catch (ServiceException | ValidationException e) {
            // Redirect back to the movie-details-form.jsp page with an error message in the query parameter
            response.sendRedirect("add-more-details.jsp?error=" + e.getMessage());
        }
    }
}
