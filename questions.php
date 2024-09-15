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

$topic = isset($_GET['topic']) ? $_GET['topic'] : null;

$response = [];

if ($topic) {
   
    $stmt = $pdo->prepare("SELECT id, question FROM questions 
                           WHERE topic_id = (SELECT id FROM topics WHERE name = :topic) 
                           ORDER BY RAND() ");  
    $stmt->bindValue(':topic', $topic);
    $stmt->execute();
    $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    $response['questions'] = [];

    foreach ($questions as $question) {
        $questionId = $question['id'];
        
       
        $stmt = $pdo->prepare("SELECT id as answer_id, answer, is_correct FROM answers 
                               WHERE question_id = :question_id 
                               ORDER BY RAND() 
                               "); 
        $stmt->bindValue(':question_id', $questionId, PDO::PARAM_INT);
        $stmt->execute();
        $answers = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
       
        if (count($answers) < 4) {
           
            $response['error'] = "Not enough answers for question ID $questionId.";
            break;
        }
        
        $response['questions'][] = [
            'question' => $question['question'],
            'id' => $questionId,
            'answers' => $answers
        ];
    }
    
    echo json_encode($response);
} else {
    echo json_encode(['error' => 'No topic specified']);
}
?>
