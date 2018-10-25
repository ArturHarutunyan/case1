<?php
header('Content-Type: text/html; charset=utf-8');
include './incs/config.php';
include './incs/functions.php';
include './classes/Kernel.class.php';
global $pdo;
define("BASE_ROUTH",__DIR__);
$pdo = db_connect();

Kernel::dispatch();
?>
