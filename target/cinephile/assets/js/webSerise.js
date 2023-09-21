function WebSeries() {
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
    const create_card5 = JSON.parse(localStorage.getItem("new_card"));
    const movietype = create_card5.filter((h) => h.movietype == type);
    return movietype;
  }

  try {
    let reMove = document.getElementById("showMore1");
    while (reMove.hasChildNodes()) {
      reMove.firstChild.remove();
    }
    document.querySelector(".menu").style.display = "none";
    const WebSeries = movieType("web series");

    for (const movie of WebSeries) {
      // Create the card container
      const card_div5 = createElement("div", { class: "box" });

      // Create the link
      const a_tag5 = createElement("a", {
        href: `../pages/productDetails.html?id=${movie.id}`,
        id: "recently",
      });
      card_div5.appendChild(a_tag5);

      // Create the image
      const image5 = createElement("img", {
        id: "image-1",
        src: movie.image,
        alt: "image",
      });
      a_tag5.appendChild(image5);

      // Create the star
      const rate5 = createElement("i", { id: "star", class: "fa fa-star" });
      a_tag5.appendChild(rate5);

      // Create the rating
      const rating5 = createElement("h3", { class: "rate" }, movie.rate);
      a_tag5.appendChild(rating5);

      // Create the title
      const title5 = createElement("h2", { class: "title" }, movie.title);
      rating5.appendChild(title5);

      // Create the link for the button
      const link5 = createElement("a", { class: "try", href: movie.link });
      a_tag5.appendChild(link5);

      // Create the button
      const btn5 = createElement("button", { class: "btn" }, "Trailer");
      link5.appendChild(btn5);

      document.querySelector(".showMore").appendChild(card_div5);
    }
  } catch (error) {
    console.error("An error occurred:", error);
  }
}
