<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fssa.cinephile.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile Page</title>
    <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="./assets/images/Cinephile.png"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="./assets/css/search.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="./assets/css/user.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="./assets/css/movie.css"
    />
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

    <br /><br />
    <br />
   <%
    User user = new User(); 
	user = (User) request.getAttribute("userDetails");
	
	
		
	
	
	HttpSession session1 = request.getSession();

	String loggedInEmail = (String) session1.getAttribute("loggedInEmail");
	if(user != null){
   %>
    <div class="userSet">
      <div class="user-profile">
        <img id="user_image" src="https://img.myloview.com/posters/user-icon-vector-male-person-profile-avatar-symbol-in-circle-flat-color-glyph-pictogram-illustration-700-140985839.jpg" alt="User Profile Picture" />
      </div>
      <div id="userDetails">
        <h1>First Name :</h1>

        <h1>Last Name :</h1>

        <h1>Email ID :</h1>

        <h1>Mobile Number :</h1>

      </div>
      <div class="setData">
        <h1 id="userFname"><%=user.getFirstName() %></h1>
        <h1 id="userLname"><%=user.getLastName() %></h1>
        <h1 id="userEmail"><%= loggedInEmail%></h1>
        <h1 id="userPhoneOn"><%=user.getPhoneNo() %></h1>
      </div>
    </div>
    <div class="userBtnGrp">
      <a href="UpdateUserDetails?userDetails=<%=loggedInEmail%>">
        <button type="submit" class="btn6">Edit</button>
      </a>
      <a id="delete" href="DeleteUserServlet?id=<%=user.getUserId()%>">
      <button type="delete"  class="btn6">Delete Account</button>
      </a>
    </div>
    <%
	}else{
    %>
    <p>User Details are empty</p>
    <%
	}
    %>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
         
         const deleteUser = document.getElementById("delete");
         
         deleteUser..addEventListener("click", () => {
        	 alert("Are you sure, do you want to delete your account"); 
         });
         
</script>
  <script src="../after-login/assets/js/star.js"></script>
    <script src="../after-login/assets/js/user.js"></script>
    <script src="../after-login/assets/js/search.js"></script>
</html>