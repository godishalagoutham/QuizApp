<?php
session_start();

require_once 'vendor/autoload.php';

$client = new Google_Client();
$client->setClientId('332909810542-b0i5tjfdtr2r762eqm4i6ehn2kg17q5h.apps.googleusercontent.com');
$client->setClientSecret('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');
$client->setRedirectUri('http://localhost:8000/callback.php');

if (isset($_GET['code'])) {
    $token = $client->fetchAccessTokenWithAuthCode($_GET['code']);

    $_SESSION['access_token'] = $token;
    $client->setAccessToken($token);

    // Get user info from Google
    $google_oauth = new Google_Service_Oauth2($client);
    $user_info = $google_oauth->userinfo->get();
    $_SESSION['user_email'] = $user_info->email;
    $_SESSION['user_name'] = $user_info->name;
    header('Location: http://localhost:5173/quizpage');
    exit();
}
?>