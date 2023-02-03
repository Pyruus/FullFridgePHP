const search = document.querySelector('#search-bar');
const recipeContainer = document.querySelector('.recipes-list');

search.addEventListener("keyup", (event) => {
    if(event.key === "Enter") {
        event.preventDefault();

        const data = {search: search.value}

        fetch("/search", {
           method: "POST",
            headers: {
               'Content-Type': 'application/json'
            },
           body: JSON.stringify(data),
        }).then((response) => {
            return response.json();
        }).then((recipes) => {
           recipeContainer.innerHTML = "";
           loadRecipes(recipes);
        });
    }
});

function loadRecipes(recipes){

    recipes.forEach(recipe => {
        console.log(recipe);
        createRecipe(recipe);
    });
}

function createRecipe(recipe) {
    const template = document.querySelector("#recipes-template");

    const clone = template.content.cloneNode(true);

    const image = clone.querySelector("img");
    image.src = `/public/uploads/${recipe.image}`;
    image.id = recipe.id;
    const title = clone.querySelector("h2");
    title.innerHTML = recipe.title;

    recipeContainer.appendChild(clone);
}