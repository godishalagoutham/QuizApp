<?php
header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");

session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $data = json_decode(file_get_contents("php://input"), true);
    if (isset($data['logout'])) {
    unset($_SESSION['access_token']);
    session_destroy();
    setcookie("PHPSESSID", "", time() - 3600, "/");
    header("Content-Type: application/json");
    $response = [
        "success" => true,
        "redirect" => "https://accounts.google.com/Logout"
    ];
    echo json_encode($response);
    exit();
}
}
?>
