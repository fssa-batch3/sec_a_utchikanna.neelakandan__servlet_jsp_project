// its for forget password

function conf() {
  let gmail = document.getElementById("email1").value;
  let Password = document.getElementById("password").value;

  let user_details = JSON.parse(localStorage.getItem("user"));
  console.log(user_details);
  let get_obj = user_details.find(function (user_obj) {
    if (gmail === user_obj["email"]) {
      return true;
    }
  });

  console.log(get_obj);

  get_obj["password"] = Password;
  get_obj["rePassword"] = Password;

  localStorage.setItem("user", JSON.stringify(user_details));

  alert("Successfully change your password");
  location.href = "./logIn.html";
}
