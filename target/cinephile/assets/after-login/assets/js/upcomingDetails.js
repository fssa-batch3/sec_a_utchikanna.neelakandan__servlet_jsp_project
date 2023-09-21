//  URL params

const movieArray = JSON.parse(localStorage.getItem("new_card"));

let movieDetails = movieArray.find(function (event) {
  let id = event["id"];
  if (get_movie_id == id) {
    return true;
  }
});

// count of the rating

let ratingArr = JSON.parse(localStorage.getItem("ratings"));
let ratingCount = 0;
for (const rating of ratingArr) {
  if (rating.get_movie_id === get_movie_id) {
    ratingCount++;
  }
}

console.log(ratingCount);
let showCount = document.getElementById("count");
showCount.innerText = ratingCount;

let oneUser = JSON.parse(localStorage.getItem("details"));

// recent view
try {
  let recent = [];
  if (JSON.parse(localStorage.getItem("recent")) != null) {
    recent = JSON.parse(localStorage.getItem("recent"));
  }

  function userArray(email) {
    const arr = recent.filter((h) => h.oneUser == email);
    return arr;
  }
  let userCheck = false;

  let user = recent.find((e) => {
    if (oneUser == e["oneUser"]) {
      userCheck = true;
      return true;
    }
  });

  if (userCheck == true) {
    let userArr = userArray(oneUser);
    let check = false;
    let userRecent = userArr.find((e) => {
      if (e["id"] == get_movie_id) {
        check = true;
        return true;
      }
    });
    if (check == false) {
      let id = get_movie_id;
      let date = new Date();
      let obj = { id, oneUser, date };
      recent.push(obj);
      localStorage.setItem("recent", JSON.stringify(recent));
    }
  } else {
    let id = get_movie_id;
    let date = new Date();
    let obj = { id, oneUser, date };
    recent.push(obj);
    localStorage.setItem("recent", JSON.stringify(recent));
  }
} catch (error) {
  console.error("Error in recent functionality:", error);
}

// added to watchlist
try {
  let favList = JSON.parse(localStorage.getItem("favMovie"));

  for (const favItem of favList) {
    if (
      oneUser === favItem.get_email &&
      get_movie_id === favItem.get_movie_id
    ) {
      let favBtn = document.getElementById("Favbtn");
      favBtn.setAttribute("onclick", "remove()");
      favBtn.innerText = "In watchlist";
      let heart = document.createElement("i");
      heart.setAttribute("class", "fa fa-heart");
      heart.style.color = "red";
      heart.setAttribute("id", "heart");
      document.querySelector(".btn3").prepend(heart);
    } else {
      function addFav() {
        let addFav = [];
        let favBtn = document.getElementById("Favbtn");
        favBtn.setAttribute("onclick", "remove()");
        favBtn.innerText = "In watchlist";
        let heart = document.createElement("i");
        heart.setAttribute("class", "fa fa-heart");
        heart.style.color = "red";
        heart.setAttribute("id", "heart");
        document.querySelector(".btn3").prepend(heart);
        let favId = Date.now();
        let add = {
          get_movie_id,
          get_email,
          favId,
        };

        if (localStorage.getItem("favMovie") != null) {
          addFav = JSON.parse(localStorage.getItem("favMovie"));
          console.log(addFav);
        }

        addFav.push(add);

        localStorage.setItem("favMovie", JSON.stringify(addFav));
      }
    }
  }
} catch (error) {
  console.error("Error in favorite functionality:", error);
}

function remove() {
  for (const favItem of favList) {
    if (
      oneUser === favItem.get_email &&
      get_movie_id === favItem.get_movie_id
    ) {
      const index = favList.indexOf(favItem);
      favList.splice(index, 1);
      console.log(favItem);
      localStorage.setItem("favMovie", JSON.stringify(favList));
      location.reload();
      return;
    }
  }
}

// average of the star rating and show the prevouise rating

let ratingArray = JSON.parse(localStorage.getItem("ratings"));

let countRating = 0;

let noOfUser = 0;

for (const rating of ratingArray) {
  if (get_movie_id === rating.get_movie_id) {
    noOfUser++;
    countRating += rating.rating;
  }
  if (get_movie_id === rating.get_movie_id && oneUser === rating.get_email) {
    let showRating = rating.rating;
    let ratingText = showRating.toString();

    let info = document.getElementById("showRating");
    info.innerText = ratingText + "/5";

    let yourRating = document.createElement("h2");
    yourRating.setAttribute("class", "rating");
    yourRating.innerText = "Your Expectation";

    document.querySelector(".star_rating").prepend(yourRating);

    let btnRating = document.createElement("button");
    btnRating.setAttribute("class", "star1");
    btnRating.innerHTML = "&#9733;";

    document.querySelector(".userRating").prepend(btnRating);
  }
}

let sumRating = countRating / noOfUser;

let rate = sumRating.toFixed(1);

console.log(rate);

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
rateOfTheMovie.innerText = rate;
contentOfMovie.innerText = movieDetails["story"];
releaseDate.innerText = movieDetails["releaseDate"];
directorName.innerText = movieDetails["directorName"];
mDirectorName.innerText = movieDetails["mDirectorName"];
actor_name1.innerText = movieDetails["actorName1"];
actor_name2.innerText = movieDetails["actorName2"];
actor_name3.innerText = movieDetails["actorName3"];
actor_name4.innerText = movieDetails["actorName4"];
actor_name5.innerText = movieDetails["actorName5"];
actor_name6.innerText = movieDetails["actorName6"];
actor_name7.innerText = movieDetails["actorName7"];

movieDetails["rate"] = rate;

localStorage.setItem("new_card", JSON.stringify(movieArray));
