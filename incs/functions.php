<?php
if (!function_exists('db_connect')) {
	function db_connect(){
		$dsn = "mysql:host=".DB_SERVER_NAME.";dbname=".DB_NAME."";
		$opt = array(
			PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
			PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
		);

		try{
			$pdo = new PDO($dsn, DB_USER_NAME, DB_PASS, $opt);
		}catch(PDOException $e){
			return 0;
		}

		return $pdo;
	}
}

?>
