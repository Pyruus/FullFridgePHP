<?php

require_once 'AppController.php';
class DefaultController extends AppController{

    public function index(){
        //TODO
        $this->render('login');
    }

    public function home(){
        //TODO
        
        $this->render('home');
    }

    public function add_recipe(){
        //TODO

        $this->render('add-recipe');
    }
    
    public function register(){
        //TODO

        $this->render('register');
    }

    public function find_recipe(){
        //TODO

        $this->render('find-recipe');
    }


}