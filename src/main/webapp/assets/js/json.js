
//search filter
let searchbar = document.getElementById("searchbar");
const cards = document.getElementsByClassName("box");

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
