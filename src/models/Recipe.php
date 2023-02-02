<?php

class Recipe
{
    private $id;
    private $title;
    private $description;
    private $image;
    private $ratio;

    public function __construct($title, $description, $image, $ratio, $id)
    {
        $this->title = $title;
        $this->description = $description;
        $this->image = $image;
        $this->ratio = $ratio;
        $this->id = $id;
    }

    public function getTitle(): string
    {
        return $this->title;
    }
    public function getRatio()
    {
        return $this->ratio;
    }

    public function getId()
    {
        return $this->id;
    }

    public function setRatio($ratio): void
    {
        $this->ratio = $ratio;
    }

    public function setTitle(string $title)
    {
        $this->title = $title;
    }

    public function getDescription(): string
    {
        return $this->description;
    }

    public function setDescription(string $description)
    {
        $this->description = $description;
    }

    public function getImage(): string
    {
        return $this->image;
    }

    public function setImage(string $image)
    {
        $this->image = $image;
    }




}