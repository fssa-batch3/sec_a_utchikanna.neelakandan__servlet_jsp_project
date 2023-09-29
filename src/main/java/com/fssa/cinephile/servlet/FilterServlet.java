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
 * Servlet implementation class FilterServlet
 */
@WebServlet("/Filter")
public class FilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 String type = request.getParameter("type");
		 
		 MovieService movieService = new MovieService();
		 
		 try {
			 
			List<Movie> filter = movieService.movieFilter(type);
	        request.setAttribute("movieList", filter);
	        
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
