<?php
    $server = "127.0.0.1";
    $user = "root";
    $password = "laragon";
    $dbname = "keto";

    $conn = mysqli_connect($server, $user, $password, $dbname);

    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    mysqli_set_charset($conn,'utf8');
?>