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
 <link rel="stylesheet" type="text/css" href="movieDetails.css" />
<meta charset="UTF-8">

   

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
  <br><br>
  <br>
    <%
    String loggedInEmail = (String) session.getAttribute("loggedInEmail");
   
    
    
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
   <% 
   if(loggedInEmail.equals("admin@gmail.com")){
	   %>
   <div class="adminBtn">
   <a href="UpdateMovieDetails?detailsId=<%=movieDetails.getMovieDetailsId() %>">
   <button type="submit" class="btn3">Edit</button>
   </a>
   <a href="DeleteMovieDetails?detailsId=<%=movieDetails.getMovieDetailsId() %>">
   <button type="submit" class="btn3">Delete</button>
   </a>
   </div>
   <%
   }
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
          src="<%=movieDetails.getMovie().getMovieTrailer()%>"
        ></iframe>
        <div class="left">
          <h2 id="movie_title"><%=movieDetails.getMovie().getMovieTitle() %></h2>
          <hr />
          <h2>
            <b>Rating:</b> <span id="rateOfTheMovie"><%=movieDetails.getMovie().getMovieRating() %></span><span>/5</span
            ><span id="count"></span>
          </h2>
          <hr />
          <h2>About the Movie</h2>
          <p id="contentOfMovie"><%=movieDetails.getStory() %></p>
          <hr />
          <p><b>Released date:</b><span id="releaseDate"><%=movieDetails.getReleaseDate() %></span></p>
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
    <div class="secondBox">
     <h2 class="cast">
      Top cast
    </h2>
    <div class="top">
      <div class="img-actor">
        <a class="ang" id="actor_wiki1">
          <img alt="image" class="actor" id="actor_img1" />
          <span class="actor-name" id="actor_name1"></span>
        </a>
      </div>
      <div class="img-actor">
        <a class="ang" id="actor_wiki2">
          <img alt="image" class="actor" id="actor_img2" />
          <span class="actor-name" id="actor_name2"></span>
        </a>
      </div>
      <div class="img-actor">
        <a class="ang" id="actor_wiki3">
          <img alt="image" class="actor" id="actor_img3" />
          <span class="actor-name" id="actor_name3"></span>
        </a>
      </div>
      <div class="img-actor">
        <a class="ang" id="actor_wiki4">
          <img alt="image" class="actor" id="actor_img4" />
          <span class="actor-name" id="actor_name4"></span>
        </a>
      </div>
      <div class="sec-list">
        <div class="img-actor">
          <a class="ang" id="actor_wiki5">
            <img alt="image" class="actor" id="actor_img5" />
            <span class="actor-name" id="actor_name5"></span>
          </a>
        </div>
        <div class="img-actor">
          <a class="ang" id="actor_wiki6">
            <img alt="image" class="actor" id="actor_img6" />
            <span class="actor-name" id="actor_name6"></span>
          </a>
        </div>
        <div class="img-actor">
          <a class="ang" id="actor_wiki7">
            <img alt="image" class="actor" id="actor_img7" />
            <span class="actor-name" id="actor_name7"></span>
          </a>
        </div>
      </div>
    </div>
    <div class="watch">
      <h2 class="cast">
        Awards
      </h2>
      <a href="<%=movieDetails.getAwardWiki() %>" class="national" id="award_wiki">
        <h4 id="awardName"><%=movieDetails.getAwardName() %></h4>
      </a>
    <div class="btnGroup">
      <button onclick="addFav()" id="Favbtn" class="btn3">
        Add to Watchlist
      </button>
      <a href="<%=movieDetails.getMovieLink() %>" id="movie_link">
        <button class="btn3">
          Watch on online
        </button>
      </a>
     
    </div>
  
  </div>
    <form id="comment-form">
    <div class="inputContainer">
      <input placeholder="Type your comment" id="comment-input"  class="input-field" type="text" autocomplete="off" >
      <label for="input-field" class="input-label">Type your comment</label>
      <span class="input-highlight"></span>
      <button class="submit-post" id="showComment" >Post</button>
    </div>
    
     
   
    </div>
    
      
      <div class="comment_con">
             <div class="showEdited"></div>
      </div>
     
      
    </form>
      <!-- rating -->
    
    <div class="book-detail-star-ratings">
						<div class="rating">
							<input type="radio" name="rating" id="rating-5" value="5" /> <label
								for="rating-5"></label> <input type="radio" name="rating"
								id="rating-4" value="4" /> <label for="rating-4"></label> <input
								type="radio" name="rating" id="rating-3" value="3" /> <label
								for="rating-3"></label> <input type="radio" name="rating"
								id="rating-2" value="2" /> <label for="rating-2"></label> <input
								type="radio" name="rating" id="rating-1" value="1" /> <label
								for="rating-1"></label>
						</div>
						<p class="rating-font">
							Average Rating <b class="stars">${average.average_rating}</b>
							of 5 <br /> from <b class="raters">${average.rating_count}
								User</b>
						</p>
					</div>
   <%
	}
   %>
   <%
	}
   %>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
<!-- Include Axios from CDN -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript">
const ratingInputs = document.querySelectorAll('input[type="radio"]');
ratingInputs.forEach((input) => {
  input.addEventListener("click", () => {
    const ratingValue = +input.value;
    if (${rating} === ratingValue) {
      return;
    }
    const ratingObj = {
      user_id: ${userId},
      rating: ratingValue,
      movie_id: ${movieId},
    };

    axios.post('rating', ratingObj)
      .then(response => {
        console.log('Rating sent successfully:', response.data);
      })
      .catch(error => {
        console.error('Error sending rating:', error);
      });
  });
});

function setRatingValue(data) {
    let radioButtons = document.getElementsByName("rating");
    for (const radioButton of radioButtons) {
      if (radioButton.id === "rating-" + data) {
        radioButton.checked = true;
        break;
      }
    }
  }
setRatingValue(${rating});



</script>
</html>