let card8 = [];
const upcomingContainer = document.querySelector(".upcoming");

function createElement(tag, attributes = {}, textContent) {
  const element = document.createElement(tag);
  for (let key in attributes) {
    element.setAttribute(key, attributes[key]);
  }
  if (textContent) {
    element.textContent = textContent;
  }
  return element;
}

// Retrieve card data from local storage
let create_card8 = JSON.parse(localStorage.getItem("new_card"));

// Filter movies of type "upcoming movie"
const upcomingMovies = create_card8.filter(
  (h) => h.movietype === "upcoming movie"
);

// Push filtered movies to card8 array
for (let movie of upcomingMovies) {
  card8.push(movie);
}

for (let movie of card8) {
  // Create the card container
  const card_div8 = createElement("div", { class: "box" });

  // Create the link
  const a_tag8 = createElement("a", {
    href: `../pages/upcomingDetails.html?id=${movie.id}`,
  });
  card_div8.appendChild(a_tag8);

  // Create the image
  const image8 = createElement("img", {
    id: "image-1",
    src: movie.image,
    alt: "image",
  });
  a_tag8.appendChild(image8);

  // Create the star
  const rate8 = createElement("i", { id: "star", class: "fa fa-star" });
  a_tag8.appendChild(rate8);

  // Create the rating
  const rating8 = createElement("h3", { class: "rate" }, movie.rate);
  a_tag8.appendChild(rating8);

  // Create the title
  const title8 = createElement("h2", { class: "title" }, movie.title);
  rating8.appendChild(title8);

  // Create the link for the button
  const link8 = createElement("a", { class: "try", href: movie.link });
  a_tag8.appendChild(link8);

  // Create the button
  const btn8 = createElement("button", { class: "btn" }, "Trailer");
  link8.appendChild(btn8);

  upcomingContainer.appendChild(card_div8);
}
