<?php
    include('./config.php');

    // query_one
    $query_one = "SELECT c.customer_id, c.name AS customer_name, c.email, c.location, COUNT(o.order_id) AS total_orders FROM customers AS c LEFT JOIN orders AS o ON c.customer_id = o.customer_id GROUP BY c.customer_id, c.name, c.email, c.location ORDER BY total_orders DESC";
    $result_one = $mysqli->query($query_one);
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
                        <span class="fw-bold">Task-1: </span>
                        Write a SQL query to retrieve all the customer information along with the total number of orders placed by each customer. Display the result in descending order of the number of orders.
                    </p>
                    <table class="table">
                        <thead>
                            <tr>
                            <th scope="col">Customer Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Location</th>
                            <th scope="col">Total Orders</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php while($row_one = $result_one->fetch_assoc()){ ?>
                            <tr>
                                <th scope="row"><?php echo $row_one['customer_id']; ?></th>
                                <td><?php echo $row_one['customer_name']; ?></td>
                                <td><?php echo $row_one['email']; ?></td>
                                <td><?php echo $row_one['location']; ?></td>
                                <td><?php echo $row_one['total_orders']; ?></td>
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