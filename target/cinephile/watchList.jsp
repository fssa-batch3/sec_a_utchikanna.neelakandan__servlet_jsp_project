<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

    <title>Watchlist</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="./after-login/assets/css/search.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="./after-login/assets/css/movie.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="../after-login/assets/css/deleteBtn.css"
    />
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br /><br />
    <br />
    <div class="showSugg"></div>
    <br id="back" />
    <h2 class="up">Your Watchlist</h2>
    <div class="favlist">
      <h2 id="noFound">Your Watchlist is empty</h2>
    </div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
 <script src="../after-login/assets/js/star.js"></script>
  <script src="../after-login/assets/js/search.js"></script>
  <script src="../after-login/assets/js/watchlist.js"></script>
</html>