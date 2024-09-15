<?php
header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");

session_start();

if (isset($_POST['logout'])) {
    unset($_SESSION['access_token']);
    session_destroy();
    header('Location: https://accounts.google.com/Logout');
    exit();
}
?>
