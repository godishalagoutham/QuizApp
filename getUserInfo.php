<?php
header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

session_start();

if (isset($_SESSION['user_email']) && isset($_SESSION['user_name'])) {
    $response = [
        'username' => $_SESSION['user_name'],
        'email' => $_SESSION['user_email']
    ];
    echo json_encode($response);
} else {
    http_response_code(401); 
    echo json_encode(['error' => 'User not logged in or session expired']);
}