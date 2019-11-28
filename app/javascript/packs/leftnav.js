export const leftNavInteractivity = () => {
  const toggleBtn = document.getElementById("leftnav_toggle");
  const dashboardLeft = document.getElementById("dashboard-left");
  const dashboardRight = document.getElementById("dashboard-right");
  const toggleP = document.querySelector("#leftnav_toggle p");
  const toggleIcon = document.querySelector("#leftnav_toggle svg");
  const navList = document.querySelectorAll(".leftnav-links p");
  const logo = document.querySelector(".logo-link .saas247");

  window.addEventListener('load', () => {
    // const navLinks = document.querySelectorAll(".leftnav-links");
    // navLinks.forEach((link) => {
    //   link.classList.remove("active");
    // });
    let url = window.location.href.split("/");
    let url_path = url[url.length - 1];
    let currentNav = document.querySelector(`a[href*='${url_path}'`);
    currentNav.classList.add("active");
  }, false );

  toggleBtn.addEventListener("click", (event) => {
    dashboardLeft.classList.toggle("leftnav-open");
    dashboardLeft.classList.toggle("leftnav-closed");
    dashboardRight.classList.toggle("main-no-nav");
    dashboardRight.classList.toggle("main-nav");
    if (toggleP.style.display !== "none") {
      logo.style.display = "none";
      logo.classList.remove("show-left-nav");
      toggleP.classList.add("hide");
      toggleP.classList.remove("show-left-nav");
      toggleP.style.display = "none";
      toggleIcon.classList.add("svg-blue");
      navList.forEach((text) => {
        text.classList.add("hide");
        text.classList.remove("show-left-nav");
      });
    } else {
      toggleP.style.display = "block";
      toggleP.classList.remove("hide");
      toggleP.classList.add("show-left-nav");
      toggleIcon.classList.remove("svg-blue");
      navList.forEach((text) => {
        text.classList.remove("hide");
        text.classList.add("show-left-nav");
      });
      setTimeout(( ) => {
        logo.style.display = "inline-flex";
      }, 200)
    }
  })
}
