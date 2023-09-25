package com.fssa.cinephile.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.cinephile.services.CommentService;
import com.fssa.cinephile.services.exceptions.ServiceException;

/**
 * Servlet implementation class DeleteCommentServlet
 */
@WebServlet("/DeleteComment")
public class DeleteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		  String id = request.getParameter("id");
	        Integer commentId = Integer.parseInt(id);
	        
	        CommentService commentService = new CommentService();
	        
	        try {
	        	commentService.deleteComment(commentId);
	        	response.sendRedirect("ListAllMovieServlet");
	        }catch (ServiceException e) {
	              PrintWriter out = response.getWriter();
	            out.println(e.getMessage());
	            e.printStackTrace();
	        }
		
	}


}
