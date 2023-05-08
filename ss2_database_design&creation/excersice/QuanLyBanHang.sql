CREATE DATABASE IF NOT EXISTS QuanLyBanHang;
USE QuanLyBanHang;

CREATE TABLE Customer(
	customer_ID int auto_increment PRIMARY KEY,
	customer_Name varchar(50),
	customer_Age int,
	CHECK( Age > 0)
);

CREATE TABLE `Order`(
	order_ID int auto_increment PRIMARY KEY,
	customer_ID int,
	order_Date DATE,
	oder_TotalPrice DOUBLE,
	FOREIGN KEY (customer_ID) REFERENCES customer(customer_ID)
);

CREATE TABLE Product(
	product_ID int auto_increment PRIMARY KEY,
	product_Name VARCHAR(50),
	product_Price DOUBLE
);


CREATE TABLE `OrderDetail`(
	order_ID int,
	product_ID int,
	order_Quantity int,
	FOREIGN KEY (order_ID) REFERENCES `Order`(order_ID),
	FOREIGN KEY (product_ID) REFERENCES Product(product_ID)
);