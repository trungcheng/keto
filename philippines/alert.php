<?php
    header('Access-Control-Allow-Origin: *');
    header("Content-type: application/json; charset=utf-8");
    header("Access-Control-Allow-Methods: POST");

    include "db.php";
    include "response.php";

    $data = json_decode(file_get_contents("php://input"), true);

    $deviceId = $data["Device_ID"];
    $team = $data["Team"];
    $alertMess = $data["AlertMess"];
    $alertTime = $data["AlertTime"];

    $sql = "INSERT INTO alert(name, email, created_at) VALUES ('".$name."', '".$email."', NOW())";

    if (mysqli_query($conn, $sql)) {
        return response(true, 'Data inserted success', []);
    }

    return response(false, 'An error occurred', []);
?>