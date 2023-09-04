<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.cinephile.model.Movie"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<link
      rel="stylesheet"
      type="text/css"
      href="home.css"
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
<title>Cinephile home</title>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>


	<!-- Loop through the user list and generate user cards -->
	<%
	List<Movie> movieList = (List<Movie>) request.getAttribute("movieList");
	if (movieList != null && !movieList.isEmpty()) {
		%>
		<div class = "flex">
		<% 
		for (Movie movie : movieList) {
			
	%>



	<div class="box">
  <a href="../after-login/productDetails.html?id=${movie.id}" id="recently">
    <img id="image-1" src="<%=movie.getMovieImgUrl()%>" alt="image">
    <i id="star" class="fa fa-star"></i>
    <h3 class="rate"><%=movie.getMovieRating()%></h3>
    <h2 class="title"><%=movie.getMovieTitle()%></h2>
      <button class="btn">Trailer</button>
  </a>
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