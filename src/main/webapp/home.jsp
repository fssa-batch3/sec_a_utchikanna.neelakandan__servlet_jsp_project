<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fssa.cinephile.model.*"%>

<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
 <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="./assets/images/Cinephile.png"
    />
    <title>Cinephile</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="./assets/after-login/assets/css/topBtn.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="./assets/after-login/assets/css/search.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="./assets/css/movie.css"
    />

<meta charset="ISO-8859-1">

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

    

    <div class="showSugg"></div>

    <div class="filter">
      <button class="view" id="kollywood" onclick="filter('kollywood')">
        Kollywood
      </button>
      <button class="view" id="hollywood" onclick="filter('hollywood')">
        Hollywood
      </button>
      <button class="view" id="webSeries" onclick="filter('webSeries')">
        Web Series
      </button>
      <button
        class="view"
        id="AnimeSeries"
        onclick="filter('animeSeries')"
      >
        Anime Series
      </button>
      <button class="view" id="superHero" onclick="filter('superHero')">
        Super Hero Movies
      </button>
    </div>
    <button onclick="topFunction()" id="topBtn" title="Go to top">↑</button>
    
	<!-- Loop through the user list and generate user cards -->
<%
HttpSession session1 = request.getSession();
String loggedInEmail = (String) session1.getAttribute("loggedInEmail");
    List<Movie> filterList = (List<Movie>) request.getAttribute("toFilterMovie");

if (filterList != null && !filterList.isEmpty()) {
	%>
	<div class="menu" id="cardhid">
	<% 
	for (Movie movie : filterList) {
		
%>


<div class="box">
<a href="DetailsServlet?id=<%=movie.getMovieId()%>&email=<%=loggedInEmail %>">
<img id="image-1" src="<%=movie.getMovieImgUrl()%>" alt="image">
<h3 class="title"><%=movie.getMovieTitle()%></h3>
<a class="try" href="<%=movie.getMovieTrailer()%>">
  <button class="btn" type = "submit" >Trailer</button>
</a>
</a>
</div>
<%
}
%>
  </div>
  <%
}else{
    
	List<Movie> movieList = (List<Movie>) request.getAttribute("movieList");

	User user = new User();
	user.setEmail(loggedInEmail);
	
	if (movieList != null && !movieList.isEmpty()) {
		%>
		<div class="menu" id="cardhid">
		<% 
		for (Movie movie : movieList) {
			
	%>


	<div class="box">
  <a href="DetailsServlet?id=<%=movie.getMovieId()%>&email=<%=loggedInEmail %>">
    <img id="image-1" src="<%=movie.getMovieImgUrl()%>" alt="image">
    <h3 class="title"><%=movie.getMovieTitle()%></h3>
    <a class="try" href="<%=movie.getMovieTrailer()%>">
      <button class="btn" type = "submit" >Trailer</button>
    </a>
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
}
	%>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
    function filter(type) {
    	
      axios.get("Filter?type="+type).then(response => {
    	  let buttons = document.getElementsByClassName("view");
          for (const button of buttons) {
            button.style.backgroundColor = "white";
            button.style.color = "black";
          }

          let selectbutton = document.getElementById(type);
          selectbutton.style.backgroundColor = "black";
          selectbutton.style.color = "white";
        })
        .catch(error => {
          console.error('Selected category is empty:', error);
        });
     
    }
  </script>

</html>