<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.fssa.cinephile.model.User"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<meta charset="ISO-8859-1">
<title>Cinephile home</title>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<section class="navbar-home-page-container">
		<!-- ... your navigation and sidebar code ... -->

		<section class="search-bar-div-whole-container">
			<!-- ... your search bar container ... -->

			<section class="whole-section-container">
				<div class="section-inside-container-div">
					<div class="section-inside-container">
						<div class="all-user-showing-div-container">
							<div class="all-user-showing-inside-div">
								<!-- Loop through the user list and generate user cards -->
								<%
								List<User> userList = (List<User>) request.getAttribute("userList");
								if (userList != null && !userList.isEmpty()) {
									for (User user : userList) {
								%>
								<div class="card">
       <h2> <%=user.getFirstName()%> </h2>
        <h2> <%=user.getLastName()%> </h2> 
        <h2> <%=user.getEmail()%> </h2>
        <h2> <%=user.getPhoneNo()%> </h2>
  
  <hr>
       
  
</div>
								<%
								}
								} else {
								%>
								<p>No user available.</p>
								<%
								}
								%>
							</div>
						</div>
					</div>

					<!-- ... your details showing div container ... -->

				</div>
			</section>
		</section>
	</section>
</body>
</html>