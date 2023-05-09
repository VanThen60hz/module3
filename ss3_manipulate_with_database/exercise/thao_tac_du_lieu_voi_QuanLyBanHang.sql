USE quanlybanhang;

INSERT INTO customer
VALUES
(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);

INSERT INTO `Order` (order_ID, customer_ID, order_Date)
VALUES
(1, 1, '2006-03-21'),
(2, 2, '2006-03-23'),
(3, 1, '2006-03-16');

INSERT INTO product
VALUES
(1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(5,'Quat',1),
(6,'Bep Dien',2);



INSERT INTO orderdetail
VALUES
(1,1,1),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

SELECT order_ID, order_Date, oder_TotalPrice
FROM `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách

SELECT c.customer_Name, p.product_Name,SUM(od.order_Quantity) 
FROM customer c 
JOIN `order` o on c.customer_ID = o.customer_ID
JOIN orderdetail od on o.order_ID = od.order_ID
JOIN product p on od.product_ID = p.product_ID
GROUP BY c.customer_Name, p.product_Name;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.customer_Name
FROM customer c
JOIN `order` o on c.customer_ID = o.customer_ID
JOIN orderdetail od on o.order_ID = od.order_ID
WHERE od.order_Quantity IS NULL;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

SELECT o.order_ID,o.order_Date, SUM( od.order_Quantity * p.product_Price)
FROM `order` o 
JOIN orderdetail od ON od.order_ID = o.order_ID
JOIN product p ON od.product_ID = p.product_ID
GROUP BY o.order_ID;