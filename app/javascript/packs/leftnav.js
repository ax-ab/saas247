export const leftNavInteractivity = () => {
  const toggleBtn = document.getElementById("leftnav_toggle");
  const dashboardLeft = document.getElementById("dashboard-left");
  const dashboardRight = document.getElementById("dashboard-right");
  const toggleP = document.querySelector("#leftnav_toggle p");
  const toggleIcon = document.querySelector("#leftnav_toggle svg");

  toggleBtn.addEventListener("click", (event) => {
    dashboardLeft.classList.toggle("leftnav-open");
    dashboardLeft.classList.toggle("leftnav-closed");
    dashboardRight.classList.toggle("main-no-nav");
    dashboardRight.classList.toggle("main-nav");
    if (toggleP.style.display !== "none") {
      toggleP.classList.add("hide");
      toggleP.classList.remove("show");
      toggleP.style.display = "none";
      toggleIcon.classList.add("svg-blue");
    } else {
      toggleP.style.display = "block";
      toggleP.classList.remove("hide");
      toggleP.classList.add("show");
      toggleIcon.classList.remove("svg-blue");
    }
  })
}
