<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="form.css" />
<title>Sign Up</title>
</head>
<body>

	<div class="conForm">
		<form action="register" method="post" id="form">
			<h2 class="log">Sign Up</h2>
			<br />
			<%
			String errorMessage = request.getParameter("errorMessage");
			if (errorMessage != null) {
			%>

			<div class="alert alert-danger" role="alert">
				<span style="color: red;"><%=errorMessage%></span>

				<!-- this will change based on invalid field entered -->
			</div>
			<%
			}
			%>
			<div class="inputBox">
				<input id="first_name" type="text" autocomplete="off" required
					 name="firstname" value="vijay" autofocus />
					
					 <span>Enter
					Your First Name
				</span>
			
			</div>
			<div class="inputBox">
				<input id="last_name" type="text" value="kumar" autocomplete="off" required
					 name="lastname" /> <span>Enter
					Your Last Name</span>
			</div>
			<div class="inputBox">
				<input id="first_email" value="vijay@gmail.com" type="email" autocomplete="off" required
					 name="email" /> <span>Email</span>
			</div>
			<div class="inputBox">
				<input id="phone_no" value="7548824945" type="tel" autocomplete="off"
					 required name="phoneNo" /> <span>Phone
					Number</span>
			</div>
			<div class="inputBox">
				<input id="first_password" type="password" value="Vijay@3108"
					title="Password must contain an upper case letter, symbol, and number"
					required  name="password" /> <span>Enter
					Your Password</span>
			</div>
			<button type="submit" class="btn5">Sign Up</button>

		</form>
		<br />
		<br />
		<h2 class="with1">
			Already registered User? <a class="log-user" href="login.jsp">Log
				In</a>
		</h2>
		<a href="ListAllMovieServlet">
        <button class="btn6">Back</button>
      </a> 	
		</div>
</body>
</html>
