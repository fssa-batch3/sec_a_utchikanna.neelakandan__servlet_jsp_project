package com.fssa.cinephile.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

/**
 * Servlet implementation class GetAllAccountJSONServlet
 */
@WebServlet("/GetAllAccountJSONServlet")
public class GetAllAccountJSONServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<Account> accounts = new ArrayList<Account> ();
		
		accounts.add(new Account("100","Bharath",1000, LocalDate.now()));
		accounts.add(new Account("200","Ram",2000, LocalDate.now()));
		accounts.add(new Account("300","Dhivya",3000, LocalDate.now()));
		JSONArray accountsJSonArray = new JSONArray(accounts);
		PrintWriter out = response.getWriter();
		out.println(accountsJSonArray.toString());
		out.flush();
		out.close();
	}

}