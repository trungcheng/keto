<?php
    include('db.php');
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>HỆ THỐNG SPAM SMS</title>
    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../vendor/bootstrap/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
        <div class="container">
            <a class="navbar-brand" href="/">HỆ THỐNG SPAM SMS</a>
        </div>
    </nav>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h4 class="mt-3">BẬT/TẮT HỆ THỐNG</h4>
                <div>
                    <?php
                        $sql = "SELECT Status FROM on_off_time WHERE ID = 1";
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
        $(function() {
            $('#toggle-system').change(function() {
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
    </script>
</body>
</html>
