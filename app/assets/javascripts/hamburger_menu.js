function clickBtn1() {
  const hamburger = document.getElementById("hamburger_menu");

  if(hamburger.style.display == "block") {
    // noneで非表示
    hamburger.style.display = "none";
	} else {
    // blockで表示
    hamburger.style.display = "block";
	}
};
