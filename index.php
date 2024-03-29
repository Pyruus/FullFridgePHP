<?php

require 'Routing.php';

$path = trim($_SERVER['REQUEST_URI'], '/');
$path = parse_url($path, PHP_URL_PATH);

Routing::get('', 'DefaultController');
Routing::get('home', 'RecipeController');
Routing::get('register', 'SecurityController');
Routing::get('add_recipe', 'RecipeController');
Routing::get('find_recipe', 'ProductController');
Routing::get('recipe', 'RecipeController');
Routing::get('like', 'RecipeController');
Routing::get('dislike', 'RecipeController');


Routing::post('login', 'SecurityController');
Routing::post('addRecipe', 'RecipeController');
Routing::post('register', 'SecurityController');
Routing::post('search', 'RecipeController');
Routing::post('getRecipe', 'RecipeController');
Routing::post('productsRecipe', 'RecipeController');
Routing::post('logout', 'SecurityController');
Routing::post('findRecipes', 'RecipeController');


Routing::run($path);
