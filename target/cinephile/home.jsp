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
      href="./assets/after-login/assets/css/movie.css"
    />

<meta charset="ISO-8859-1">

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

    

    <div class="showSugg"></div>

    <div class="filter">
      <button class="view" id="less" onclick="view()">Show All</button>
      <button class="view" id="Kollywood" onclick="showMoreMovie('Kollywood')">
        Kollywood
      </button>
      <button class="view" id="Hollywood" onclick="showMoreMovie('Hollywood')">
        Hollywood
      </button>
      <button class="view" id="WebSeries" onclick="showMoreMovie('WebSeries')">
        Web Series
      </button>
      <button
        class="view"
        id="AnimeSeries"
        onclick="showMoreMovie('AnimeSeries')"
      >
        Anime Series
      </button>
      <button class="view" id="SuperHero" onclick="showMoreMovie('SuperHero')">
        Super Hero Movies
      </button>
    </div>
    <button onclick="topFunction()" id="topBtn" title="Go to top">↑</button>
    
	<!-- Loop through the user list and generate user cards -->
<%
	List<Movie> movieList = (List<Movie>) request.getAttribute("movieList");
	HttpSession session1 = request.getSession();

	String loggedInEmail = (String) session1.getAttribute("loggedInEmail");
	User user = new User();
	user.setEmail(loggedInEmail);
	
	if (movieList != null && !movieList.isEmpty()) {
		%>
		<div class="menu" id="cardhid">
		<% 
		for (Movie movie : movieList) {
			
	%>


	<div class="box">
  <a href="DetailsServlet?id=<%=movie.getMovieId()%>">
    <img id="image-1" src="<%=movie.getMovieImgUrl()%>" alt="image">
    <i id="star" class="fa fa-star"></i>
    <h3 class="rate"><%=movie.getMovieRating()%>
    <h2 class="title"><%=movie.getMovieTitle()%></h2>
    </h3>
    <a class="try" href="<%=movie.getMovieTrailer() %>">
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
	%>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
 <script>
    function showMoreMovie(id) {
      let buttons = document.getElementsByClassName("view");
      for (const button of buttons) {
        button.style.backgroundColor = "white";
        button.style.color = "black";
      }

      let selectbutton = document.getElementById(id);
      selectbutton.style.backgroundColor = "black";
      selectbutton.style.color = "white";
      if (id == "Kollywood") {
        Kollywood();
      }
      if (id == "less1") {
        less();
      }
      if (id == "view") {
        view();
      }
      if (id == "Hollywood") {
        Hollywood();
      }
      if (id == "WebSeries") {
        WebSeries();
      }
      if (id == "AnimeSeries") {
        AnimeSeries();
      }
      if (id == "SuperHero") {
        SuperHero();
      }
    }
  </script>
  <script src="./assets/after-login/assets/js/star.js"></script>
  <script src="./assets/after-login/assets/js/showMore.js"></script>
  <script src="./assets/after-login/assets/js/search.js"></script>
  <script src="./assets/after-login/assets/js/hollywood.js"></script>
  <script src="./assets/after-login/assets/js/kollywood.js"></script>
  <script src="./assets/after-login/assets/js/anime.js"></script>
  <script src="./assets/after-login/assets/js/webSeries.js"></script>
  <script src="./assets/after-login/assets/js/superHero.js"></script>
  <script src="./assets/after-login/assets/js/recent.js"></script>
  <script src="./assets/after-login/assets/js/upcoming.js"></script>
  <script src="./assets/after-login/assets/js/home.js"></script>

</html>