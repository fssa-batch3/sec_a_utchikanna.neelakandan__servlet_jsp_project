let card8 = [];

function createElement(tag, attributes = {}) {
  const element = document.createElement(tag);
  for (const key in attributes) {
    element.setAttribute(key, attributes[key]);
  }
  return element;
}

function createCardElement(movie) {
  const cardDiv = createElement("div", { class: "box" });
  const link = createElement("a", {
    href: `../after-login/upcomingDetails.html?id=${movie.id}`,
  });
  cardDiv.appendChild(link);

  const image = createElement("img", {
    id: "image-1",
    src: movie.image,
    alt: "image",
  });
  link.appendChild(image);

  const rate = createElement("i", { id: "star", class: "fa fa-star" });
  link.appendChild(rate);

  const rating = createElement("h3", { class: "rate" });
  rating.innerText = movie.rate;
  link.appendChild(rating);

  const title = createElement("h2", { class: "title" });
  title.innerText = movie.title;
  rating.appendChild(title);

  const buttonLink = createElement("a", {
    class: "try",
    href: movie.link,
  });
  link.appendChild(buttonLink);

  const button = createElement("button", { class: "btn", href: movie.link });
  button.innerText = "Trailer";
  buttonLink.appendChild(button);

  return cardDiv;
}

try {
  const create_card8 = JSON.parse(localStorage.getItem("new_card"));
  console.log(create_card8);

  function movieType(type) {
    return create_card8.filter((h) => h.movietype == type);
  }

  card8 = movieType("upcoming movie");

  const upcomingContainer = document.querySelector(".upcoming");
  for (const card of card8) {
    const cardElement = createCardElement(card);
    upcomingContainer.appendChild(cardElement);
  }
} catch (error) {
  console.error(error);
}
