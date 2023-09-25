package com.fssa.cinephile.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.cinephile.model.Comments;
import com.fssa.cinephile.model.Movie;
import com.fssa.cinephile.model.User;
import com.fssa.cinephile.services.CommentService;
import com.fssa.cinephile.services.UserService;
import com.fssa.cinephile.services.exceptions.ServiceException;



/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CommentService commentsService = new CommentService();


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String comment = request.getParameter("comment");
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		String email= request.getParameter("email");
		UserService userService = new UserService();
 		
		try {
			Comments comments = new Comments();
			User getUser = userService.getUserByEmail(email);
			int userId = getUser.getUserId();
			comments.setComment(comment);
			Movie movie = new Movie();
			User  user = new User();
			movie.setMovieId(movieId);
			user.setUserId(userId);
			comments.setMovie(movie);
			comments.setUser(user);
			commentsService.addComment(comments);
			response.sendRedirect("DetailsServlet?id="+movieId+"&email="+email);
         
		}catch (ServiceException e) {
			e.printStackTrace();
		}
		

	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int commentId = Integer.parseInt(request.getParameter("commentId"));
		String updatedDescription = request.getParameter("description");
		System.out.println(updatedDescription);
		System.out.println(commentId);
		Comments comment = new Comments();
        comment.setComment(updatedDescription);
		comment.setCommentId(commentId);
		try {
			commentsService.updateComment(comment);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int commentId = Integer.parseInt(request.getParameter("commentId"));

		try {
			commentsService.deleteComment(commentId);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}

}
