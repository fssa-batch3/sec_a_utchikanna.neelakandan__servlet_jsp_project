package com.fssa.cinephile.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fssa.cinephile.model.Movie;

/**
 * Servlet implementation class GetAccountJSONServlet
 */
@WebServlet("/GetMovieServlet")
public class GetMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Movie movie = new Movie(3, "Leo", "https://pbs.twimg.com/media/FoDdg2WXEAomzQX?format=jpg&name=large");
		
		JSONObject movieJson = new JSONObject(movie);
		PrintWriter out = response.getWriter();
		out.println(movieJson.toString());
		out.flush();
	}

}