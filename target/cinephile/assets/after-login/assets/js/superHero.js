function SuperHero() {
  // Function to create an element with optional attributes and text content
  function createElement(tagName, attributes = {}, textContent = "") {
    const element = document.createElement(tagName);
    for (let attr in attributes) {
      element.setAttribute(attr, attributes[attr]);
    }
    element.textContent = textContent;
    return element;
  }

  function movieType(type) {
    const create_card4 = JSON.parse(localStorage.getItem("new_card"));
    const movietype = create_card4.filter((h) => h.movietype == type);
    return movietype;
  }

  try {
    let reMove = document.getElementById("showMore1");
    while (reMove.hasChildNodes()) {
      reMove.firstChild.remove();
    }
    document.querySelector(".menu").style.display = "none";
    const SuperHeroMovies = movieType("superhero movies");

    for (const movie of SuperHeroMovies) {
      // Create the card container
      const card_div4 = createElement("div", { class: "box" });

      // Create the link
      const a_tag4 = createElement("a", {
        href: `../after-login/productDetails.html?id=${movie.id}`,
        id: "recently",
      });
      card_div4.appendChild(a_tag4);

      // Create the image
      const image4 = createElement("img", {
        id: "image-1",
        src: movie.image,
        alt: "image",
      });
      a_tag4.appendChild(image4);

      // Create the star
      const rate4 = createElement("i", { id: "star", class: "fa fa-star" });
      a_tag4.appendChild(rate4);

      // Create the rating
      const rating4 = createElement("h3", { class: "rate" }, movie.rate);
      a_tag4.appendChild(rating4);

      // Create the title
      const title4 = createElement("h2", { class: "title" }, movie.title);
      rating4.appendChild(title4);

      // Create the link for the button
      const link4 = createElement("a", { class: "try", href: movie.link });
      a_tag4.appendChild(link4);

      // Create the button
      const btn4 = createElement("button", { class: "btn" }, "Trailer");
      link4.appendChild(btn4);

      document.querySelector(".showMore").appendChild(card_div4);
    }
  } catch (error) {
    console.error("An error occurred:", error);
  }
}
