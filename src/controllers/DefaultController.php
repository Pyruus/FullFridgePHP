<?php

require_once 'AppController.php';
class DefaultController extends AppController{

    public function index(){
        //TODO
        $this->render('login');
    }

    public function add_recipe(){
        //TODO

        $this->render('add-recipe');
    }
    
    public function register(){
        //TODO

        $this->render('register');
    }

}