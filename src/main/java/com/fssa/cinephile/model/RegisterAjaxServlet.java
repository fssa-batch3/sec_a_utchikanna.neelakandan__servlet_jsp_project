package com.fssa.cinephile.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterAjaxServlet
 */
@WebServlet("/RegisterAjaxServlet")
public class RegisterAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password");

		PrintWriter out = response.getWriter();
		if (email == null || "".equals(email)) {
			out.println("Invalid Email");
		} else if (name == null || "".equals(name)) {
			out.println("Invalid Name");
		} else if (password == null || "".equals(password) || password.length() < 6) {
			out.println("Invalid password");
		} else {
			out.println("success");
		}
		out.flush();
		out.close();
	}

}