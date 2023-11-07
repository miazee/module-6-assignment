<?php
    include('./config.php');

    // query_four
    $query_four = "SELECT customers.name, customers.email, customers.location, SUM(Orders.total_amount) AS TotalPurchaseAmount FROM customers JOIN orders ON customers.customer_id = orders.customer_id GROUP BY customers.name ORDER BY TotalPurchaseAmount DESC LIMIT 5";
    $result_four = $mysqli->query($query_four);
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
                        <span class="fw-bold">Task-4: </span>
                        Write a SQL query to retrieve the top 5 customers who have made the highest total purchase amount. Display the customer name along with the total purchase amount in descending order of the purchase amount.
                    </p>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Customer Name</th>
                                <th scope="col">Customer Email</th>
                                <th scope="col">Customer Location</th>
                                <th scope="col">Total Purchase Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php while($row_four = $result_four->fetch_assoc()){ ?>
                            <tr>
                                <th scope="row"><?php echo $row_four['name']; ?></th>
                                <td><?php echo $row_four['email']; ?></td>
                                <td><?php echo $row_four['location']; ?></td>
                                <td><?php echo $row_four['TotalPurchaseAmount']; ?></td>
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