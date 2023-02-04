<!DOCTYPE html>
<head>
    <link rel="stylesheet" type="text/css" href="public/css/style.css">
    <link rel="stylesheet" type="text/css" href="public/css/recipes.css">
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
            <main class="recipe-form">
                <h1>Dodaj przepis</h1>
                <form action="addRecipe" method="post" ENCTYPE="multipart/form-data" id="addRecipe">
                    <?php if(isset($messages)){
                        foreach ($messages as $message){
                            echo $message;
                        }
                    }
                    ?>
                    <input name="name" type="text" placeholder="Name">
                    <textarea name="description" rows="8" placeholder="Put a recipe here"></textarea>

                    <input type="file" name="file">
                    <button type="submit">Add</button>
<!--                </form>-->
            </main>
            <nav>
<!--                <form action="addRecipeProducts" method="POST" class="shopping-list" id="addRecipeProducts">-->
                    <select multiple name="choices[]" id="choices">
                        <?php foreach ($products as $product): ?>
                            <option value="<?= $product->getId() ?>"> <?= $product->getName() ?> </option>
                        <?php endforeach; ?>
                    </select>
                </form>
            </nav>
        </section>
    </div>
</body>