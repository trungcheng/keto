<?php
    header('Access-Control-Allow-Origin: *');
    header("Content-type: application/json; charset=utf-8");
    header("Access-Control-Allow-Methods: GET");

    include "db.php";
    include "response.php";

    $deviceId = '';
    $localTime = 0;

    if (isset($_GET['DeviceID'])) {
        $deviceId = $_GET['DeviceID'];
    }

    if (isset($_GET['LocalTime'])) {
        $localTime = (int) $_GET['LocalTime'];
    }

    // Step 1: Check local time
    checkLocalTime($localTime);

    // Step 2: Check on/off system value
    checkOnOffSystem();

    // Step 3: Check deviceId value
    checkDeviceId($deviceId);

    // Step 4: Get data
    getData($deviceId);

    function checkLocalTime($localTime) {
        if (empty($localTime) || !is_numeric($localTime) || $localTime < 7 || $localTime > 20) {
            return response(false, 'Not working time, From 7 AM to 9 PM only', []);
        }
    }

    function checkOnOffSystem() {
        include "db.php";

        $sql = "SELECT Status FROM on_off_time WHERE ID = 1";
        $result = mysqli_query($conn, $sql);
        $status = mysqli_fetch_row($result);

        if ($status[0] != 'On') {
            return response(false, 'System off, please turn on', []);
        }
    }

    function checkDeviceId($deviceId) {
        include "db.php";

        if (empty($deviceId)) {
            return response(false, 'Device ID not found', []);
        }

        $sql = "SELECT Device_ID FROM csdl_device WHERE Device_ID = '$deviceId' AND Device_Status = 'OK'";
        $result = mysqli_query($conn, $sql);
        $response = mysqli_fetch_row($result);

        if (empty($response)) {
            return response(false, 'Device ID not found', []);
        }
    }

    function getData($deviceId) {
        include "db.php";

        $sql = "SELECT SDT, Content FROM csdl_sdt WHERE Status IS NULL ORDER BY Priority DESC LIMIT 20";
        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) > 0) {
            $rows = [];

            while ($row = mysqli_fetch_assoc($result)) {
                $rows[] = $row;
            }

            updateData($rows, $deviceId);

            return response(true, 'Get data success', $rows);
        }

        return response(false, 'Data not found', []);
    }

    function updateData($rows, $deviceId) {
        include "db.php";

        if (!empty($rows)) {
            $sql = "SELECT Team FROM csdl_device WHERE Device_ID = '$deviceId'";
            $result = mysqli_query($conn, $sql);
            $response = mysqli_fetch_row($result);
            $team = !empty($response) ? $response[0] : '';
            $now = date('Y-m-d H:i:s');

            foreach ($rows as $row) {
                $sdt = $row['SDT'];
                $sql = "UPDATE `csdl_sdt`
                    SET `Status` = 'used', `Used_TimeStamp` = '$now', `Sent_to_by_Device` = '$deviceId', `Team` = '$team'
                    WHERE `SDT` = '$sdt'";

                mysqli_query($conn, $sql);
            }
        }
    }
?>