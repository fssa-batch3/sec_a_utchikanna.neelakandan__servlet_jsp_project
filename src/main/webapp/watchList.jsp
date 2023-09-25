<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.fssa.cinephile.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="./assets/images/Cinephile.png"
    />

    <title>Watchlist</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    
    <style>
    .watchBtn {
  cursor: pointer;
  width: 50px;
  height: 50px;
  border: none;
  position: relative;
  bottom:370px;
  border-radius: 10px;
  -webkit-box-shadow: 1px 1px 5px .2px #00000035;
  box-shadow: 1px 1px 5px .2px #00000035;
  -webkit-transition: .2s linear;
  transition: .2s linear;
  transition-delay: .2s;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  justify-content: space-between;
}

.watchBtn:hover {
  width: 150px;
  transition-delay: .2s;
}

.watchBtn:hover > .paragraph {
  visibility: visible;
  opacity: 1;
  -webkit-transition-delay: .4s;
  transition-delay: .4s;
}

.watchBtn:hover > .icon-wrapper1 .icon1 {
  transform: scale(1.1);
}

.watchBtn:hover > .icon-wrapper1.icon1 path {
  stroke: black;
}

.paragraph {
  color: black;
  visibility: hidden;
  opacity: 0;
  font-size: 18px;
  margin-right: 20px;
  padding-left: 20px;
  -webkit-transition: .2s linear;
  transition: .2s linear;
  font-weight: bold;
  text-transform: uppercase;
}

.icon-wrapper1 {
  width: 50px;
  height: 50px;
  position: absolute;
  top: 0;
  right: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}

.icon1 {
  transform: scale(.9);
  transition: .2s linear;
}

.icon1 path {
  stroke: #000;
  stroke-width: 2px;
  -webkit-transition: .2s linear;
  transition: .2s linear;
  
}

#noFound {
  color: red;
  margin-top: 100px;
  margin-left: 550px;
}
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br /><br />
    <br />
     <div class="showSugg"></div>
    <br id="back" />
    <h2 class="up">Your Watchlist</h2>
    <% 
    String loggedInEmail = (String) session.getAttribute("loggedInEmail");
     List<Movie> userWatchlist = (List<Movie>) request.getAttribute("userWatchlist");

if (userWatchlist != null && !userWatchlist.isEmpty()) {
	%>
	<div class="menu" id="cardhid">
	<% 
	for (Movie movie : userWatchlist) {
		
%>


<div class="box">

<a href="DetailsServlet?id=<%=movie.getMovieId()%>&email=<%=loggedInEmail %>">
<img id="image-1" src="<%=movie.getMovieImgUrl()%>" alt="image">
<h3 class="title"><%=movie.getMovieTitle()%></h3>
<a class="try" href="<%=movie.getMovieTrailer()%>">
  <button class="btn" type = "submit" >Trailer</button>
</a>
</a>
<a href="RemoveWatchlist?id=<%=movie.getWatchlistId() %>">
<button class="watchBtn" >
  <p class="paragraph"> delete </p>
  <span class="icon-wrapper1">
    <svg class="icon1" width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M6 7V18C6 19.1046 6.89543 20 8 20H16C17.1046 20 18 19.1046 18 18V7M6 7H5M6 7H8M18 7H19M18 7H16M10 11V16M14 11V16M8 7V5C8 3.89543 8.89543 3 10 3H14C15.1046 3 16 3.89543 16 5V7M8 7H16" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
    </svg>
  </span>
</button>
</a>
</div>


<%
}
}
else{
%>
    
    <div class="favlist">
      <h2 id="noFound">Your Watchlist is empty</h2>
    </div>
    <%
}
    %>
<jsp:include page="footer.jsp"></jsp:include>
</body>
 <script src="../after-login/assets/js/star.js"></script>
  <script src="../after-login/assets/js/search.js"></script>
  <script src="../after-login/assets/js/watchlist.js"></script>
</html>