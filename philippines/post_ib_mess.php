<?php

header("Access-Control-Allow-Methods: POST");

require_once "db.php";

$data = json_decode(file_get_contents("php://input"), true);

$name = $data["name"];
$email = $data["email"];

$sql = "INSERT INTO learnhunter(name,email,created_at) VALUES ('$name' , '$email', NOW())";

if (mysqli_query($conn, $sql)) {
    echo '{"result": "data inserted"}';
} else {
    echo '{"result": "data not inserted"}';
}

?>