<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Display All accounts</title>
</head>

<body>

	<h1>Display All accounts</h1>

	<table class="table table-bordered">
		<thead>
			<tr>
				<th>S No</th>
				<th>Account Number</th>
				<th>Account Holder name</th>
				<th>Balance</th>
				<th>Opening Date</th>
			</tr>
		</thead>
		<tbody id="acc-table">
			
		</tbody>
	</table>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script>
		function getAllAccounts() {
			const url = "http://localhost:8080/cinephile_web/GetAllAccountJSONServlet";
			axios.get(url)
			  .then(function (response) {
			    // handle success
			    console.log(response.data);
			    const accArr = response.data;
			    displayAccounts(accArr);
			  })
			  .catch(function (error) {
			    // handle error
			    console.log(error);
			  })
		}
		
		function displayAccounts(accArr) {
			let content = "";
			let i = 0;
			for(let acc of accArr) {
				content = content + "<tr>" + 
				"<td>"+(++i)+"</td>"+
				"<td>"+acc.accNo+"</td>" +
				"<td>"+acc.accHolderName+"</td>" +
				"<td>"+acc.balance+"</td>" +
				"<td>"+acc.openingDate+"</td>" +
			"</tr>";
			}
			
			console.log(content);
			document.querySelector("#acc-table").innerHTML = content;
		}
		
		getAllAccounts();
	</script>
</body>
</html>