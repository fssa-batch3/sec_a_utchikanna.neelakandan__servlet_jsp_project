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
import com.fssa.cinephile.model.User;
import com.fssa.cinephile.services.UserService;
import com.fssa.cinephile.services.WatchlistService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * Servlet implementation class ShowWatchList
 */
@WebServlet("/ShowWatchList")
public class ShowWatchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	    String email = request.getParameter("email");
	    UserService userService = new UserService();
	    WatchlistService watchlistService = new WatchlistService();
	    
	    try{
	    	User user = userService.getUserByEmail(email);
	        int userId = user.getUserId();
	        List<Movie> userWatchlist = watchlistService.getMoviesInWatchlist(userId);
	   
	        request.setAttribute("userWatchlist", userWatchlist);
            RequestDispatcher dispatcher = request.getRequestDispatcher("watchList.jsp");
            dispatcher.forward(request, response);
	    }catch (ServiceException e) {
            // Handle any service-related exceptions by printing a stack trace
            e.printStackTrace();
        }
	}

}
