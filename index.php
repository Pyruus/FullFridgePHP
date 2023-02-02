<?php

require 'Routing.php';

$path = trim($_SERVER['REQUEST_URI'], '/');
$path = parse_url($path, PHP_URL_PATH);

Routing::get('', 'DefaultController');
Routing::get('home', 'RecipeController');
Routing::get('register', 'DefaultController');
Routing::get('add_recipe', 'DefaultController');
Routing::get('find_recipe', 'DefaultController');
Routing::get('recipe', 'RecipeController');

Routing::post('login', 'SecurityController');
Routing::post('addRecipe', 'RecipeController');
Routing::post('register', 'SecurityController');
Routing::post('search', 'RecipeController');
Routing::post('getRecipe', 'RecipeController');
Routing::post('productsRecipe', 'RecipeController');
Routing::post('logout', 'SecurityController');


Routing::run($path);
