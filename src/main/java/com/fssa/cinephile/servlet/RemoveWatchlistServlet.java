package com.fssa.cinephile.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.cinephile.services.WatchlistService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * Servlet implementation class RemoveWatchlistServlet
 */
@WebServlet("/RemoveWatchlist")
public class RemoveWatchlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	    int watchlistId = Integer.parseInt(request.getParameter("id"));
	    
	    WatchlistService watchlistService =new WatchlistService();
	    
	    try {
	    	watchlistService.removeWatchlist(watchlistId);
	    	response.sendRedirect("ListAllMovieServlet");
	    }catch(ServiceException e) {
        	PrintWriter out = response.getWriter();
            out.println(e.getMessage());
            e.printStackTrace();
        }
	}

}
