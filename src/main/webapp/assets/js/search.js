//search option

let Movies = JSON.parse(localStorage.getItem("new_card"));

console.log(Movies);
function holdMovie() {
  for (let movie of Movies) {
    let suggesDiv = document.createElement("div");
    suggesDiv.setAttribute("class", "suggesDiv");

    let suggesAng = document.createElement("a");
    suggesAng.setAttribute("class", "suggesAng");
    suggesAng.setAttribute(
      "href",
      "../pages/productDetails.html?id=" + movie["id"]
    );
    suggesDiv.append(suggesAng);

    let suggesImg = document.createElement("img");
    suggesImg.setAttribute("class", "suggesImg");
    suggesImg.setAttribute("src", movie["image"]);
    suggesAng.append(suggesImg);

    let suggesTitle = document.createElement("h2");
    suggesTitle.setAttribute("class", "suggesTitle");
    suggesTitle.innerText = movie["title"];

    suggesAng.append(suggesTitle);

    document.querySelector(".showSugg").append(suggesDiv);
  }
}
const searchbar = document.getElementById("searchbar");
searchbar.addEventListener("focus", function () {
  holdMovie();
  let activeCard = document.querySelector(".showSugg");
  activeCard.style.display = "block";
});
let backGround = document.querySelector(".backGround");
backGround.addEventListener("click", function () {
  let activeCard = document.querySelector(".showSugg");
  activeCard.style.display = "none";
  backGround.remove();
});

try {
  const searchbar = document.getElementById("searchbar");
  const cards = document.getElementsByClassName("suggesDiv");

  searchbar.addEventListener("input", () => {
    for (let element of cards) {
      if (
        element.innerHTML.toLowerCase().includes(searchbar.value.toLowerCase())
      ) {
        element.style.display = "block";
      } else {
        element.style.display = "none";
      }
    }
  });
} catch (error) {
  console.error("Error in searchbar functionality:", error);
}
