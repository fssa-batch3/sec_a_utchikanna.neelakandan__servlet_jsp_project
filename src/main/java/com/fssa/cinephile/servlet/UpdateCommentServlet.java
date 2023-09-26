package com.fssa.cinephile.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.cinephile.model.Comments;
import com.fssa.cinephile.model.User;
import com.fssa.cinephile.services.CommentService;
import com.fssa.cinephile.services.UserService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * Servlet implementation class UpdateCommentServlet
 */
@WebServlet("/UpdateComment")
public class UpdateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
      
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		  Integer movieId = Integer.parseInt(id);
		  
		  String email = request.getParameter("email");
		  UserService userService = new UserService();
		  CommentService commentService = new CommentService();
		  try {
			  User user = userService.getUserByEmail(email);
			  int userId = user.getUserId();
			  
			 String comment = commentService.getCommentByMovieAndUser(movieId,userId);
			 
		        request.setAttribute("toEditComment", comment);

		        // Forward the request to the movie-edit-form.jsp page for editing
		        RequestDispatcher dispatcher = request.getRequestDispatcher("DetailsServlet");
		        dispatcher.forward(request, response);
		  }catch (ServiceException e) {
	            // Handle any service-related exceptions by printing an error message
	            PrintWriter out = response.getWriter();
	            out.println(e.getMessage());
	            e.printStackTrace();
	        }
		  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String comment = request.getParameter("comment");
		
		CommentService commentService = new CommentService();
		
		try {
			Comments setComment = new Comments();
			setComment.setComment(comment);
			commentService.updateComment(setComment);
			response.sendRedirect("DetailsServlet");
		}catch (ServiceException e) {
            response.sendRedirect("movie-details.jsp?error=" + e.getMessage());
            e.printStackTrace();
        }
			
	}

}
