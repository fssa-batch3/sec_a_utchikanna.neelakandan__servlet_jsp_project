<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary"
	data-bs-theme="dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp">CinePhile</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home.jsp">Home</a></li>

				<%
				String loggedInEmail = (String) session.getAttribute("loggedInEmail");
				if (loggedInEmail == null) {
				%>
				
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="register.html">Register</a>
				</li>
				<%
				} else {
				%>
				
				<%
				   if(loggedInEmail.equals("admin@gmail.com")){
					   
					   
				%>
			
				<li class="nav-item"><a class="nav-link" href="movie-form.html">Add Movie</a>
				</li>
				
				
				<%
				   }
				%>
				<li class="nav-item"><a class="nav-link" href="#"><%=loggedInEmail%></a>

				</li>
	
				<li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a>

				</li>
     
				<%
				 System.out.println(loggedInEmail instanceof String);
				}
				%>
			</ul>

		</div>
	</div>
</nav>
</body>
</html>