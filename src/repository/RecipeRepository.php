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
            $recipe['name'],
            $recipe['description'],
            $recipe['image']
        );
    }

    public function addRecipe(Recipe $recipe): void{
        $date = new DateTime();
        $stmt = $this->database->connect()->prepare('
            INSERT INTO recipes (title, description, created_at, created_by, image)
            VALUES (?, ?, ?, ?, ?)
        ');

        $createdBy = 1;
        $stmt->execute([
            $recipe->getTitle(),
            $recipe->getDescription(),
            $date->format('Y-m-d'),
            $createdBy,
            $recipe->getImage()
        ]);
    }
}