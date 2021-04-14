const coms = document.querySelectorAll(".com");
coms.forEach((com) => {
  let num = +com.innerHTML;
  com.innerHTML = num.toLocaleString("en");
});
