<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Form</title>
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

		<div class="card-header">
			<div class="text-header">Add Movie</div>
		</div>
		<%
			String errorMessage = request.getParameter("error");
			if (errorMessage != null) {
			%>

			<div class="alert alert-danger" role="alert">
			<span style="color: red;"><%=errorMessage%></span>
				
				<!-- this will change based on invalid field entered -->
			</div>
			<%
			}
			%>
		<div class="card-body">
			<form action=AddMovieServlet method="post">

				<div class="form-group">
					<label for="username">Title:</label> <input required
						class="form-control" value="Salaar" name="title"
						id="username" type="text">
				</div>
				<div class="form-group">
					<label for="email">Rating:</label> <input required
						class="form-control" value="4" name="rating" id="email"
						type="number">
				</div>
				<div class="form-group">
					<label for="password">Image Url:</label> <input required
						class="form-control" name="imageUrl" value="https://upload.wikimedia.org/wikipedia/en/a/a6/Salaar_Part_1_%E2%80%93_Ceasefire.jpg" id="password" type="text"
					 >
				</div>
				<input type="submit" class="btn" value="submit">
			</form>
		</div>
	</div>
</body>
</html>