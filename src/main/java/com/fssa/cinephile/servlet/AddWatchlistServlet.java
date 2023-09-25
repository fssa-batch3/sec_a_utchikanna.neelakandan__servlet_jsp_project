package com.fssa.cinephile.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.cinephile.model.User;
import com.fssa.cinephile.model.Watchlist;
import com.fssa.cinephile.services.UserService;
import com.fssa.cinephile.services.WatchlistService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * Servlet implementation class WatchlistServlet
 */
@WebServlet("/Watchlist")
public class AddWatchlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    
        String id = request.getParameter("id");
        Integer movieId = Integer.parseInt(id);
        
        String email = request.getParameter("email");
        
        WatchlistService watchlistService = new WatchlistService();
        UserService userService = new UserService();
      
        try {
        	User user = userService.getUserByEmail(email);
        	int userId = user.getUserId();
        	  Watchlist watchlist = new Watchlist(movieId,userId);
        	  watchlistService.addwatchlist(watchlist);
        	  response.sendRedirect("DetailsServlet");
        	  

        }catch (ServiceException e) {
			e.printStackTrace();
		}
	}

}
