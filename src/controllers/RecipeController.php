<?php

require_once 'AppController.php';
require_once __DIR__.'/../models/Recipe.php';
require_once __DIR__.'/../repository/RecipeRepository.php';
require_once __DIR__.'/../repository/ProductRepository.php';
class RecipeController extends AppController
{
    const MAX_FILE_SIZE = 1024*1024;
    const SUPPORTED_TYPES = ['image/png', 'image/jpeg'];
    const UPLOAD_DIRECTORY = '/../public/uploads/';

    private $messages = [];
    protected $recipeRepostiory;
    protected $productRepostiory;

    public function __construct()
    {
        parent::__construct();
        $this->recipeRepostiory = new RecipeRepository();
        $this->productRepostiory = new ProductRepository();
    }

    public function home(){
        $recipes = $this->recipeRepostiory->getRecipes();

        $this->render('home', ['recipes' => $recipes]);
    }

    public function recipe(){
        $this->render('recipe');
    }

    public function add_recipe(){
        $products = $this->productRepostiory->getProducts();

        $this->render('add-recipe', ['products' => $products]);
    }

    public function addRecipe(){
        if($this->isPost() && is_uploaded_file($_FILES['file']['tmp_name']) && $this->validate($_FILES['file'])){
            move_uploaded_file(
                $_FILES['file']['tmp_name'],
                dirname(__DIR__).self::UPLOAD_DIRECTORY.$_FILES['file']['name']
            );

            $recipe = new Recipe($_POST['name'], $_POST['description'], $_FILES['file']['name'], 0, 0);

            $this->recipeRepostiory->addRecipe($recipe);
            $this->recipeRepostiory->addRecipeProducts($_POST['choices']);
            return $this->render('home', ['m essages' => $this->messages, 'recipes' => $this->recipeRepostiory->getRecipes()]);
        }

        $this->render('add-recipe', ['messages' => $this->messages]);
    }

    public function search(){
        $contentType = isset($_SERVER["CONTENT_TYPE"]) ? trim($_SERVER["CONTENT_TYPE"]) : '';

        if($contentType === "application/json") {
            $content = trim(file_get_contents("php://input"));
            $decoded = json_decode($content, true);

            header("Content-type: application/json");
            http_response_code(200);

            echo json_encode($this->recipeRepostiory->getRecipeByTitle($decoded['search']));
        }
    }

    private function validate(array $file): bool{
        if($file['size'] > self::MAX_FILE_SIZE){
            $this->messages[] = 'Fle too large';
            return false;
        }

        if(!isset($file['type']) && !in_array($file['type'], self::SUPPORTED_TYPES)){
            $this->messages[] = 'File type not supported';
            return false;
        }

        return true;
    }

    public function getRecipe(){
        $contentType = isset($_SERVER["CONTENT_TYPE"]) ? trim($_SERVER["CONTENT_TYPE"]) : '';

        if($contentType === "application/json") {
            $content = trim(file_get_contents("php://input"));
            $decoded = json_decode($content, true);

            header("Content-type: application/json");
            http_response_code(200);

            echo json_encode($this->recipeRepostiory->getRecipeById($decoded['recipeId']));
        }
    }

    public function productsRecipe(){
        header("Content-type: application/json");
        http_response_code(200);
        echo json_encode($this->recipeRepostiory->getRecipeByProduct([1,2]));
    }

    public function findRecipes(){
        if(!$this->isPost()){
            return $this->render('find-product');
        }
        $recipes = $this->recipeRepostiory->getRecipeByProduct($_POST['choices']);

        return $this->render('home', ['recipes' => $recipes]);
    }
}