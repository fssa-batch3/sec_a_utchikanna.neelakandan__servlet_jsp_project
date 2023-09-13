<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.cinephile.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link
      rel="stylesheet"
      type="text/css"
      href="home.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<meta charset="ISO-8859-1">
<title>Cinephile</title>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

    

	<!-- Loop through the user list and generate user cards -->
	<%
	List<Movie> movieList = (List<Movie>) request.getAttribute("movieList");
	HttpSession session1 = request.getSession();

	String loggedInEmail = (String) session1.getAttribute("loggedInEmail");
	User user = new User();
	user.setEmail(loggedInEmail);
	
	if (movieList != null && !movieList.isEmpty()) {
		%>
		<div id="movieList" class = "flex">
		<% 
		for (Movie movie : movieList) {
			
	%>


	<div class="box">
  <a href="" id="recently">
    <img id="image-1" src="<%=movie.getMovieImgUrl()%>" alt="image">
    <i id="star" class="fa fa-star"></i>
    <span class="rate"><%=movie.getMovieRating()%></span>
    <span class="title1"><%=movie.getMovieTitle()%></span>
      <input class="btn1" type = "submit" value ="Trailer">
    
  </a>
         <%
      if(loggedInEmail.equals("admin@gmail.com")){
    	  %>
    	  <a class="edit" href="UpdateMovieServlet?Id=<%=movie.getMovieId()%>">Edit</a>
    	  <a class="delete" href="DeleteMovieServlet?Id=<%=movie.getMovieId()%>">Delete</a>
    	  <%
       }
      %>
</div>
	 

	<%
	}
	%>
	  </div>
		<%
	} else {
	%>
	<p>No movie available.</p>
	<%
	}
	%>
</body>
</html>