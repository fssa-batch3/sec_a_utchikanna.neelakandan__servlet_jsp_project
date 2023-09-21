let card = [];

// Function to create elements
function createElement(tagName, attributes = {}, text = "") {
  const element = document.createElement(tagName);
  for (let attr in attributes) {
    element.setAttribute(attr, attributes[attr]);
  }
  element.innerText = text;
  return element;
}

let create_card = JSON.parse(localStorage.getItem("new_card"));
console.log(create_card);

for (let item of create_card) {
  card.push(item);
  console.log(card);
}

for (let item of card) {
  // box
  let card_div = createElement("div", { class: "box" });

  // a tag
  let a_tag = createElement("a", {
    href: `../pages/productDetails.html?id=${item.id}`,
  });
  card_div.append(a_tag);

  // image
  let image = createElement("img", {
    id: "image-1",
    src: item.image,
    alt: "image",
  });
  a_tag.append(image);

  // star
  let rate = createElement("i", { id: "star", class: "fa fa-star" });
  a_tag.append(rate);

  // rating
  let rating = createElement("h3", { class: "rate" }, item.rate);
  a_tag.append(rating);

  // title
  let title = createElement("h2", { class: "title" }, item.title);
  rating.append(title);

  // a tag
  let link = createElement("a", { class: "try", href: item.link });
  a_tag.append(link);

  // button
  let btn = createElement("button", { class: "btn" }, "Watch Now");
  btn.setAttribute("href", item.link);
  link.append(btn);

  // button
  let edit_btn = createElement(
    "a",
    {
      class: "btn1",
      id: item.id,
      href: `../pages/editForm.html?id=${item.id}`,
    },
    "Edit"
  );
  card_div.append(edit_btn);

  document.querySelector(".menu").append(card_div);
  console.log(edit_btn);
}
