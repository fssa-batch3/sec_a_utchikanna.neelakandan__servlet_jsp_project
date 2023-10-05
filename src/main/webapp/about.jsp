<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" type="image/png" sizes="32x32"
	href="./assets/images/Cinephile.png" />
<title>About</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="./assets/after-login/assets/css/search.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/after-login/assets/css/movie.css" />

<link rel="stylesheet"
	href="./assets/after-login/assets/css/feedback.css" />
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="finish">
		<h2 class="about">Welcome to our film-focused website! We're
			passionate about movies and offer insightful, honest reviews. Our
			diverse team includes film critics and industry pros who cover
			various genres, from blockbusters to indies. We evaluate films based
			on various aspects, including cinematography, direction,
			performances, and cultural significance. We value reader feedback and
			believe in fostering constructive dialogue to deepen the appreciation
			of cinema. Thanks for visiting, and we hope our reviews enhance your
			movie-watching experience!</h2>
		<img class="gif"
			src="./assets/images/artificial-intelligence-deal.gif" alt="image" />
	</div>
	<div style="width: 50%; padding: 40px; height: 500px;">
		<img class="gif1" src="./assets/images/man-giving-online-feedback.gif"
			alt="image" />
		<h2 class="log">Send Feedback</h2>
		<form class="form">
			<div class="inputBox">
				<input id="email" type="email" name="" required="true"
					autocomplete="off" /> <span>Email</span>
			</div>
			<div class="inputBox">
				<textarea id="feed" required="true"></textarea>
				<span>Type your Feedback...</span>
			</div>
			<button type="button" id="showFeedback" class="btn5">Send</button>
		</form>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>