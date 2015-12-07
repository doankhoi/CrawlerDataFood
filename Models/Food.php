<?php
    /**
    * 
    */
    class Food
    {
        private $name = null;
        private $slug = null;
        private $description = null;
        private $material = null;
        private $prepare = null;
        private $tutorial = null;
        private $suggestion = null;

        public static function create($array){
            $food = new Food();
            $food->setName($array['name']);
            return $food;
        }

        public function setName($name){
            $this->name = $name;
            return $this;
        }

        public function setSlug($slug){
            $this->slug = $slug;
            return $this;
        }

        public function setDescription($description){
            $this->description = $description;
            return $this;
        }

        public function setMaterial($material){
            $this->material = $material;
            return $this;
        }

        public function setPrepare($prepare){
            $this->prepare = $prepare;
            return $this;
        }

        public function setTutorial($tutorial){
            $this->tutorial = $tutorial;
            return $this;
        }

        public function setSuggestion($suggestion){
            $this->suggestion = $suggestion;
            return $this;
        }


    
    /**
     * Gets the value of name.
     *
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Gets the value of slug.
     *
     * @return mixed
     */
    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * Gets the value of description.
     *
     * @return mixed
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Gets the value of material.
     *
     * @return mixed
     */
    public function getMaterial()
    {
        return $this->material;
    }

    /**
     * Gets the value of prepare.
     *
     * @return mixed
     */
    public function getPrepare()
    {
        return $this->prepare;
    }

    /**
     * Gets the value of tutorial.
     *
     * @return mixed
     */
    public function getTutorial()
    {
        return $this->tutorial;
    }

    /**
     * Gets the value of suggestion.
     *
     * @return mixed
     */
    public function getSuggestion()
    {
        return $this->suggestion;
    }
}
?>