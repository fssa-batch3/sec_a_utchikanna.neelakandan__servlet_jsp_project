//  add watchlist

const favMovie = JSON.parse(localStorage.getItem("favMovie"));

const allMovie = JSON.parse(localStorage.getItem("new_card"));

let iden = [];

let fav = [];

for (let j = 0; j < favMovie.length; j++) {
  if (get_email == favMovie[j]["get_email"]) {
    let findMovie = allMovie.find(function (one) {
      let movie = one["id"];
      if (movie == favMovie[j]["get_movie_id"]) {
        return true;
      }
    });
    fav.push(findMovie);
    let empty = document.getElementById("noFound");
    empty.style.display = "none";
  }
}

console.log(fav);

function createElement(tagName, attributes = {}, textContent = "") {
  const element = document.createElement(tagName);
  for (let attr in attributes) {
    element.setAttribute(attr, attributes[attr]);
  }
  element.textContent = textContent;
  return element;
}

try {
  const favList = document.querySelector(".favlist");
  const deleteDiv = document.querySelector(".favlist");

  for (const movie of fav) {
    const cardDiv = createElement("div", { class: "box" });
    const aTag = createElement("a", {
      href: `../after-login/productDetails.html?id=${movie.id}`,
    });
    cardDiv.appendChild(aTag);

    const image = createElement("img", {
      id: "image-1",
      src: movie.image,
      alt: movie.alt,
    });
    aTag.appendChild(image);

    const rate = createElement("i", { id: "star", class: "fa fa-star" });
    aTag.appendChild(rate);

    const rating = createElement("h3", { class: "rate" }, movie.rate);
    aTag.appendChild(rating);

    const title = createElement("h2", { class: "title" }, movie.title);
    rating.appendChild(title);

    const link = createElement("a", { class: "try", href: movie.link });
    aTag.appendChild(link);

    const btn = createElement("button", { class: "btn" }, "Trailer");
    link.appendChild(btn);

    const deleteBtn = createElement("button", {
      class: "deleteBtn",
      onclick: `deleteList(${movie.id})`,
    });

    const deletePara = createElement("p", { class: "paragraph" }, "delete");
    deleteBtn.appendChild(deletePara);

    const deleteSpan = createElement("span", { class: "delete-wrapper" });
    deleteBtn.appendChild(deleteSpan);

    const deleteSvg = createElement("img", {
      src: "../after-login/assets/images/delete.svg",
      class: "deleteIcon",
      width: "30px",
      height: "30px",
    });
    deleteSpan.appendChild(deleteSvg);

    const deletePath = createElement("path", {
      d: "M6 7V18C6 19.1046 6.89543 20 8 20H16C17.1046 20 18 19.1046 18 18V7M6 7H5M6 7H8M18 7H19M18 7H16M10 11V16M14 11V16M8 7V5C8 3.89543 8.89543 3 10 3H14C15.1046 3 16 3.89543 16 5V7M8 7H16",
      stroke: "#000000",
      "stroke-width": "2",
      "stroke-linecap": "round",
      "stroke-linejoin": "round",
    });
    deleteSvg.appendChild(deletePath);

    favList.appendChild(cardDiv);
    deleteDiv.appendChild(deleteBtn);
  }

  localStorage.setItem("oneWhoLogList", JSON.stringify(fav));
} catch (error) {
  console.error(error);
}

// delete list

function deleteList(id) {
  try {
    console.log(id);
    const getEmail = JSON.parse(localStorage.getItem("details"));
    let arr = JSON.parse(localStorage.getItem("favMovie"));
    console.log(arr);

    for (let i = 0; i < arr.length; i++) {
      if (getEmail == arr[i]["get_email"] && id == arr[i]["get_movie_id"]) {
        let ind = arr.indexOf(arr[i]);
        arr.splice(ind, 1);
        localStorage.setItem("favMovie", JSON.stringify(arr));
        console.log(arr);
        location.reload();
      }
    }
  } catch (error) {
    console.error(error);
  }
}
