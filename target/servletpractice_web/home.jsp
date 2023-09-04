<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.cinephile.model.Movie"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cinephile home</title>



</head>
<body>


	<!-- Loop through the user list and generate user cards -->
	<%
	List<Movie> movieList = (List<Movie>) request.getAttribute("movieList");
	if (movieList != null && !movieList.isEmpty()) {
		for (Movie movie : movieList) {
	%>


	<div class="card-image">
		<img alt="" src="<%=movie.getMovieImgUrl()%>">
	</div>
	<div class="p-6">
		<h5
			class="mb-2 block font-sans text-xl font-semibold leading-snug tracking-normal text-blue-gray-900 antialiased">
			<%=movie.getMovieRating()%>
		</h5>
		<p
			class="block font-sans text-base font-light leading-relaxed text-inherit antialiased">
			<%=movie.getMovieTitle()%>
		</p>
	</div>
	<div class="p-6 pt-0">
		<button data-ripple-light="true" type="button"
			class="select-none rounded-lg bg-blue-500 py-3 px-6 text-center align-middle font-sans text-xs font-bold uppercase text-white shadow-md shadow-blue-500/20 transition-all hover:shadow-lg hover:shadow-blue-500/40 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none">
			Read More</button>
	</div>

	<%
	}
	} else {
	%>
	<p>No movie available.</p>
	<%
	}
	%>

</body>
</html>