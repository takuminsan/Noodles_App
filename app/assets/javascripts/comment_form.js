function inputComment() {
  if (document.getElementById("commentInput").value === "") {
    document.getElementById("commentSubmit").disabled = true;
  }
  else {
    document.getElementById("commentSubmit").disabled = false;
  }
  if (document.getElementById("commentInput").value.length > 200) {
    document.getElementById("commentSubmit").disabled = true;
  }
}
