<?php
    include('./config.php');

    // query_two
    $query_two = "SELECT o.order_id, p.name AS product_name, oi.quantity, (oi.quantity * oi.unit_price) AS total_amount FROM order_items AS oi INNER JOIN products AS p ON oi.product_id = p.product_id INNER JOIN orders AS o ON oi.order_id = o.order_id ORDER BY o.order_id ASC;";
    $result_two = $mysqli->query($query_two);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ostad - Database Project</title>
    <!-- bootstrap css link  -->
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <!-- custom css link  -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="container">
        <div class="row my-5">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <!-- navbar -->
                <?php include('./navbar.php'); ?>
                <!-- navbar -->
                <div class="card p-3 shadow">
                    <p class="">
                        <span class="fw-bold">Task-2: </span>
                        Write a SQL query to retrieve the product name, quantity, and total amount for each order item. Display the result in ascending order of the order ID.
                    </p>
                    <table class="table">
                        <thead>
                            <tr>
                            <th scope="col">Order Id</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php while($row_two = $result_two->fetch_assoc()){ ?>
                            <tr>
                                <th scope="row"><?php echo $row_two['order_id']; ?></th>
                                <td><?php echo $row_two['product_name']; ?></td>
                                <td><?php echo $row_two['quantity']; ?></td>
                                <td><?php echo $row_two['total_amount']; ?></td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>

    <script src="./assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>