let userDetails = JSON.parse(localStorage.getItem("user"));

let oneWhoLog = JSON.parse(localStorage.getItem("details"));

let getOneUser = userDetails.find(function (get) {
  if (oneWhoLog == get["email"]) {
    return true;
  }
});

console.log(getOneUser);

let setFname = document.getElementById("userFname");
setFname.innerText = getOneUser["fname"];

let setLname = document.getElementById("userLname");
setLname.innerText = getOneUser["lname"];

let setDob = document.getElementById("userDob");
setDob.innerText = getOneUser["dob"];

let setEmail = document.getElementById("userEmail");
setEmail.innerText = getOneUser["email"];

let setUname = document.getElementById("userName");
setUname.innerText = getOneUser["userName"];

let setPhoneOn = document.getElementById("userPhoneOn");
setPhoneOn.innerText = getOneUser["phone_no"];

let setGender = document.getElementById("userGender");
setGender.innerText = getOneUser["gender"];

let setCountry = document.getElementById("userCountry");
setCountry.innerText = getOneUser["country"];

let setState = document.getElementById("userState");
setState.innerText = getOneUser["state"];

let delete_user = document.getElementById("delete");
delete_user.addEventListener("click", function (event) {
  event.preventDefault();
  let index = user_details.indexOf(get_obj);
  let msg = confirm("Are you sure you want to delete this account");
  if (msg !== true) {
    return;
  } else {
    user_details.splice(index, 1);
    console.log(user_details);
    localStorage.setItem("user", JSON.stringify(user_details));
    window.location.href = "../pages/signUp.html";
  }
});
