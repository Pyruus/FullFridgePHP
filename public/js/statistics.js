const likeButton = document.querySelector(".fa-plus")
const dislikeButton = document.querySelector(".fa-minus");
const ratioValue = document.querySelector(".ratio");

colorRatio();

likeButton.addEventListener("click", () => {
    const id = document.querySelector("main").getAttribute("id");
    fetch(`/like/${id}`)
        .then(() => {
            ratioValue.innerHTML = parseInt(ratioValue.innerHTML) + 1;
            colorRatio();
    });
});

dislikeButton.addEventListener("click", () => {
    const id = document.querySelector("main").getAttribute("id");
    fetch(`/dislike/${id}`)
        .then(() => {
            ratioValue.innerHTML = parseInt(ratioValue.innerHTML) - 1;
            colorRatio();
        });
});

function colorRatio(){
    clearClasses();
    if(parseInt(ratioValue.innerHTML) > 0){
        ratioValue.classList.add('high_ratio');
    }
    else if(parseInt(ratioValue.innerHTML) < 0){
        ratioValue.classList.add('low_ratio');
    }
    else{
        ratioValue.classList.add('mid_ratio');
    }
}

function clearClasses(){
    ratioValue.classList.remove('mid_ratio')
    ratioValue.classList.remove('low_ratio')
    ratioValue.classList.remove('high_ratio')
}