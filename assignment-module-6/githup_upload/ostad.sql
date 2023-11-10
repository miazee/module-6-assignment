-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2023 at 03:51 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ostad`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Category A'),
(2, 'Category B'),
(3, 'Category C'),
(4, 'Category D'),
(5, 'Category E'),
(6, 'Category F'),
(7, 'Category G'),
(8, 'Category H'),
(9, 'Category I'),
(10, 'Category J');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `location`) VALUES
(1, 'John Doe', 'john.doe@example.com', 'New York'),
(2, 'Jane Smith', 'jane.smith@example.com', 'Los Angeles'),
(3, 'Bob Johnson', 'bob.johnson@example.com', 'Chicago'),
(4, 'Alice Brown', 'alice.brown@example.com', 'Houston'),
(5, 'David Lee', 'david.lee@example.com', 'San Francisco'),
(6, 'Sara White', 'sara.white@example.com', 'Miami'),
(7, 'Michael Davis', 'michael.davis@example.com', 'Boston'),
(8, 'Lisa Taylor', 'lisa.taylor@example.com', 'Dallas'),
(9, 'Steven Anderson', 'steven.anderson@example.com', 'Seattle'),
(10, 'Karen Wilson', 'karen.wilson@example.com', 'Denver');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` bigint(150) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `total_amount`) VALUES
(1, 1, '2023-01-15 00:00:00', 50.25),
(2, 2, '2023-01-16 00:00:00', 75.00),
(3, 3, '2023-01-17 00:00:00', 35.99),
(4, 4, '2023-01-18 00:00:00', 120.50),
(5, 5, '2023-01-19 00:00:00', 89.95),
(6, 6, '2023-01-20 00:00:00', 42.75),
(7, 7, '2023-01-21 00:00:00', 150.80),
(8, 8, '2023-01-22 00:00:00', 95.60),
(9, 9, '2023-01-23 00:00:00', 200.25),
(10, 10, '2023-01-24 00:00:00', 55.30);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` bigint(150) NOT NULL,
  `product_id` bigint(150) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(1, 1, 1, 3, 19.99),
(2, 1, 2, 2, 29.99),
(3, 2, 3, 4, 14.99),
(4, 2, 4, 1, 39.99),
(5, 3, 5, 2, 24.99),
(6, 3, 6, 3, 9.99),
(7, 4, 7, 5, 49.99),
(8, 4, 8, 1, 34.99),
(9, 5, 9, 2, 59.99),
(10, 5, 10, 3, 19.99);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `description`, `price`) VALUES
(1, 10, 'Product A', 'Description of Product A', 19.99),
(2, 9, 'Product B', 'Description of Product B', 29.99),
(3, 8, 'Product C', 'Description of Product C', 14.99),
(4, 7, 'Product D', 'Description of Product D', 39.99),
(5, 6, 'Product E', 'Description of Product E', 24.99),
(6, 5, 'Product F', 'Description of Product F', 9.99),
(7, 4, 'Product G', 'Description of Product G', 49.99),
(8, 3, 'Product H', 'Description of Product H', 34.99),
(9, 2, 'Product I', 'Description of Product I', 59.99),
(10, 1, 'Product J', 'Description of Product J', 19.99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
