<?php
    header('Access-Control-Allow-Origin: *');
    header("Content-type: application/json; charset=utf-8");
    header("Access-Control-Allow-Methods: POST");

    include "db.php";
    include "response.php";

    $data = json_decode(file_get_contents("php://input"), true);

    if (empty($data)) {
        return response(false, 'No data provided', []);
    }

    $dataRequired = ['device_id', 'alert_mess', 'alert_time', 'team'];
    foreach ($dataRequired as $key) {
        if (!in_array($key, array_keys($data))) {
            return response(false, $key . ' field is required', []);
        }
    }

    $deviceId = $data["device_id"];
    $team = $data["team"];
    $alertMess = $data["alert_mess"];
    $alertTime = date('Y-m-d H:i:s', strtotime(str_replace('/', '-', $data["alert_time"])));

    $sql = "INSERT INTO alert(Device_ID, AlertMess, AlertTime, Team) VALUES ('$deviceId', '$alertMess', '$alertTime', '$team')";
    if (mysqli_query($conn, $sql)) {
        return response(true, 'Data inserted success', []);
    }

    return response(false, mysqli_error($conn), []);
?>