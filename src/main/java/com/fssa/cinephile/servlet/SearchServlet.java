package com.fssa.cinephile.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MovieService movieService = new MovieService();
		PrintWriter out = response.getWriter();

		try {
			// Retrieve the list of all movies from the MovieService
			List<Movie> moives = movieService.listAllMovies();

			// Set the list of movies as an attribute in the request
			request.setAttribute("searchMovieList", moives);

			JSONArray result = new JSONArray(moives);
			out.print(result);
		} catch (ServiceException e) {
			// Handle any service-related exceptions by printing a stack trace
			e.printStackTrace();
		}
	}

}
