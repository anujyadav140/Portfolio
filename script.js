 // JavaScript to generate random RGB values
 function generateRandomColor() {
  var root = document.documentElement;
  root.style.setProperty("--random-red", Math.floor(Math.random() * 256));
  root.style.setProperty(
    "--random-green",
    Math.floor(Math.random() * 256)
  );
  root.style.setProperty(
    "--random-blue",
    Math.floor(Math.random() * 256)
  );
}

document.addEventListener("DOMContentLoaded", function () {
  var navLinks = document.querySelectorAll("nav a");

  navLinks.forEach(function (link) {
    link.addEventListener("mouseover", generateRandomColor);
  });
});

document.addEventListener("DOMContentLoaded", function () {
  var navbarToggler = document.querySelector(".navbar-toggler");

  navbarToggler.addEventListener("click", function () {
    this.classList.toggle("active-toggler");
  });

  var navLinks = document.querySelectorAll("nav a");

  navLinks.forEach(function (link) {
    link.addEventListener("mouseover", generateRandomColor);
  });
});

