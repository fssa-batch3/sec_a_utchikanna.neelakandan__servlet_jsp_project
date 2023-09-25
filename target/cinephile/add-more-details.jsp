<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.fssa.cinephile.services.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.card {
	width: 350px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	margin: 10px;
}

.card-header {
	background-color: #333;
	padding: 16px;
	text-align: center;
}

.card-header .text-header {
	margin: 0;
	font-size: 18px;
	color: rgb(255, 255, 255);
}

.card-body {
	padding: 16px;
}

.form-group {
	margin-bottom: 10px;
}

.form-group label {
	display: block;
	font-size: 14px;
	color: #333;
	font-weight: bold;
	margin-bottom: 1px;
}

.form-group input[type="text"], .form-group input[type="email"],
	.form-group input[type="password"] {
	width: 100%;
	padding: 8px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.btn {
	padding: 12px 24px;
	margin-left: 13px;
	font-size: 16px;
	border: none;
	border-radius: 4px;
	background-color: #333;
	color: #fff;
	text-transform: uppercase;
	transition: background-color 0.2s ease-in-out;
	cursor: pointer
}

.btn:hover {
	background-color: #ccc;
	color: #333;
}
</style>
</head>
<body>
<div class="card">
	<%
	String movieId = (String) request.getAttribute("MovieId");
		 System.out.println(movieId);
				%>
		<div class="card-header">
			<div class="text-header">Add Movie</div>
		</div>
		<%
		
			String errorMessage = request.getParameter("error");
			if (errorMessage != null) {
			%>

			<div class="alert alert-danger" role="alert">
			<span style="color: red;"><%=errorMessage%></span>
			</div>
			<%
			}
			%>
			
			
			
		<div class="card-body">
			<form action=AddDetailsServlet method="post">
     
				<div class="form-group">
			
					<label for="username">Movie Id:</label> <input required
						class="form-control" value="<%=movieId %>" readonly name="movieId"
						id="username" type="text">
				</div>
				<div class="form-group">
					<label for="email">Story:</label> <textarea required
						class="form-control" rows="4" cols="50" name="story" id="email"
						></textarea>
				</div>
				<div class="form-group">
					<label for="password">Release Date:</label> <input required
						class="form-control" name="releaseDate" id="password" type="text"
					 >
				</div>
				<div class="form-group">
					<label for="password">Award Name:</label> <input required
						class="form-control" name="awardName"  id="password" type="text"
					 >
				</div>
				<div class="form-group">
					<label for="password">Award Link:</label> <input required
						class="form-control" name="awardWiki" id="password" type="text"
					 >
				</div>
				<div class="form-group">
					<label for="password">Movie Link:</label> <input required
						class="form-control" name="movieLink" id="password" type="text"
					 >
				</div>
				<div class="form-group">
					<label for="password">Director Name:</label> <input required
						class="form-control"  name="directorName" id="password" type="text"
					 >
				</div>
				<div class="form-group">
					<label for="password">Director Link:</label> <input required
						class="form-control" name="directorWiki" id="password" type="text"
					 >
				</div>
				
				<input type="submit" class="btn" value="submit">
			</form>
		</div>
	</div>
</body>
</html>