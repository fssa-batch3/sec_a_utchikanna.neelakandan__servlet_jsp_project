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
 * Servlet implementation class GetMovieIdServlet
 */
@WebServlet("/GetMovieIdServlet")
public class GetMovieIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		MovieService movieService = new MovieService();
		try {
			List<Movie> getAll = movieService.listAllMovies();
			 
			 int lastIndex = getAll.size() - 1;
		        if (lastIndex >= 0) {
		            Movie lastMovie = getAll.get(lastIndex);
		            int movieId = lastMovie.getMovieId(); 
		            String id = ""+movieId;
		            System.out.println(id);
		            request.setAttribute("MovieId", id);
				      RequestDispatcher dispatcher = request.getRequestDispatcher("add-more-details.jsp");
				      dispatcher.forward(request, response);
		        } 
		     
		} catch (ServiceException e) {
			e.printStackTrace();
		}
        
	}

	

}
