<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.fssa.cinephile.model.*"%>

<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="./assets/images/Cinephile.png" />
<title>Cinephile</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="./assets/css/search.css" />
<link rel="stylesheet" type="text/css" href="./assets/css/topBtn.css" />
<link rel="stylesheet" type="text/css" href="./assets/css/movie.css" />
<script src="./assets/js/backupData.js"></script>
<script src="./assets/js/addfav.js"></script>
<script src="./assets/js/commentData.js"></script>
<script src="./assets/js/feedbackData.js"></script>
<script src="./assets/js/userData.js"></script>
<script src="./assets/js/ratingData.js"></script>
<script src="./assets/js/recentJSON.js"></script>
</head>
<body>
	<ul>
		<img class="letter-c" src="./assets/images/letter-c.gif" alt="" />
		<h1>
			<span>inePhile</span>
		</h1>

		<li class="nav-list"><a href="ListAllMovieServlet">Home</a></li>
		<%
		String loggedInEmail = (String) session.getAttribute("loggedInEmail");
		if (loggedInEmail == null) {
		%>

		<li class="nav-list"><a href="./pages/about.html">About</a></li>
		<li class="nav-list"><a href="login.jsp">Log In</a></li>
		<li id="sign" class="nav-list"><a href="register.jsp">Sign Up</a>
		</li>
		<%
		} else {
		%>

		<%
		if (loggedInEmail.equals("admin@gmail.com")) {
		%>
		<li class="nav-list"><a href="movie-form.jsp">Add Movie</a></li>
		<li class="nav-list"><a href="LogoutServlet">Log Out</a></li>

		<%
		} else {
		%>
		<li class="nav-list"><a
			href="ShowWatchList?email=<%=loggedInEmail%>">Watchlist</a></li>
		<li class="nav-list"><a href="about.jsp">About</a></li>
		<li class="nav-list"><a href="#" class="adj"><img
				alt="image"
				src="https://img.myloview.com/posters/user-icon-vector-male-person-profile-avatar-symbol-in-circle-flat-color-glyph-pictogram-illustration-700-140985839.jpg"
				class="avatar-2" id="view_image" /></a>
			<ul class="dropdown">
				<li class="dropdown-list"><a href="LogoutServlet">Log Out</a></li>
				<li class="dropdown-list"><a
					href="ShowUserDetailsServlet?email=<%=loggedInEmail%>">Personal
						Details</a></li>
			</ul></li>
		<%
		}
		%>

		<%
		}
		%>
	</ul>

	<div class="input-container">
		<input placeholder="Search Movie..." class="input" name="text"
			type="text" id="searchbar" autocomplete="off" />
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
			class="icon">
        <g stroke-width="0" id="SVGRepo_bgCarrier"></g>
        <g stroke-linejoin="round" stroke-linecap="round"
				id="SVGRepo_tracerCarrier"></g>
        <g id="SVGRepo_iconCarrier">
          <rect fill="white"></rect>
          <path
				d="M7.25007 2.38782C8.54878 2.0992 10.1243 2 12 2C13.8757 2 15.4512 2.0992 16.7499 2.38782C18.06 2.67897 19.1488 3.176 19.9864 4.01358C20.824 4.85116 21.321 5.94002 21.6122 7.25007C21.9008 8.54878 22 10.1243 22 12C22 13.8757 21.9008 15.4512 21.6122 16.7499C21.321 18.06 20.824 19.1488 19.9864 19.9864C19.1488 20.824 18.06 21.321 16.7499 21.6122C15.4512 21.9008 13.8757 22 12 22C10.1243 22 8.54878 21.9008 7.25007 21.6122C5.94002 21.321 4.85116 20.824 4.01358 19.9864C3.176 19.1488 2.67897 18.06 2.38782 16.7499C2.0992 15.4512 2 13.8757 2 12C2 10.1243 2.0992 8.54878 2.38782 7.25007C2.67897 5.94002 3.176 4.85116 4.01358 4.01358C4.85116 3.176 5.94002 2.67897 7.25007 2.38782ZM9 11.5C9 10.1193 10.1193 9 11.5 9C12.8807 9 14 10.1193 14 11.5C14 12.8807 12.8807 14 11.5 14C10.1193 14 9 12.8807 9 11.5ZM11.5 7C9.01472 7 7 9.01472 7 11.5C7 13.9853 9.01472 16 11.5 16C12.3805 16 13.202 15.7471 13.8957 15.31L15.2929 16.7071C15.6834 17.0976 16.3166 17.0976 16.7071 16.7071C17.0976 16.3166 17.0976 15.6834 16.7071 15.2929L15.31 13.8957C15.7471 13.202 16 12.3805 16 11.5C16 9.01472 13.9853 7 11.5 7Z"
				clip-rule="evenodd" fill-rule="evenodd"></path>
        </g>
      </svg>
	</div>
		<%
	List<Movie> movieList = (List<Movie>) request.getAttribute("searchMovieList");
	System.out.println(movieList);
	if (movieList != null && !movieList.isEmpty()) {
		%>
		<div class="showSugg">
		<% 
		for (Movie movie : movieList) {  
			
	    %>
		<div class="suggesDiv">
			<a class="suggesAng"
				href="DetailsServlet?id=<%=movie.getMovieId()%>&email=<%=loggedInEmail %>"><img
				class="suggesImg"
				src="<%=movie.getMovieImgUrl()%>"
				alt="image">
			<h2 class="suggesTitle"><%=movie.getMovieTitle()%></h2></a>
		</div>
		<%
		}
		%>
	</div>
	    <%
		}
		%>
	<br />
	<br />
	<br />
</body>
<script>
const searchbar = document.getElementById("searchbar");
searchbar.addEventListener("focus", function () {
	
	axios.get("SearchServlet")
	  .then(function (response) {
	    console.log(response.data);
	  })
	  .catch(error => {
          console.error('Error while searching:', error);
        });
	
});

try {
	  const searchbar = document.getElementById("searchbar");
	  const cards = document.getElementsByClassName("suggesDiv");

	  searchbar.addEventListener("input", () => {
	    for (const element of cards) {
	      if (
	        element.innerHTML.toLowerCase().includes(searchbar.value.toLowerCase())
	      ) {
	        element.style.display = "block";
	      } else {
	        element.style.display = "none";
	      }
	    }
	  });
	} catch (error) {
	  console.error("Error in searchbar functionality:", error);
	}
</script>
</html>