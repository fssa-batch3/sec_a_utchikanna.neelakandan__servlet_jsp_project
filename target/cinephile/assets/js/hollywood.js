function Hollywood() {
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
    const create_card3 = JSON.parse(localStorage.getItem("new_card"));
    const movietype = create_card3.filter((h) => h.movietype == type);
    return movietype;
  }

  try {
    let reMove = document.getElementById("showMore1");
    while (reMove.hasChildNodes()) {
      reMove.firstChild.remove();
    }
    document.querySelector(".menu").style.display = "none";
    const hollywoodMovies = movieType("hollywood");

    for (let movie of hollywoodMovies) {
      // Create the card container
      const card_div3 = createElement("div", { class: "box" });

      // Create the link
      const a_tag3 = createElement("a", {
        href: `../pages/productDetails.html?id=${movie.id}`,
        id: "recently",
      });
      card_div3.appendChild(a_tag3);

      // Create the image
      const image3 = createElement("img", {
        id: "image-1",
        src: movie.image,
        alt: "image",
      });
      a_tag3.appendChild(image3);

      // Create the star
      const rate3 = createElement("i", { id: "star", class: "fa fa-star" });
      a_tag3.appendChild(rate3);

      // Create the rating
      const rating3 = createElement("h3", { class: "rate" }, movie.rate);
      a_tag3.appendChild(rating3);

      // Create the title
      const title3 = createElement("h2", { class: "title" }, movie.title);
      rating3.appendChild(title3);

      // Create the link for the button
      const link3 = createElement("a", { class: "try", href: movie.link });
      a_tag3.appendChild(link3);

      // Create the button
      const btn3 = createElement("button", { class: "btn" }, "Trailer");
      link3.appendChild(btn3);

      document.querySelector(".showMore").appendChild(card_div3);
    }
  } catch (error) {
    console.error("An error occurred:", error);
  }
}
