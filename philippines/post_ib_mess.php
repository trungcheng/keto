<?php
    date_default_timezone_set('Asia/Ho_Chi_Minh');
    header('Access-Control-Allow-Origin: *');
    header("Content-type: application/json; charset=utf-8");
    header("Access-Control-Allow-Methods: POST");

    include "db.php";
    include "response.php";
    include "xss_clean.php";

    $data = json_decode(file_get_contents("php://input"), true);

    if (empty($data)) {
        return response(false, 'No data provided', []);
    }

    $dataRequired = ['device_id', 'ib_sdt', 'ib_content', 'team', 'ib_timestamp'];
    foreach ($dataRequired as $key) {
        if (!in_array($key, array_keys($data))) {
            return response(false, $key . ' field is required', []);
        }
    }

    if (empty($data['device_id']) || strlen($data['device_id']) != 10) {
        return response(false, 'device_id must be 10 characters', []);
    }

    if (empty($data['ib_timestamp']) || !is_numeric($data['ib_timestamp'])) {
        return response(false, 'ib_timestamp must be timestamp milliseconds format', []);
    }

    $deviceId = xss_clean($data["device_id"]);
    $team = xss_clean($data["team"]);
    $sdt = xss_clean($data["ib_sdt"]);
    $content = xss_clean($data["ib_content"]);
    $time = date('Y-m-d H:i:s', $data["ib_timestamp"] / 1000);

    // Check device_id tồn tại trong bảng csdl_device và status là OK
    $sql = "SELECT Device_ID FROM csdl_device WHERE Device_ID = '$deviceId' AND Device_Status = 'OK'";
    $result = mysqli_query($conn, $sql);
    $response = mysqli_fetch_row($result);

    if (empty($response)) {
        return response(false, 'Device ID not found', []);
    }

    // Insert query
    $sql = "INSERT INTO csdl_upload_inboxmess(Device_ID, Ib_Sdt, Ib_content, Team, Ib_timestamp) VALUES ('$deviceId', '$sdt', '$content', '$team', '$time')";
    if (mysqli_query($conn, $sql)) {
        return response(true, 'Data inserted success', []);
    }

    return response(false, mysqli_error($conn), []);
?>