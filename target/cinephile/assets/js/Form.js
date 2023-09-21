let form = document.getElementById("form");

form.addEventListener("submit", function (event) {
  event.preventDefault();

  let updates = {};

  let image_url = document.getElementById("image_url").value;
  updates["image"] = image_url;


  let rating = document.getElementById("rating").value;

  updates["rate"] = rating;

  let title = document.getElementById("title").value;
  updates["title"] = title;

  let link = document.getElementById("link").value;
  updates["link"] = link;


  let story = document.getElementById("story").value;
  updates["story"] = story;

  let releaseDate = document.getElementById("releaseDate").value;
  updates["releaseDate"] = releaseDate;

  let directorName = document.getElementById("directorName").value;
  updates["directorName"] = directorName;

  let mDirectorName = document.getElementById("mDirectorName").value;
  updates["mDirectorName"] = mDirectorName;

  let directorLink = document.getElementById("directorLink").value;
  updates["directorLink"] = directorLink;

  let mDirectorLink = document.getElementById("mDirectorLink").value;
  updates["mDirectorLink"] = mDirectorLink;

  let actorWiki1 = document.getElementById("actorWiki1").value;
  updates["actorWiki1"] = actorWiki1;

  let actorImg1 = document.getElementById("actorImg1").value;
  updates["actorImg1"] = actorImg1;

  let actorName1 = document.getElementById("actorName1").value;
  updates["actorName1"] = actorName1;

  let actorWiki2 = document.getElementById("actorWiki2").value;
  updates["actorWiki2"] = actorWiki2;

  let actorImg2 = document.getElementById("actorImg2").value;
  updates["actorImg2"] = actorImg2;

  let actorName2 = document.getElementById("actorName2").value;
  updates["actorName2"] = actorName2;

  let actorWiki3 = document.getElementById("actorWiki3").value;
  updates["actorWiki3"] = actorWiki3;

  let actorImg3 = document.getElementById("actorImg3").value;
  updates["actorImg3"] = actorImg3;

  let actorName3 = document.getElementById("actorName3").value;
  updates["actorName3"] = actorName3;

  let actorWiki4 = document.getElementById("actorWiki4").value;
  updates["actorWiki4"] = actorWiki4;

  let actorImg4 = document.getElementById("actorImg4").value;
  updates["actorImg4"] = actorImg4;

  let actorName4 = document.getElementById("actorName4").value;
  updates["actorName4"] = actorName4;

  let actorWiki5 = document.getElementById("actorWiki5").value;
  updates["actorWiki5"] = actorWiki5;

  let actorImg5 = document.getElementById("actorImg5").value;
  updates["actorImg5"] = actorImg5;

  let actorName5 = document.getElementById("actorName5").value;
  updates["actorName5"] = actorName5;

  let actorWiki6 = document.getElementById("actorWiki6").value;
  updates["actorWiki6"] = actorWiki6;

  let actorImg6 = document.getElementById("actorImg6").value;
  updates["actorImg6"] = actorImg6;

  let actorName6 = document.getElementById("actorName6").value;
  updates["actorName6"] = actorName6;

  let actorWiki7 = document.getElementById("actorWiki7").value;
  updates["actorWiki7"] = actorWiki7;

  let actorImg7 = document.getElementById("actorImg7").value;
  updates["actorImg7"] = actorImg7;

  let actorName7 = document.getElementById("actorName7").value;
  updates["actorName7"] = actorName7;

  let awardName = document.getElementById("awardName").value;
  updates["awardName"] = awardName;

  let awardWiki = document.getElementById("awardWiki").value;
  updates["awardWiki"] = awardWiki;

  let movieLink = document.getElementById("movieLink").value;
  updates["movieLink"] = movieLink;

  let movieCategory = document.getElementById("movietype").value;
  updates["movietype"] = movieCategory;
  console.log(movieCategory);

  

  let id = Date.now();

  updates["id"] = id;

  console.log(updates);

  let all = [];

  if (localStorage.getItem("new_card") != null) {
    all = JSON.parse(localStorage.getItem("new_card"));
    console.log(all);
  }

  all.push(updates);

  localStorage.setItem("new_card", JSON.stringify(all));
  location.href = "../pages/admin_page.html";
});
