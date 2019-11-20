export const tableStyleOverride = () => {
  window.addEventListener('load', function () {
    const table = document.querySelector("#table-styled");
    const thInner = document.querySelectorAll(".th-inner");
    // table.classList.remove("table-bordered");
    table.addEventListener("click", () => {
      thInner.forEach((th) => {
        setTimeout(() => {
          if (th.classList.contains("asc") || th.classList.contains("desc")) {
            console.log(th);
            th.style.color = "#109CF1";
          } else {
            th.style.color = "#707683";
          }
        }, 10)
      })
    })
  })
}
