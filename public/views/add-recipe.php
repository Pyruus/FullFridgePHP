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
            <main class="recipe-form">
                <h1>Dodaj przepis</h1>
                <form action="addRecipe" method="post" ENCTYPE="multipart/form-data">
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
                </form>
            </main>
            <nav>
                
            </nav>
        </section>
    </div>
</body>