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
    	
        MovieService movieService = new MovieService();
        

        try {
         
        	List<Movie> result = movieService.listAllMovies();
            
            request.setAttribute("movieList", result);

            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
            dispatcher.forward(request, response);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
    }
}
