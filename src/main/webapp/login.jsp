
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Log In</title>
<link rel="stylesheet" href="form.css" />


</head>
<body>



	<div class="conForm">
		<form action="login" method="post" id="form">
			<h2 class="log">Log In</h2>
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
				<input id="email" type="email" name="email" autocomplete="off"
					required autofocus /> <span>Enter your Email</span>
			</div>
			<div class="inputBox">
				<input id="password" type="password" value="Kanna@3108" name="password"
					autocomplete="off" required /> <span>Enter your Password</span>
			</div>
			<!-- <a class="log2" href="../after-login/index.html"></a> -->
			<button type="submit" class="btn5">Log in</button>
			
		</form>
	<br /><br />
      <h2 class="with1">
        Don't have an account?<a class="log-user" href="register.jsp"
          >Sign up</a>
      </h2>
	</div>
</body>

</html>
