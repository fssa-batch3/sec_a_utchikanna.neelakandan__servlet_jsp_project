<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"%>
    <%@ page import="com.fssa.cinephile.model.*"%>
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
    <title>User Profile</title>
  <link rel="stylesheet" href="form.css" />
</head>
<body>

<br><br>
<br>
<div class="conForm">
		<form action="UpdateUserDetails" method="post" id="form">
		<%
			String errorMessage = request.getParameter("errorMessage");
			if (errorMessage != null) {
			%>

			<h2 class="log">Edit Profile</h2>
			<br />
			

			<div class="alert alert-danger" role="alert">
				<span style="color: red;"><%=errorMessage%></span>

				<!-- this will change based on invalid field entered -->
			</div>
			
	<%
			}
	%>
		<%
	User user = new User(); 
	user = (User) request.getAttribute("UserDetails");

	if(user != null){
	%>
			<div class="inputBox">
	
				<input id="first_name" type="text" autocomplete="off" required
					 name="firstname" value = "<%=user.getFirstName() %>" />
					
					 <span>Enter
					Your First Name
				</span> 
			
			</div>
			<div class="inputBox">
				<input id="last_name" type="text" autocomplete="off" required
					 name="lastname" value = "<%=user.getLastName() %>" /> <span>Enter
					Your Last Name</span>
			</div>
			<div class="inputBox">
				<input id="first_email" type="email" autocomplete="off" required
					 name="email" readonly value = "<%= user.getEmail()%>" /> 
			</div>
			<div class="inputBox">
				<input id="phone_no" type="tel" autocomplete="off"
					 required name="phoneNo" value = "<%=user.getPhoneNo() %>"/> <span>Phone
					Number</span>
			</div>

			
			<button type="submit" class="btn5">Submit</button>

    <%
	}  else{
    %>
    
    <p>User Details are empty</p>
    
    <%
	}
    %>

		</form>
</body>
</html>