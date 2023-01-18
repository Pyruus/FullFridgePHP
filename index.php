<?php

require 'Routing.php';

$path = trim($_SERVER['REQUEST_URI'], '/');
$path = parse_url($path, PHP_URL_PATH);

Routing::get('index', 'DefaultController');
Routing::get('home', 'DefaultController');
Routing::get('register', 'DefaultController');
Routing::get('add_recipe', 'DefaultController');
Routing::get('find_recipe', 'DefaultController');
Routing::run($path);
