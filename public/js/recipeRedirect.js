const wrapper = document.querySelector('.recipes-list');

wrapper.addEventListener('click', (event) => {
    const isClickable = event.target.nodeName === 'IMG';
    if (!isClickable) {
        return;
    }

    location.href = `/recipe?recipeId=${event.target.id}`;
})