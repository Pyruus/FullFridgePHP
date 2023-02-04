<!DOCTYPE html>
<head>
    <link rel="stylesheet" type="text/css" href="public/css/style.css">
    <script src="https://kit.fontawesome.com/f8f883ef8f.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="./public/js/logout.js" defer></script>
    <script type="text/javascript" src="./public/js/userExistance.js" defer></script>
    <title>Full Fridgee</title>
</head>
<body>
    <div class="base-container">
        <header>
            <div class = 'nav-buttons'>
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
                <div class="logout-button">
                    <a href="login" class="button-icons"><i class="fa-solid fa-right-from-bracket"></i></a>
                </div>
            </div>
        </header>
        <section class="recipes">
            <main class="find_recipe">
                <h1 class>What's in your fridge?</h1>
            </main>
            <nav>
                <form action="findRecipes" method="POST" class="shopping-list">
                    <select multiple name="choices[]" id="choices">
                        <?php foreach ($products as $product): ?>
                            <option value="<?= $product->getId() ?>"> <?= $product->getName() ?> </option>
                        <?php endforeach; ?>
                    </select>
                    <input type="submit" value="Submit">
                </form>
            </nav>
        </section>
    </div>
</body>