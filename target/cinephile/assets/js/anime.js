function AnimeSeries() {
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
    const create_card1 = JSON.parse(localStorage.getItem("new_card"));
    const movietype = create_card1.filter((h) => h.movietype == type);
    return movietype;
  }

  try {
    let reMove = document.getElementById("showMore1");
    while (reMove.hasChildNodes()) {
      reMove.firstChild.remove();
    }
    document.querySelector(".menu").style.display = "none";
    const AnimeSeries = movieType("anime Series");

    for (let movie of AnimeSeries) {
      // Create the card container
      const card_div1 = createElement("div", { class: "box" });

      // Create the link
      const a_tag1 = createElement("a", {
        href: `../pages/productDetails.html?id=${movie.id}`,
        id: "recently",
      });
      card_div1.appendChild(a_tag1);

      // Create the image
      const image1 = createElement("img", {
        id: "image-1",
        src: movie.image,
        alt: "image",
      });
      a_tag1.appendChild(image1);

      // Create the star
      const rate1 = createElement("i", { id: "star", class: "fa fa-star" });
      a_tag1.appendChild(rate1);

      // Create the rating
      const rating1 = createElement("h3", { class: "rate" }, movie.rate);
      a_tag1.appendChild(rating1);

      // Create the title
      const title1 = createElement("h2", { class: "title" }, movie.title);
      rating1.appendChild(title1);

      // Create the link for the button
      const link1 = createElement("a", { class: "try", href: movie.link });
      a_tag1.appendChild(link1);

      // Create the button
      const btn1 = createElement("button", { class: "btn" }, "Trailer");
      link1.appendChild(btn1);

      document.querySelector(".showMore").appendChild(card_div1);
    }
  } catch (error) {
    console.error("An error occurred:", error);
  }
}
