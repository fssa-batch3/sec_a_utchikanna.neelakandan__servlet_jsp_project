package com.fssa.cinephile.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.cinephile.services.MovieDetailsService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * Servlet implementation class DeleteMovieDetailsServlet
 */
@WebServlet("/DeleteMovieDetails")
public class DeleteMovieDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("detailsId");
        Integer detailsId = Integer.parseInt(id);
        
        MovieDetailsService movieDetailsService = new MovieDetailsService();
        
        try {
        	movieDetailsService.deleteMovieDetails(detailsId);
        	response.sendRedirect("ListAllMovieServlet");
        	
        }catch(ServiceException e) {
        	PrintWriter out = response.getWriter();
            out.println(e.getMessage());
            e.printStackTrace();
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
