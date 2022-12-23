DROP DATABASE IF EXIST myshop;
CREATE DATABASE myshop;
USE `myshop`

CREATE TABLE `products` (
  `product_id` int PRIMARY KEY,
  `product_name` varchar(50),
  `product_des` longtext,
  `product_price` float,
  `product_ing_source` varchar(255),
  `product_type` varchar(50),
  `product_brand` varchar(50)
);

CREATE TABLE `accounts` (
  `user_id` int PRIMARY KEY,
  `user_name` varchar(255),
  `user_mail` varchar(255),
  `user_password` varchar(255),
  `user_role` varchar(50),
  `user_address` varchar(255),
  `user_phone` varchar(20)
);

CREATE TABLE `orders` (
  `order_id` int PRIMARY KEY,
  `user_id` int,
  `order_mail` varchar(255),
  `order_status` bianary,
  `order_date` datetime,
  `order_discount_code` varchar(50),
  `order_address` varchar(255)
);

CREATE TABLE `order_detail` (
  `order_id` int,
  `product_id` int,
  `price` float,
  `quantity` float,
  PRIMARY KEY (`order_id`, `product_id`)
);

ALTER TABLE `order_detail` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `order_detail` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`user_id`) REFERENCES `accounts` (`user_id`);
