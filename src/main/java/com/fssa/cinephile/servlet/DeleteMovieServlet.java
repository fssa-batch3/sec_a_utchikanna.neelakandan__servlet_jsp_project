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
 * Servlet implementation class DeleteMovieServlet
 */
@WebServlet("/DeleteMovieServlet")
public class DeleteMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("Id");
		Integer movieId = Integer.parseInt(id);
		System.out.println(movieId);
		
		MovieService movieService = new MovieService();
		
		List <Movie> movies = null;
		
		try{
			movieService.deleteMovie(movieId);
			
			movies = movieService.listAllMovies();
			HttpSession session = request.getSession(false);
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
