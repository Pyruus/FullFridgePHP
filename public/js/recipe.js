const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);

const data = {recipeId: urlParams.get('recipeId')};

fetch("/getRecipe", {
    method: "POST",
    headers: {
        'Content-Type': 'application/json'
    },
    body: JSON.stringify(data),
}).then((response) => {
    return response.json();
}).then((recipe) => {
    if(recipe.length == 0){
        loadEmptyRecipe();
    }
    else {
        loadRecipe(recipe);
    }
});

function loadRecipe(recipe) {
    currentRecipe = recipe[0]
    const recipeContainer = document.querySelector('main');

    recipeContainer.id = currentRecipe.id;
    const ratio = recipeContainer.querySelector(".ratio");
    ratio.innerHTML = currentRecipe.likes - currentRecipe.dislikes;
    const image = recipeContainer.querySelector("img");
    image.src = `/public/uploads/${currentRecipe.image}`;
    const title = recipeContainer.querySelector("h1");
    title.innerHTML = currentRecipe.title;
    const description = recipeContainer.querySelector(".description");
    description.innerHTML = currentRecipe.description;
    colorRatio(ratio);
}

function loadEmptyRecipe() {
    const recipeContainer = document.querySelector('main');

    const title = recipeContainer.querySelector("h1");
    title.innerHTML = "Recipe with given id does not exist";
}

function colorRatio(ratioValue){
    clearClasses(ratioValue);
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

function clearClasses(ratioValue){
    ratioValue.classList.remove('mid_ratio')
    ratioValue.classList.remove('low_ratio')
    ratioValue.classList.remove('high_ratio')
}