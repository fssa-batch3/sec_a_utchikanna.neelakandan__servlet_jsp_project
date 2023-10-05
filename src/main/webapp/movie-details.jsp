<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fssa.cinephile.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>

<link rel="icon" type="image/png" sizes="32x32"
	href="./assets/images/Cinephile.png" />
<title>Cinephile</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<link rel="stylesheet" type="text/css" href="movieDetails.css" />
<meta charset="UTF-8">



</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<br>
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
	} else {
	%>
	<%
	MovieDetails movieDetails = new MovieDetails();
	movieDetails = (MovieDetails) request.getAttribute("movieDetails");
	List<Comments> commentList = (List<Comments>) request.getAttribute("commentList");

	if (movieDetails != null) {
	%>
	<%
	if (loggedInEmail.equals("admin@gmail.com")) {
	%>
	<div class="adminBtn">
		<a
			href="UpdateMovieDetails?detailsId=<%=movieDetails.getMovieDetailsId()%>">
			<button type="submit" class="btn3">Edit</button>
		</a> <a
			href="DeleteMovieDetails?detailsId=<%=movieDetails.getMovieDetailsId()%>">
			<button type="submit" class="btn3">Delete</button>
		</a>
	</div>
	<%
	}
	%>
	<div class="firstContainer">
	<div class="firstBox">
		<div>
			<iframe width="500" height="300" id="trailer"
				title="YouTube video player"
				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen src="<%=movieDetails.getMovie().getMovieTrailer()%>"></iframe>
			<div class="left">
				<h2 id="movie_title"><%=movieDetails.getMovie().getMovieTitle()%></h2>
				<hr />
				<h2>
					<b>Rating:</b> <span id="rateOfTheMovie">${average.average_rating}</span><span>/5</span><span
						id="count">${average.rating_count}</span>
				</h2>
				<hr />
				<h2>About the Movie</h2>
				<p id="contentOfMovie"><%=movieDetails.getStory()%></p>
				<hr />
				<p>
					<b>Released date:</b><span id="releaseDate"><%=movieDetails.getReleaseDate()%></span>
				</p>
				<hr />
				<p>
					<b>Director:</b><a href="<%=movieDetails.getDirectorWiki()%>"
						id="directorLink"><span id="directorName"><%=movieDetails.getDirectorName()%></span></a>
				</p>
				<hr />
			</div>
		</div>

	</div>
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
		<br>
		<p class="rating-font">
			Your Rating<br>
		</p>
	</div>
	</div>
	<div class="secondBox">
		<h2 class="cast">Top cast</h2>
		<div class="top">
		<%
		List<Casts> castsList = (List<Casts>) request.getAttribute("caststList");
		int count =0;
		for(Casts casts : castsList){
			count++;
			if(count <= 4){
		%>
			<div class="img-actor">
				<a class="ang" href="<%=casts.getActorLink() %>" id="actor_wiki1"> <img alt="image" src="<%=casts.getActorImage() %>" class="actor"
					id="actor_img1" /> <span class="actor-name" id="actor_name1"><%=casts.getActorName() %></span>
				</a>
			</div>
			<%
		}else{
			%>
			<div class="sec-list">
				<div class="img-actor">
					<a class="ang" href="<%=casts.getActorLink() %>" id="actor_wiki5"> <img alt="image" src="<%=casts.getActorImage() %>" class="actor"
						id="actor_img5" /> <span class="actor-name" id="actor_name5"><%=casts.getActorName() %></span>
					</a>
				</div>
			</div>
			<%
		}
		}
			%>
		</div>
		<div class="watch">
			<h2 class="cast">Awards</h2>
			<a href="<%=movieDetails.getAwardWiki()%>" class="national"
				id="award_wiki">
				<h4 id="awardName"><%=movieDetails.getAwardName()%></h4>
			</a>
			<div class="btnGroup">
			  
				<button onclick="addFav(<%=movieDetails.getMovie().getMovieId()%>,'<%=loggedInEmail%>')" id="favBtn" class="btn3">Add to
					Watchlist</button>
				<a href="<%=movieDetails.getMovieLink()%>" id="movie_link">
					<button class="btn3">Watch on online</button>
				</a>

			</div>

		</div>
		<form action=comment method="post" id="comment-form">
			<div class="inputContainer">
				<input placeholder="Write your Review" id="comment-input"
					class="input-field" type="text" name="comment" autocomplete="off"> <label
					for="input-field" class="input-label">Write your Review</label> <span
					class="input-highlight"></span>
					<input name="movieId" hidden value="<%=movieDetails.getMovie().getMovieId()%>">
					<input name="email" hidden value="<%=loggedInEmail%>">
				<button class="submit-post" id="showComment">Post</button>
			</div>

		</form>

	</div>

	<h2 class="reviews">User Reviews</h2>
	<div class="comment_con">
	<%
	for (Comments comment : commentList) {
	%>
	<!-- HTML Template for a Comment -->
	<div class="comment_fin" id="comment-<%=comment.getCommentId()%>">
		<div class="comment_div">
			<span class="times"></span> <img class="commenter_img"
				src="https://img.myloview.com/posters/user-icon-vector-male-person-profile-avatar-symbol-in-circle-flat-color-glyph-pictogram-illustration-700-140985839.jpg" alt="image" />
			<h2 class="commenter_name"><%=comment.getUser().getFirstName()%></h2>
				<%
				String email = comment.getUser().getEmail();
				System.out.println(email);
				if (loggedInEmail.equals(email)) {
				%>
				<a id="comment_edit" class="comments_edit"
					href="#" onclick="updateComment(<%=comment.getCommentId()%>)">Edit</a>
				<a id="comment_delete" class="comments_delete"
					href="#" onclick="deleteComment(<%=comment.getCommentId()%>)">Delete</a>
				<%
				}
				%>
		</div>
		<div class="comment_one">
			<span class="comment_input1"><%=comment.getComment()%></span>
		</div>
		   <%
			String newComment = (String) request.getAttribute("toEditComment");
			if (newComment != null) {
			%>
		<div class="comment_input">
		<form action=UpdateCommentServlet method="post">
					<input class="new_input" id="3" type="text" name="comment"
						value="<%=newComment%>">
					<button class="input_btn">Submit</button>
				</form>
		</div>
		<%
		}
			%>
	</div>
	<% 
	}
	%>
	<div class="showEdited"></div>
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

function deleteComment(id) {
    console.log(id);
    const confirmed = confirm('Are you sure you want to delete this comment?');
    if (confirmed) {
      axios.delete("comment?commentId="+ id)
        .then(response => {
          alert('Comment deleted successfully');
          const commentElement = document.getElementById("comment-"+id);
          if (commentElement) {
            commentElement.parentElement.removeChild(commentElement);
          }
        })
        .catch(error => {
          console.error('Error deleting comment:', error);
        });
    }
  }

function updateComment(id) {
    const updatedDescription = prompt('Enter the new comment:');
    if (updatedDescription === null) {
      return; 
    }


    axios.put("comment?commentId="+id+"&description="+updatedDescription)
      .then(response => {
        alert('Comment updated successfully');
        window.location.reload();
        const commentElement = document.getElementById("comment-"+id);
        if (commentElement) {
          const descriptionElement = commentElement.querySelector('.comment-description');
          if (descriptionElement) {
            descriptionElement.innerText = updatedDescription;
            
          }
        }
      })
      .catch(error => {
        console.error('Error updating comment:', error);
      });
  }
  
  function addFav(id,email){
	  axios.post("Watchlist?id="+id+"&email="+email).then(response => {
          alert('Successfully Added');
        	   let favBtn = document.getElementById("favBtn");
        	      favBtn.setAttribute("onclick", "remove()");
        	      favBtn.innerText = "In watchlist";
        	      let heart = document.createElement("i");
        	      heart.setAttribute("class", "fa fa-heart");
        	      heart.style.color = "red";
        	      heart.setAttribute("id", "heart");
        	      document.querySelector(".btn3").prepend(heart);
           
        })
        .catch(error => {
          console.error('Error while adding to Watchlist:', error);
        });
  }
</script>
</html>