<?php
    header('Access-Control-Allow-Origin: *');
    header("Content-type: application/json; charset=utf-8");
    header("Access-Control-Allow-Methods: POST");

    include "db.php";
    include "response.php";

    $state = isset($_POST['state']) ? $_POST['state'] : 'On';
    $status = $state == 'false' ? 'Off' : 'On';

    $sql = "UPDATE on_off_time SET Status = '$status' WHERE ID = 1";
    if (mysqli_query($conn, $sql)) {
        return response(true, 'Update success', []);
    }

    return response(false, mysqli_error($conn), []);
?>