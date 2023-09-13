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
					value="susi" name="firstname" autofocus />
					
					 <span>Enter
					Your First Name
				</span>
			
			</div>
			<div class="inputBox">
				<input id="last_name" type="text" autocomplete="off" required
					value="kumar" name="lastname" /> <span>Enter
					Your Last Name</span>
			</div>
			<div class="inputBox">
				<input id="first_email" type="email" autocomplete="off" required
					value="susi@gmail.com" name="email" /> <span>Email</span>
			</div>
			<div class="inputBox">
				<input id="phone_no" type="tel" autocomplete="off"
					value="7548824945" required name="phoneNo" /> <span>Phone
					Number</span>
			</div>
			<div class="inputBox">
				<input id="first_password" type="password"
					title="Password must contain an upper case letter, symbol, and number"
					required value="Kanna@3108" name="password" /> <span>Enter
					Your Password</span>
			</div>
			<!-- <a class="log2" href="../after-login/index.html"></a> -->
			<button type="submit" class="btn5">Sign Up</button>

		</form>
		<br />
		<br />
		<h2 class="with1">
			Already registered User? <a class="log-user" href="login.jsp">Log
				In</a>
		</h2>
</body>
</html>
