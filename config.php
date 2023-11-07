<?php
    $servername = "localhost"; // Replace with your MySQL server name or IP address
    $username = "root";      // Replace with your MySQL username
    $password = "";      // Replace with your MySQL password
    $database = "ostad"; // Replace with the name of your MySQL database
    
    // Create a MySQL connection
    $mysqli = new mysqli($servername, $username, $password, $database);
    
    // Check the connection
    if ($mysqli->connect_error) {
        die("Connection failed: " . $mysqli->connect_error);
    }
?>