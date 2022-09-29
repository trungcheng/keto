<?php

header("Access-Control-Allow-Methods: GET");

require_once "db.php";

var_dump($_GET('DeviceID'));die;

$sql = "SELECT * FROM users";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    $rows = [];

    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    echo json_encode($rows);
} else {
    echo json_encode([]);
}

?>