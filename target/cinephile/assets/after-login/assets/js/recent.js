let card7 = [];

// card
let card_div7;
let a_tag7;
let image7;
let rate7;
let rating7;
let title7;
let btn7;
let link7;

let recent = JSON.parse(localStorage.getItem("recent"));

const allMovie = JSON.parse(localStorage.getItem("new_card"));

console.log(recent);

let recentlyView = [];

for (let j = 0; j < recent.length; j++) {
  if (get_email == recent[j]["oneUser"]) {
    let findMovie = allMovie.find(function (one) {
      let movie = one["id"];
      if (movie == recent[j]["id"]) {
        return true;
      }
    });
    recentlyView.push(findMovie);
    console.log(recentlyView);
    let empty = document.getElementById("noViewed");
    empty.style.display = "none";
    let hiddenClear = document.getElementById("clearRecent");
    hiddenClear.style.display = "block";
  }
}

let clearAll = [];
let clear = document.getElementById("clearRecent");
clear.addEventListener("click", function (event) {
  event.preventDefault();

  for (const item of recent) {
    if (item["oneUser"] !== get_email) {
      clearAll.push(item);
    }
  }

  localStorage.setItem("recent", JSON.stringify(clearAll));
  location.reload();
});

for (let i = 0; i < recentlyView.length; i++) {
  // box
  console.log(recentlyView);
  card_div7 = document.createElement("div");
  card_div7.setAttribute("class", "box");

  // a tag
  if (recentlyView[i]["movietype"] == "upcoming movie") {
    a_tag7 = document.createElement("a");
    a_tag7.setAttribute(
      "href",
      "../after-login/upcomingDetails.html?id=" + recentlyView[i]["id"]
    );
    card_div7.append(a_tag7);
  } else {
    a_tag7 = document.createElement("a");
    a_tag7.setAttribute(
      "href",
      "../after-login/productDetails.html?id=" + recentlyView[i]["id"]
    );
    card_div7.append(a_tag7);
  }
  // image

  image7 = document.createElement("img");
  image7.setAttribute("id", "image-1");
  image7.setAttribute("src", recentlyView[i]["image"]);
  image7.setAttribute("alt", "image");
  a_tag7.append(image7);

  // star

  rate7 = document.createElement("i");
  rate7.setAttribute("id", "star");
  rate7.setAttribute("class", "fa fa-star");
  a_tag7.append(rate7);

  // rating

  rating7 = document.createElement("h3");
  rating7.setAttribute("class", "rate");
  rating7.innerText = recentlyView[i]["rate"];
  a_tag7.append(rating7);

  // title

  title7 = document.createElement("h2");
  title7.setAttribute("class", "title");
  title7.innerText = recentlyView[i]["title"];
  rating7.append(title7);

  // a tag

  link7 = document.createElement("a");
  link7.setAttribute("class", "try");
  link7.setAttribute("href", recentlyView[i]["link"]);
  a_tag7.append(link7);

  // button

  btn7 = document.createElement("button");
  btn7.setAttribute("href", recentlyView[i]["link"]);
  btn7.setAttribute("class", "btn");
  btn7.innerText = "Trailer";
  link7.append(btn7);

  document.querySelector(".recent").append(card_div7);
}
