<?php
    header('Access-Control-Allow-Origin: *');
    header("Content-type: application/json; charset=utf-8");
    header("Access-Control-Allow-Methods: GET");

    include "db.php";
    include "response.php";

    $deviceId = '';
    $localTime = 0;

    if (isset($_GET['device_id'])) {
        $deviceId = $_GET['device_id'];
    }

    if (isset($_GET['local_time'])) {
        $localTime = (int)$_GET['local_time'];
    }

    // Step 1: Check local time
    checkLocalTime($localTime);

    // Step 2: Check on/off system value
    checkOnOffSystem();

    // Step 3: Check deviceId value
    checkDeviceId($deviceId);

    // Step 4: Get data
    getData($deviceId);

    function checkLocalTime($localTime)
    {
        if (empty($localTime) || !is_numeric($localTime) || $localTime < 7 || $localTime > 20) {
            return response(false, 'Not working time, From 7 AM to 9 PM only', []);
        }
    }

    function checkOnOffSystem()
    {
        include "db.php";

        $sql = "SELECT Status FROM on_off_time WHERE ID = 1";
        $result = mysqli_query($conn, $sql);
        $status = mysqli_fetch_row($result);

        if ($status[0] != 'On') {
            return response(false, 'System off, please turn on', []);
        }
    }

    function checkDeviceId($deviceId)
    {
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

    function getData($deviceId)
    {
        include "db.php";

        $sql = "SELECT SDT, Content FROM csdl_sdt WHERE Status IS NULL AND Insert_TimeStamp < NOW() ORDER BY Priority DESC LIMIT " . $recordPerRequest;
        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) > 0) {
            $rows = [];

            while ($row = mysqli_fetch_assoc($result)) {
                $item = [
                    'SDT' => $row['SDT'],
                    'sdt' => $row['SDT'][0] != '0' ? '0' . $row['SDT'] : $row['SDT'],
                    'content' => $row['Content']
                ];

                updateData($row, $deviceId);

                unset($item['SDT']);
                $rows[] = $item;
            }


            return response(true, 'Get data success', $rows);
        }

        return response(false, 'Data not found', []);
    }

    function updateData($row, $deviceId)
    {
        include "db.php";

        if (!empty($row)) {
            date_default_timezone_set('Asia/Ho_Chi_Minh');
            $sql = "SELECT Team FROM csdl_device WHERE Device_ID = '$deviceId'";
            $result = mysqli_query($conn, $sql);
            $response = mysqli_fetch_row($result);
            $team = !empty($response) ? $response[0] : '';
            $now = date('Y-m-d H:i:s');
            $sdt = $row['SDT'];

            $sql = "UPDATE `csdl_sdt`
                    SET `Status` = 'used', `Used_TimeStamp` = '$now', `Sent_to_by_Device` = '$deviceId', `Team` = '$team'
                    WHERE `SDT` = '$sdt'";

            mysqli_query($conn, $sql);
        }
    }
?>