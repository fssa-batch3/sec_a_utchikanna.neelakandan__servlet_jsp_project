package com.fssa.cinephile.servlet;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.cinephile.model.Movie;
import com.fssa.cinephile.services.MovieService;
import com.fssa.cinephile.services.exceptions.ServiceException;

@WebServlet("/AddMovieServlet")
public class MovieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	String rating = request.getParameter("rating");
		String title = request.getParameter("title");
		String imageUrl = request.getParameter("imageUrl");
		int rating1 = Integer.parseInt(rating);
		
		Movie movie = new Movie(rating1, title, imageUrl);
		try {
			MovieService movieService = new MovieService();
			movieService.createMovie(movie);
		
			response.sendRedirect("ListAllMovieServlet");
		} catch (ServiceException e) {
			e.printStackTrace();

		}
    }
}