<?php

define("USER", 'root');
define("PASS", '');
define("HOST", 'localhost');
define("DB",'estados_municipios');

    try {
        $db = new PDO("mysql:host=".HOST.";dbname=".DB."", USER, PASS, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
    } catch (PDOException $e) {
        print "Error!: " . $e->getMessage() . "<br/>";
        die();
    }