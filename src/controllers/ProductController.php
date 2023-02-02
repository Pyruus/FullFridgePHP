<?php

require_once __DIR__.'/../repository/ProductRepository.php';
class ProductController extends DefaultController
{
    protected $productRepostiory;

    public function __construct()
    {
        parent::__construct();
        $this->productRepostiory = new ProductRepository();
    }
    public function find_recipe(){
        $products = $this->productRepostiory->getProducts();

        $this->render('find-recipe',  ['products' => $products]);
    }

}