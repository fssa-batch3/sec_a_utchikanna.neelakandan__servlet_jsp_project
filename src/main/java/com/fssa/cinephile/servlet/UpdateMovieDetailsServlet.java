package com.fssa.cinephile.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.cinephile.model.MovieDetails;
import com.fssa.cinephile.services.MovieDetailsService;
import com.fssa.cinephile.services.MovieService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * Servlet implementation class UpdateMovieDetailsServlet
 */
@WebServlet("/UpdateMovieDetails")
public class UpdateMovieDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    String id = request.getParameter("detailsId");
        Integer movieDetailsId = Integer.parseInt(id);
        
        MovieDetailsService movieDetailsService = new MovieDetailsService();
        MovieDetails movieDetails = null;
        
        try {
        	movieDetails = movieDetailsService.getMovieDetailsById(movieDetailsId);
        }catch(ServiceException e) {
        	 PrintWriter out = response.getWriter();
             out.println(e.getMessage());
             e.printStackTrace();
        }
        request.setAttribute("toEditDetails", movieDetails);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("movie-details-edit-form.jsp");
        dispatcher.forward(request, response);
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		    String id = request.getParameter("Id");
		    System.out.println(id);
		    int movieDetailsId = Integer.parseInt(id);
	        
	        String story = request.getParameter("story");
	        String releaseDate = request.getParameter("releaseDate");
	        String awardName = request.getParameter("awardName");
	        String awardWiki = request.getParameter("awardWiki");
	        String movieLink = request.getParameter("movieLink");
	        String directorName = request.getParameter("directorName");
	        String directorWiki = request.getParameter("directorWiki");
	        
	        MovieDetails editMovieDetails = new MovieDetails();
	        editMovieDetails.setStory(story);
	        editMovieDetails.setReleaseDate(releaseDate);
	        editMovieDetails.setMovieDetailsId(movieDetailsId);
	        editMovieDetails.setAwardName(awardName);
	        editMovieDetails.setAwardWiki(awardWiki);
	        editMovieDetails.setMovieLink(movieLink);
	        editMovieDetails.setDirectorName(directorName);
	        editMovieDetails.setDirectorWiki(directorWiki);
	        
	        
	        MovieDetailsService movieDetailsService = new MovieDetailsService();
	        try {
	        	movieDetailsService.updateMovieDetails(editMovieDetails);
	        	response.sendRedirect("ListAllMovieServlet");
	        }catch(ServiceException e) {
	        	response.sendRedirect("movie-details-edit.jsp?error=" + e.getMessage());
	        }
	}

}
