<?php
    include('db.php');
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Hệ thống chăm sóc khách hàng nội bộ SMS</title>
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../vendor/bootstrap/css/style.css" rel="stylesheet">
    <title>Hệ thống chăm sóc khách hàng nội bộ SMS</title>
    <meta name="title" content="Hệ thống chăm sóc khách hàng nội bộ bằng SMS">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Gửi tin nhắn chăm sóc khách hàng và nhận lại phản hồi từ khách">
    <meta name="author" content="Hera Milk">
    <meta property="og:url" content="https://suanghe.vn/customer-care/philippines"/>
    <meta property="og:type" content="website"/>
    <meta property="og:title" content="Hệ thống chăm sóc khách hàng nội bộ bằng SMS"/>
    <meta property="og:description" content="Hệ thống chăm sóc khách hàng nội bộ bằng SMS "/>
    <meta property="og:image" content="./assets/customer-care.png">
    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content=https://suanghe.vn/customer-care/philippines">
    <meta property="twitter:title" content="Hệ thống chăm sóc khách hàng bằng sms">
    <meta property="twitter:description" content="Hệ thống chăm sóc khách hàng bằng sms">
</head>

<body onload="timer_function()";>
    <?php include('header.php'); ?>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div>
                    <h4 class="mt-3">BẬT/TẮT HỆ THỐNG</h4>
                    <i><span id="date-time"></span></i>
                </div>
                <div>
                    <?php
                        $sql = "SELECT `Status` FROM `on_off_time` ORDER BY `ID` DESC LIMIT 1";
                        $result = mysqli_query($conn, $sql);
                        $status = mysqli_fetch_row($result);
                    ?>
                    <label class="switch">
                        <input id="toggle-system" type="checkbox" <?php echo $status[0] == 'On' ? 'checked' : '' ?> />
                        <span class="slider round"></span>
                    </label>
                </div>

                <h4 class="mt-3">DANH SÁCH 20 ALERT GẦN NHẤT</h4>
                <div class="table-responsive">
                    <table class="table table-hover table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Team</th>
                                <th scope="col">Device ID</th>
                                <th scope="col">Alert message</th>
                                <th scope="col">Alert time</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $sql = "SELECT * FROM alert ORDER BY AlertTime DESC LIMIT 20";
                                $result = mysqli_query($conn, $sql);

                                if (mysqli_num_rows($result) > 0) {
                                    while ($row = mysqli_fetch_assoc($result)) {
                                        ?>
                                            <tr>
                                                <td><?php echo $row["ID"]; ?></td>
                                                <td><?php echo $row["Team"]; ?></td>
                                                <td><?php echo $row["Device_ID"]; ?></td>
                                                <td><?php echo $row["AlertMess"]; ?></td>
                                                <td><?php echo $row["AlertTime"]; ?></td>
                                            </tr>
                                        <?php
                                    };
                                } else {
                                    echo '<tr><td colspan="5">Không tìm thấy dữ liệu</td></tr>';
                                }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script>
        $(function () {
            $('#toggle-system').change(function () {
                var state = $(this).prop('checked');

                $.ajax({
                    type: "POST",
                    url: "./on_off_system.php",
                    data: {
                        state: state
                    },
                    success: function (response) {
                        if (response.status) {
                            alert(response.message);
                            return;
                        }
                    },
                    error: function (e) {
                        alert(e);
                        return;
                    }
                });
            });
        });

        function ajaxFunction() {
            var httpxml;

            try {
                // Firefox, Opera 8.0+, Safari
                httpxml = new XMLHttpRequest();
            } catch (e) {
                // Internet Explorer
                try {
                    httpxml = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    try {
                        httpxml = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) {
                        alert("Your browser does not support AJAX!");
                        return false;
                    }
                }
            }

            function stateck() {
                if (httpxml.readyState == 4) {
                    document.getElementById("date-time").innerHTML = httpxml.responseText;
                }
            }

            var url = "server-time.php?sid=" + Math.random();

            httpxml.onreadystatechange = stateck;
            httpxml.open("GET", url, true);
            httpxml.send(null);

            tt = timer_function();
        }

        function timer_function() {
            mytime = setTimeout('ajaxFunction();', 1000);
        }
    </script>
</body>
</html>
