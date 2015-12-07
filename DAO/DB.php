<?php
    include_once("Config.php");
    include_once("../Models/Food.php");
    include_once("../Utils/Utils.php");

    /**
    * DAO acess database
    */
    class DB
    {
        
        private static $instance = null;
        private $host;
        private $username;
        private $password;
        private $database_name;
        private $connection;

        private function __construct($host, $username, $password, $database_name){
            $this->host = $host;
            $this->username = $username;
            $this->password = $password;
            $this->database_name = $database_name;

            $this->connection = mysql_connect($host, $username, $password) or die('Not connect database');

            mysql_select_db($database_name, $this->connection);
        }

        public static function getInstance(){
            if(DB::$instance == null){
                DB::$instance = new DB(Config::HOST, Config::USERNAME, Config::PASSWORD, Config::DATABASE_NAME);
            }
            return DB::$instance;
        }

        public function insert(Food $food){

            $sql = "insert into monan(name, slug, description, material, prepare, tutorial, suggestion) values('".
                    $food->getName() . "' , '".
                    $food->getSlug() . "' , '".
                    $food->getDescription() . "' , '".
                    $food->getMaterial() . "' , '".
                    $food->getPrepare(). "' , '".
                    $food->getTutorial() . "' , '".
                    $food->getSuggestion(). " ')";
            
            echo $sql;
            $rowEffect = mysql_query($sql);
            return (mysql_affected_rows() == -1) ? false : true;
        }

        /**
         * Check name is exist in food table
         * return null if not exist
         * @param  $name name Vietnamese
         * @return  Food 
         */
        public function isAvaiableInFoodTable($name){
            $slug = Utils::normalizeSlug($name);
            $sql = "select * from monan where slug = '". $slug ."' limit 1";
            $query = mysql_query($sql);

            if(mysql_num_rows($query) > 0){
                return Food::create(mysql_fetch_array($query));
            }
        }

        public function close(){
            mysql_close($this->connection);
        }

    }


?>