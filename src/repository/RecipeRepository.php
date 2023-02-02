<?php

require_once 'Repository.php';
require_once __DIR__.'/../models/Recipe.php';

class RecipeRepository extends Repository
{

    public function getRecipe(int $id): ?Recipe
    {
        $stmt = $this->database->connect()->prepare('
            SELECT * FROM public.recipes WHERE id = :email
        ');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();

        $recipe = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($recipe == false) {
            return null;
        }

        return new Recipe(
            $recipe['title'],
            $recipe['description'],
            $recipe['image'],
            $recipe['likes'] - $recipe['dislikes'],
            $recipe['id']
        );
    }

    public function addRecipe(Recipe $recipe): void{
        $date = new DateTime();
        $stmt = $this->database->connect()->prepare('
            INSERT INTO recipes (title, description, created_at, created_by, image)
            VALUES (?, ?, ?, ?, ?)
        ');


        $stmt->execute([
            $recipe->getTitle(),
            $recipe->getDescription(),
            $date->format('Y-m-d'),
            $_COOKIE['user_id'],
            $recipe->getImage()
        ]);
    }

    public function getRecipes(): array
    {
        $result = [];

        $stmt = $this->database->connect()->prepare('
            SELECT * FROM recipes
        ');
        $stmt->execute();
        $recipes = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($recipes as $recipe){
            $result[] = new Recipe(
                $recipe['title'],
                $recipe['description'],
                $recipe['image'],
                $recipe['likes'] - $recipe['dislikes'],
                $recipe['id']
            );
        }

        return $result;

    }

    public function getRecipeByTitle(string $searchedTitle){
        $searchedTitle = '%'.strtolower($searchedTitle).'%';

        $stmt = $this->database->connect()->prepare('
            SELECT * FROM recipes WHERE LOWER(title) LIKE :search
        ');

        $stmt->bindParam(':search', $searchedTitle, PDO::PARAM_STR);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getRecipeById(int $id){
        $stmt = $this->database->connect()->prepare('
            SELECT * FROM recipes WHERE id = :id
        ');

        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getRecipeByProduct(array $products){
        $productsImploded = implode(',', $products);
        $query = "
            SELECT recipes.id, recipes.title, recipes.image, recipes.likes, recipes.dislikes FROM recipes JOIN products_recipes ON recipes.id=products_recipes.id_recipe
            WHERE  products_recipes.id_product IN ( {$productsImploded} ) GROUP BY recipes.id
        ";

        $stmt = $this->database->connect()->prepare($query);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}