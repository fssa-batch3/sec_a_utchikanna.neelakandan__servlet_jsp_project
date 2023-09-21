function Kollywood() {
  document.querySelector(".menu").style.display = "none";

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
    const create_card2 = JSON.parse(localStorage.getItem("new_card"));
    const movietype = create_card2.filter((h) => h.movietype == type);
    return movietype;
  }

  try {
    let reMove = document.getElementById("showMore1");
    while (reMove.hasChildNodes()) {
      reMove.firstChild.remove();
    }
    document.querySelector(".menu").style.display = "none";
    const kollywoodMovies = movieType("kollywood");

    for (const movie of kollywoodMovies) {
      // Create the card container
      const card_div2 = createElement("div", { class: "box" });

      // Create the link
      const a_tag2 = createElement("a", {
        href: `../after-login/productDetails.html?id=${movie.id}`,
        id: "recently",
      });
      card_div2.appendChild(a_tag2);

      // Create the image
      const image2 = createElement("img", {
        id: "image-1",
        src: movie.image,
        alt: "image",
      });
      a_tag2.appendChild(image2);

      // Create the star
      const rate2 = createElement("i", { id: "star", class: "fa fa-star" });
      a_tag2.appendChild(rate2);

      // Create the rating
      const rating2 = createElement("h3", { class: "rate" }, movie.rate);
      a_tag2.appendChild(rating2);

      // Create the title
      const title2 = createElement("h2", { class: "title" }, movie.title);
      rating2.appendChild(title2);

      // Create the link for the button
      const link2 = createElement("a", { class: "try", href: movie.link });
      a_tag2.appendChild(link2);

      // Create the button
      const btn2 = createElement("button", { class: "btn" }, "Trailer");
      link2.appendChild(btn2);

      document.querySelector(".showMore").appendChild(card_div2);
    }
  } catch (error) {
    console.error("An error occurred:", error);
  }
}
