<?php
    header('Access-Control-Allow-Origin: *');
    header("Content-type: application/json; charset=utf-8");
    header("Access-Control-Allow-Methods: POST");

    include "db.php";
    include "response.php";

    $data = json_decode(file_get_contents("php://input"), true);

    $deviceId = $data["device_id"];
    $team = $data["team"];
    $sdt = $data["ib_sdt"];
    $content = $data["ib_content"];
    $time = date('Y-m-d H:i:s', strtotime(str_replace('/', '-', $data["ib_timestamp"])));

    $sql = "INSERT INTO csdl_upload_inboxmess(Device_ID, Ib_Sdt, Ib_content, Team, Ib_timestamp) VALUES ('$deviceId', '$sdt', '$content', '$team', '$time')";
    if (mysqli_query($conn, $sql)) {
        return response(true, 'Data inserted success', []);
    }

    return response(false, mysqli_error($conn), []);
?>