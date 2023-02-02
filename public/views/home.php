<!DOCTYPE html>
<head>
    <link rel="stylesheet" type="text/css" href="public/css/style.css">
    <link rel="stylesheet" type="text/css" href="public/css/recipes.css">
    <script src="https://kit.fontawesome.com/f8f883ef8f.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="./public/js/search.js" defer></script>
    <script type="text/javascript" src="./public/js/logout.js" defer></script>
    <script type="text/javascript" src="./public/js/recipeRedirect.js" defer></script>
    <script type="text/javascript" src="./public/js/userExistance.js" defer></script>

    <title>Full Fridgee</title>
</head>
<body>
    <div class="base-container">
        <header>
            <div class = 'nav-buttons'>
                <img src="public/img/logo-no-text.svg">
                <div class="home-button">
                    <a href="home" class="button">Home</a>
                </div>
                <div class="find-recipe-button">
                    <a href="find_recipe" class="button">Find a recipe</a>
                </div>
                <div class="add-recipe-button">
                    <a href="add_recipe" class="button">Add a recipe</a>
                </div>
            </div>
            <div class="user-buttons">      
                <div class="user-button">
                    <a href="#" class="button-icons"><i class="fa-regular fa-user"></i></a>
                </div>
                <div class="settings-button">
                    <a href="#" class="button-icons"><i class="fa-solid fa-gear"></i></a>
                </div>
                <div class="logout-button">
                    <a href="login" class="button-icons"><i class="fa-solid fa-right-from-bracket"></i></a>
                </div>
            </div>
        </header>
        <section class="recipes">
            <main class="recipes-list">
                <?php foreach ($recipes as $recipe): ?>
                <div id="project">
                    <img src="public/uploads/<?= $recipe->getImage() ?>" id="<?= $recipe->getId() ?>">
                    <h2><?= $recipe->getTitle() ?></h2>
                    <p class="ratio"><?= $recipe->getRatio() ?></p>

                </div>
                <?php endforeach; ?>
            </main>
            <nav>
                <div class="search-bar">
                    <input placeholder="Search recipe" id ="search-bar">
                </div>
            </nav>
        </section>
    </div>
</body>

<template id="recipes-template">
    <div id="project">
        <img src="">
        <h2></h2>
        <p class="ratio"></p>
    </div>
</template>