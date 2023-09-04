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
 * Servlet implementation class UpdateMovieServlet
 */
@WebServlet("/UpdateMovieServlet")
public class UpdateMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String id = request.getParameter("Id");

		Integer movieId = Integer.parseInt(id);
		System.out.println(movieId);

		MovieService  movieService = new MovieService();
		Movie movie = null;
		
		try {
			movie = movieService.getMovieById(movieId);
			System.out.println(movie.getMovieId());
		
		}catch(ServiceException e) {
			PrintWriter out = response.getWriter();
			out.println(e.getMessage());
			e.printStackTrace();
		}
		
		request.setAttribute("toEditMovie", movie);
		 
		RequestDispatcher dispatcher = request.getRequestDispatcher("movie-edit-form.jsp");
		dispatcher.forward(request, response);

	}

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
			String id = request.getParameter("Id");
			Integer movieId = Integer.parseInt(id);
			System.out.println(movieId);
			String rating = request.getParameter("rating");
			String title = request.getParameter("title");
			String imageUrl = request.getParameter("imageUrl");
			int rating1 = Integer.parseInt(rating);
			
			Movie editMovie = new Movie(title,movieId, rating1, imageUrl);
		List<Movie> movies = null; 
			MovieService movieService = new MovieService();
			
			try {
				movieService.updateMovie(editMovie);
				movies = movieService.listAllMovies();
				request.setAttribute("movieList", movies);
				RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
				dispatcher.forward(request, response);
			}catch(ServiceException e) {
				PrintWriter out = response.getWriter();
				out.println(e.getMessage());
				e.printStackTrace();
			}
			
		 
	 }
	 
}
