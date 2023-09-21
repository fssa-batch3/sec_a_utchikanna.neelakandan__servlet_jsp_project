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
    <title>About</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="./assets/after-login/assets/css/search.css"
    />
    <link
      rel="stylesheet"
      href="<%=request.getContextPath()%>/assets/after-login/assets/css/movie.css"
    />
   
    <link rel="stylesheet" href="./assets/after-login/assets/css/feedback.css" />
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="showSugg"></div>

    <br /><br />
    <br />
    <br />
    <br />
    <br />
    <div class="finish">
      <h2 class="about">
        Welcome to our website! We are passionate about films and believe that
        they are a significant part of our cultural heritage. Our website is
        dedicated to providing our readers with insightful and honest movie
        reviews, as well as valuable information about the film industry. Our
        team of experienced writers consists of film critics, industry
        professionals, and enthusiasts who share a love for the art of cinema.
        We strive to offer our readers a diverse range of reviews that cover
        various genres, from blockbusters to independent films, and everything
        in between. Our reviews are written with the intention of guiding our
        readers to make informed decisions about which films to watch. We
        analyze and evaluate films based on their cinematography, direction,
        screenplay, performances, and overall entertainment value. We also take
        into account the social and cultural significance of films, as we
        believe that cinema is an important reflection of our society and can
        contribute to shaping our collective consciousness. We welcome and value
        the opinions and feedback of our readers. Feel free to share your
        thoughts and comments on our reviews, as we believe that healthy and
        constructive dialogue can lead to a deeper appreciation and
        understanding of cinema. Thank you for visiting our website, and we hope
        that our reviews can enhance your movie-watching experience!
      </h2>
      <img
        class="gif"
        src="./assets/images/artificial-intelligence-deal.gif"
        alt="image"
      />
    </div>
    <div style="width: 50%;padding: 40px;">
      <img
        class="gif1"
        src="./assets/after-login/assets/images/man-giving-online-feedback.gif"
        alt="image"
      />
      <h2 class="log">Send Feedback</h2>
      <form class="form">
        <div class="inputBox">
          <input
            id="email"
            type="email"
            name=""
            required="true"
            autocomplete="off"
          />
          <span>Email</span>
        </div>
        <div class="inputBox">
          <textarea id="feed" required="true"></textarea>
          <span>Type your Feedback...</span>
        </div>
        <button type="button" id="showFeedback" class="btn5">Send</button>
      </form>
    </div>
   
    <jsp:include page="footer.jsp"></jsp:include>
</body>
 <script src="./assete/after-login/assets/js/feedback.js"></script>
    <script src="./assete/after-login/assets/js/star.js"></script>
    <script src="./assete/after-login/assets/js/search.js"></script>
</html>