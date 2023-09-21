//  show more

function view() {
  try {
    let reMove = document.getElementById("showMore1");
    while (reMove.hasChildNodes()) {
      reMove.firstChild.remove();
    }
    document.querySelector(".menu").style.display = "none";
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

    for (let i = 10; i < showMore.length; i++) {
      card.push(showMore[i]);
    }

    const showMoreContainer = document.querySelector(".showMore");
    const filterContainer = document.querySelector(".filter");

    for (const movie of card) {
      const card_div = createCardElement(movie);
      showMoreContainer.append(card_div);
    }

    const less = createElement(
      "button",
      { class: "view", id: "less1", onclick: "less()" },
      "Show less"
    );
    filterContainer.prepend(less);

    const non = document.getElementById("less");
    non.style.display = "none";

    return card_div;
  } catch (error) {
    console.error("Error in creating show more cards:", error);
  }
}

//  show less

function less() {
  let showHid = document.getElementById("showMore1");
  showHid.style.display = "none";
  let showLess = document.getElementById("less1");
  showLess.style.display = "none";
  let returnBtn = document.getElementById("less");
  returnBtn.style.display = "block";
  location.reload();
}
