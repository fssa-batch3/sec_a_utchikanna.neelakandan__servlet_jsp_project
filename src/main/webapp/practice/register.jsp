<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Login</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h1>Registration Page</h1>
	<div id="msg"></div>
	<form method="post" onSubmit="registerUser()">

		<label>Email: </label> <input type="email" id="email" name="email"
			placeholder="Enter email"> <br /> 

		<label>Name: </label> <input type="text" id="name" name="name"
			placeholder="Enter Name"> <br /> <label>Password: </label>

		<input type="password" id="password" name="password" placeholder="Enter password">
		<br />
		<button type="submit">Submit</button>
	</form>
	
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script>
		function registerUser() {
			event.preventDefault(); // Avoids default behavior of calling the servlet method.
			const email=document.querySelector("#email").value;
			const name=document.querySelector("#name").value;
			const password=document.querySelector("#password").value;
			
			const params = "?email="+email+"&name=" + name + "&password=" + password;
			
			const url = "http://localhost:8080/cinephile_web/RegisterAjaxServlet" + params;
			console.log(url);
			axios.post(url, null)
			  .then(function (response) {
			    // handle success
			    console.log(response.data);
			    const serverMsg = response.data;
			    if(serverMsg.trim() === 'success') {
			    	document.querySelector("#msg").innerHTML="SuccessFully Registered";
			    }  
			    else {
			    	document.querySelector("#msg").innerHTML=serverMsg;
			    }
			    
			  
			  })
			  .catch(function (error) {
			    // handle error
			    console.log(error);
			  })
		}
		
		
	</script>
</body>
</html>