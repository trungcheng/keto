<?php
    date_default_timezone_set('Asia/Ho_Chi_Minh');
    header('Access-Control-Allow-Origin: *');
    header("Content-type: application/json; charset=utf-8");
    header("Access-Control-Allow-Methods: POST");

    include "db.php";
    include "response.php";

    $state = isset($_POST['state']) ? $_POST['state'] : 'On';
    $status = $state == 'false' ? 'Off' : 'On';
    $now = date('Y-m-d H:i:s');

    $sql = "INSERT INTO on_off_time(`Status`, `timestamp`) VALUES ('$status', '$now')";
    if (mysqli_query($conn, $sql)) {
        return response(true, 'Update success', []);
    }

    return response(false, mysqli_error($conn), []);
?>