<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.fssa.cinephile.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
    <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="../assets/images/Cinephile.png"
    />
    <link rel="stylesheet" type="text/css" href="./assets/css/movie.css" />

    <title>Movie Details</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
    <br /><br />
    <br />
    <%
			String errorMessage = request.getParameter("errorMessage");
			if (errorMessage != null) {
			%>
			<br />
			<div>
				<span style="color: red;"><%=errorMessage%></span>

				<!-- this will change based on invalid field entered -->
			</div>
			
	<%
			}else{
	%>
      <%
    MovieDetails movieDetails = new MovieDetails(); 
      movieDetails = (MovieDetails) request.getAttribute("movieDetails");
   
		if(movieDetails != null){
   %>
   
   <div class="firstBox">
      <div>
        <iframe
          width="600"
          height="400"
          id="trailer"
          title="YouTube video player"
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
          allowfullscreen
          src="<%movieDetails.getMovie().getMovieTrailer();%>"
        ></iframe>
        <div class="left">
          <h2 id="movie_title"></h2>
          <hr />
          <h2>
            <b>Rating:</b> <span id="rateOfTheMovie"><%movieDetails.getMovie().getMovieRating(); %></span><span>/5</span
            ><span id="count"></span>
          </h2>
          <hr />
          <h2>About the Movie</h2>
          <p id="contentOfMovie"><%movieDetails.getStory(); %></p>
          <hr />
          <p><b>Released date:</b><span id="releaseDate"><%movieDetails.getReleaseDate(); %></span></p>
          <hr />
          <p>
            <b>Director:</b
            ><a id="directorLink"><span id="directorName"></span></a>
          </p>
          <hr />
          <p>
            <b>Cinematography:</b
            ><a id="mDirectorLink"><span id="mDirectorName"></span></a>
          </p>
          <hr />
        </div>
      </div>
    </div>
   
   <%
	}
   %>
   <%
	}
   %>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>