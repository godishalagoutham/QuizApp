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


$data = json_decode(file_get_contents("php://input"), true);


$dsn = "mysql:host=localhost;dbname=test";
$username = "root";
$password = "goutham123";
$pdo = new PDO($dsn, $username, $password);

$correct_count = 0;

if (isset($data['answers'])) {
    foreach ($data['answers'] as $question_id => $answer_id) {
        
        $stmt = $pdo->prepare("SELECT is_correct FROM answers WHERE question_id = :question_id AND id = :answer_id");
        $stmt->bindParam(':question_id', $question_id);
        $stmt->bindParam(':answer_id', $answer_id);
        $stmt->execute();
        
      
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($result && $result['is_correct'] == 1) {
            $correct_count++;
        }
    }
}

$response = ['score' => $correct_count];
echo json_encode($response);
?>
