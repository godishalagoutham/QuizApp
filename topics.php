<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

session_start();

$dsn = "mysql:host=localhost;dbname=test";
$username = "root";
$password = "goutham123";


   
    $pdo = new PDO($dsn, $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

   
        $stmt = $pdo->prepare('SELECT * FROM topics');
        $stmt->execute();

       
        $topics = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode($topics);
    
?>
