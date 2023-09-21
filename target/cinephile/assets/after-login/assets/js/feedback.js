// feedback send

let commenter;
let showComment = document.getElementById("showFeedback");
showComment.addEventListener("click", function (event) {
  event.preventDefault();

  let user_email = JSON.parse(localStorage.getItem("details"));

  let user_details = JSON.parse(localStorage.getItem("user"));
  console.log(user_details);
  let emailId = document.getElementById("email").value;

  let get_obj = user_details.find(function (user_obj) {
    let check_email = user_obj["email"];
    if (user_email === check_email) {
      return true;
    }
  });
  console.log(emailId);
  if (emailId === user_email) {
    let feedback = document.getElementById("feed").value.trim();
    console.log(feedback);
    if (feedback == null || feedback == "") {
      alert("Feedback can't be blank");
      return;
    }
    let commenter_name = get_obj["fname"] + " " + get_obj["lname"];
    let comment_img = get_obj["image"];

    let feedback_id = Date.now();

    let commenter = {
      feedback,
      feedback_id,
      user_email,
      commenter_name,
      comment_img,
    };
    let feedbacks = [];

    if (localStorage.getItem("feedbacks") != null) {
      feedbacks = JSON.parse(localStorage.getItem("feedbacks"));
      console.log(feedbacks);
    }

    feedbacks.push(commenter);

    localStorage.setItem("feedbacks", JSON.stringify(feedbacks));

    location.reload();
  } else {
    alert("Your email id is not match");
  }
});

// show feedbacks

let feed = JSON.parse(localStorage.getItem("feedbacks"));

let user_email = JSON.parse(localStorage.getItem("details"));

let count = 0;

for (const item of feed) {
  count++;

  const final = document.createElement("div");
  final.setAttribute("class", "comment_fin");

  const whole = document.createElement("div");
  whole.setAttribute("class", "comment_div");
  final.append(whole);

  const image = document.createElement("img");
  image.setAttribute("class", "commenter_img");
  image.src = item["comment_img"];
  whole.append(image);

  const name = document.createElement("h2");
  name.setAttribute("class", "commenter_name");
  name.innerText = item["commenter_name"];
  whole.append(name);

  const span = document.createElement("span");
  whole.append(span);

  if (user_email == item["user_email"]) {
    const edit = document.createElement("a");
    edit.setAttribute("id", "comment_edit");
    edit.setAttribute("class", "comments_edit");
    edit.setAttribute("onclick", "edit(" + item["feedback_id"] + ")");
    edit.innerText = "Edit";
    whole.append(edit);

    const dele = document.createElement("a");
    dele.setAttribute("id", "comment_delete");
    dele.setAttribute("class", "comments_delete");
    dele.setAttribute("onclick", "dele(" + item["feedback_id"] + ")");
    dele.innerText = "Delete";
    whole.append(dele);
  }

  const comments = document.createElement("div");
  comments.setAttribute("class", "comment_one");

  final.append(comments);

  const div3 = document.createElement("div");
  div3.setAttribute("class", "comment_input");
  div3.setAttribute("id", item["feedback_id"]);
  final.append(div3);

  const input = document.createElement("input");
  input.setAttribute("class", "new_input");
  input.setAttribute("id", count);
  input.setAttribute("type", "text");
  input.value = item["feedback"];
  div3.append(input);

  const btn2 = document.createElement("button");
  btn2.setAttribute(
    "onclick",
    "input(" + count + "," + item["feedback_id"] + ")"
  );
  btn2.setAttribute("class", "input_btn");
  btn2.innerText = "Submit";
  div3.append(btn2);

  const inpu = document.createElement("span");
  inpu.setAttribute("class", "comment_input1");
  inpu.innerText = item["feedback"];
  comments.append(inpu);

  document.querySelector(".comment_con").prepend(final);
}

// edit comment

function edit(x) {
  let get_class = document.getElementsByClassName("comment_input");
  for (const element of get_class) {
    element.style.display = "none";
  }
  let single_input = document.getElementById(x);
  single_input.style.display = "block";
}

// get comment from data base

function input(x, id) {
  let feedback = document.getElementById(x).value;

  console.log(feedback);
  let newObj = { feedback };

  let arr = JSON.parse(localStorage.getItem("feedbacks"));
  let up = arr.find(function (e) {
    if (id === e["feedback_id"]) {
      return true;
    }
  });
  console.log(up);
  let update = Object.assign(up, newObj);
  console.log(update);
  let ind = arr.indexOf(up);
  arr[ind] = update;
  localStorage.setItem("feedbacks", JSON.stringify(arr));
  location.reload();
}

function dele(id) {
  let arr = JSON.parse(localStorage.getItem("feedbacks"));
  let up = arr.find(function (e) {
    if (id === e["feedback_id"]) {
      return true;
    }
  });
  let ind = arr.indexOf(up);
  arr.splice(ind, 1);
  localStorage.setItem("feedbacks", JSON.stringify(arr));
  location.reload();
}
