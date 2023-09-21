//search option

let Movies = JSON.parse(localStorage.getItem("new_card"));

console.log(Movies);
function holdMovie() {
  function createElement(tagName, attributes = {}, textContent = "") {
    const element = document.createElement(tagName);
    for (const [attr, value] of Object.entries(attributes)) {
      element.setAttribute(attr, value);
    }
    element.textContent = textContent;
    return element;
  }

  for (const movie of Movies) {
    const suggesDiv = createElement("div", { class: "suggesDiv" });
    const suggesAng = createElement("a", {
      class: "suggesAng",
      href: `../after-login/productDetails.html?id=${movie["id"]}`,
    });
    suggesDiv.append(suggesAng);

    const suggesImg = createElement("img", {
      class: "suggesImg",
      src: movie["image"],
    });
    suggesAng.append(suggesImg);

    const suggesTitle = createElement(
      "h2",
      { class: "suggesTitle" },
      movie["title"]
    );
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
  console.log("hi");
  let activeCard = document.querySelector(".showSugg");
  activeCard.style.display = "none";
  backGround.remove();
});

try {
  const searchbar = document.getElementById("searchbar");
  const cards = document.getElementsByClassName("suggesDiv");

  searchbar.addEventListener("input", () => {
    for (const element of cards) {
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
