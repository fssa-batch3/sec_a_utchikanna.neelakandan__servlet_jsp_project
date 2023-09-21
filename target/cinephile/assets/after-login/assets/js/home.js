// top button

// Get the button
let mybutton = document.getElementById("topBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {
  scrollFunction();
};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}

try {
  const card = [];

  const createElement = (tag, attributes = {}, textContent = "") => {
    const element = document.createElement(tag);
    for (const key in attributes) {
      element.setAttribute(key, attributes[key]);
    }
    element.textContent = textContent;
    return element;
  };

  const createCardElement = (movie) => {
    const card_div = createElement("div", { class: "box" });
    const a_tag = createElement("a", {
      href: `../after-login/productDetails.html?id=${movie.id}`,
    });
    card_div.append(a_tag);

    const image = createElement("img", {
      id: "image-1",
      src: movie.image,
      alt: "image",
    });
    a_tag.append(image);

    const rate = createElement("i", { id: "star", class: "fa fa-star" });
    a_tag.append(rate);

    const rating = createElement("h3", { class: "rate" }, movie.rate);
    a_tag.append(rating);

    const title = createElement("h2", { class: "title" }, movie.title);
    rating.append(title);

    const link = createElement("a", { class: "try", href: movie.link });
    a_tag.append(link);

    const btn = createElement(
      "button",
      { class: "btn", href: movie.link },
      "Trailer"
    );
    link.append(btn);

    return card_div;
  };

  const showMore = JSON.parse(localStorage.getItem("new_card")) || [];

  for (let i = 0; i < 10; i++) {
    card.push(showMore[i]);
  }

  const menuContainer = document.querySelector(".menu");

  for (let i = 0; i < card.length; i++) {
    const movie = card[i];
    const card_div = createCardElement(movie);
    menuContainer.append(card_div);
  }
} catch (error) {
  console.error("Error in creating menu cards:", error);
}
