<?php
header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");

session_start();

require_once 'vendor/autoload.php';

$client = new Google_Client();
$client->setClientId('332909810542-b0i5tjfdtr2r762eqm4i6ehn2kg17q5h.apps.googleusercontent.com');
$client->setClientSecret('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');
$client->setRedirectUri('http://localhost:8000/callback.php');
$client->addScope("email");
$client->addScope("profile");


if (!isset($_SESSION['access_token'])) {
   
    $login_url = $client->createAuthUrl();
    
    header('Location: ' . filter_var($login_url, FILTER_SANITIZE_URL));
} else {
    header('Location: http://localhost:5173/quizpage');
}
?>