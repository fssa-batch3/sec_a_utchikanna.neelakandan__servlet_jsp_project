//  URL params

const movieArray = JSON.parse(localStorage.getItem("new_card"));

let movieDetails = movieArray.find(function (event) {
  let id = event["id"];
  if (get_details == id) {
    return true;
  }
});

// average of the star rating

let ratingArray = JSON.parse(localStorage.getItem("ratings"));

let countRating = 0;

let noOfUser = 0;

for (let rating of ratingArray) {
  if (get_details === rating["get_movie_id"]) {
    noOfUser++;
    countRating += rating["rating"];
  }
}

let sumRating = countRating / noOfUser;

let rate = sumRating.toFixed(1);

console.log(rate);

console.log(movieDetails);

// assign the data with their repective obj

let movieTitle = document.getElementById("movie_title");
let tapTitle = document.getElementById("title");
let trailer = document.getElementById("trailer");
let rateOfTheMovie = document.getElementById("rateOfTheMovie");
let contentOfMovie = document.getElementById("contentOfMovie");
let releaseDate = document.getElementById("releaseDate");
let directorLink = document.getElementById("directorLink");
let directorName = document.getElementById("directorName");
let mDirectorLink = document.getElementById("mDirectorLink");
let mDirectorName = document.getElementById("mDirectorName");
let actor_wiki1 = document.getElementById("actor_wiki1");
let actor_img1 = document.getElementById("actor_img1");
let actor_name1 = document.getElementById("actor_name1");
let actor_wiki2 = document.getElementById("actor_wiki2");
let actor_img2 = document.getElementById("actor_img2");
let actor_name2 = document.getElementById("actor_name2");
let actor_wiki3 = document.getElementById("actor_wiki3");
let actor_img3 = document.getElementById("actor_img3");
let actor_name3 = document.getElementById("actor_name3");
let actor_wiki4 = document.getElementById("actor_wiki4");
let actor_img4 = document.getElementById("actor_img4");
let actor_name4 = document.getElementById("actor_name4");
let actor_wiki5 = document.getElementById("actor_wiki5");
let actor_img5 = document.getElementById("actor_img5");
let actor_name5 = document.getElementById("actor_name5");
let actor_wiki6 = document.getElementById("actor_wiki6");
let actor_img6 = document.getElementById("actor_img6");
let actor_name6 = document.getElementById("actor_name6");
let actor_wiki7 = document.getElementById("actor_wiki7");
let actor_img7 = document.getElementById("actor_img7");
let actor_name7 = document.getElementById("actor_name7");
let award_wiki = document.getElementById("award_wiki");
let award_name = document.getElementById("awardName");
let movie_link = document.getElementById("movie_link");

movieTitle.innerText = movieDetails["title"];
tapTitle.innerText = movieDetails["title"];
trailer.setAttribute("src", movieDetails["link"]);
directorLink.setAttribute("href", movieDetails["directorLink"]);
mDirectorLink.setAttribute("href", movieDetails["mDirectorLink"]);
actor_wiki1.setAttribute("href", movieDetails["actorWiki1"]);
actor_img1.setAttribute("src", movieDetails["actorImg1"]);
actor_wiki2.setAttribute("href", movieDetails["actorWiki2"]);
actor_img2.setAttribute("src", movieDetails["actorImg2"]);
actor_wiki3.setAttribute("href", movieDetails["actorWiki3"]);
actor_img3.setAttribute("src", movieDetails["actorImg3"]);
actor_wiki4.setAttribute("href", movieDetails["actorWiki4"]);
actor_img4.setAttribute("src", movieDetails["actorImg4"]);
actor_wiki5.setAttribute("href", movieDetails["actorWiki5"]);
actor_img5.setAttribute("src", movieDetails["actorImg5"]);
actor_wiki6.setAttribute("href", movieDetails["actorWiki6"]);
actor_img6.setAttribute("src", movieDetails["actorImg6"]);
actor_wiki7.setAttribute("href", movieDetails["actorWiki7"]);
actor_img7.setAttribute("src", movieDetails["actorImg7"]);
award_wiki.setAttribute("href", movieDetails["awardWiki"]);
movie_link.setAttribute("href", movieDetails["movieLink"]);
rateOfTheMovie.innerText = rate;
contentOfMovie.innerText = movieDetails["story"];
releaseDate.innerText = movieDetails["releaseDate"];
directorName.innerText = movieDetails["directorName"];
mDirectorName.innerText = movieDetails["mDirectorName"];
award_name.innerText = movieDetails["awardName"];
actor_name1.innerText = movieDetails["actorName1"];
actor_name2.innerText = movieDetails["actorName2"];
actor_name3.innerText = movieDetails["actorName3"];
actor_name4.innerText = movieDetails["actorName4"];
actor_name5.innerText = movieDetails["actorName5"];
actor_name6.innerText = movieDetails["actorName6"];
actor_name7.innerText = movieDetails["actorName7"];

movieDetails["rate"] = rate;

localStorage.setItem("new_card", JSON.stringify(movieArray));
