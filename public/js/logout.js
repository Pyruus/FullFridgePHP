const logoutButton = document.querySelector('.fa-right-from-bracket');

logoutButton.addEventListener("click", () => {
    fetch("/logout", {
        method: "POST"
    });
})