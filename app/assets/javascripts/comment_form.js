function inputComment() {
    if (document.getElementById("commentInput").value === "") {
        document.getElementById("commentSubmit").disabled = true;
    }
    else {
        document.getElementById("commentSubmit").disabled = false;
    }
}
