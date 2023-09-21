// star

const allStars = document.querySelectorAll(".star");
let selectedStarValue = 0; // variable to store the selected star's value

allStars.forEach((star, index) => {
  star.addEventListener("click", () => {
    const currentStarLevel = index + 1;
    selectedStarValue = currentStarLevel; // set the selected star's value to the current level

    allStars.forEach((star, j) => {
      const isStarActive = currentStarLevel >= j + 1;
      star.innerHTML = isStarActive ? "&#9733;" : "&#9734;";
    });
  });
  // Now you can use the selectedStarValue variable wherever you need to access the selected star's value
});
console.log(selectedStarValue); // will log the selected star's value to the console

// check already rating give or not

function ratingFor() {
  try {
    const arr = JSON.parse(localStorage.getItem("ratings")) || [];
    const one_obj = arr.find(
      (e) => e.get_email === get_email && e.get_movie_id === get_movie_id
    );
    const all = [];
    const rating_id = Date.now();
    const rating = selectedStarValue;

    if (one_obj) {
      one_obj.rating = selectedStarValue;
      const ind = arr.indexOf(one_obj);
      arr[ind] = one_obj;
      localStorage.setItem("ratings", JSON.stringify(arr));
      location.reload();
      return;
    }

    const rating_obj = {
      get_email,
      rating_id,
      rating,
      get_movie_id,
    };
    console.log(rating_obj);
    if (localStorage.getItem("ratings")) {
      const all = JSON.parse(localStorage.getItem("ratings"));
    }

    all.push(rating_obj);
    localStorage.setItem("ratings", JSON.stringify(all));
    location.reload();
  } catch (error) {
    console.error("Error in ratingFor:", error);
  }
}

// scroll



// user image showing
const get_email = JSON.parse(localStorage.getItem("details"));
const user_details = JSON.parse(localStorage.getItem("user"));
console.log(user_details);
const get_obj = user_details.find(
  (user_obj) => user_obj["email"] === get_email
);
console.log(get_obj);

document.getElementById("view_image").src = get_obj["image"];
document.getElementById("user_image").src = get_obj["image"];
