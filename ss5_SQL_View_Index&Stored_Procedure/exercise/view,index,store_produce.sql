DROP DATABASE IF EXISTS demo_db;
-- Bước 1: Tạo cơ sở dữ liệu demo
CREATE DATABASE demo_db;

-- Bước 2: Tạo bảng Products
USE demo_db;
CREATE TABLE Products (
Id INT PRIMARY KEY AUTO_INCREMENT,
productCode VARCHAR(10) NOT NULL,
productName VARCHAR(50) NOT NULL,
productPrice DECIMAL(10,2) NOT NULL,
productAmount INT NOT NULL,
productDescription TEXT,
productStatus VARCHAR(20) NOT NULL
);

-- Chèn một số dữ liệu mẫu cho bảng Products
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
('P01', 'Product 1', 10.99, 100, 'This is product 1', 'In Stock'),
('P02', 'Product 2', 20.99, 50, 'This is product 2', 'Out of Stock'),
('P03', 'Product 3', 30.99, 200, 'This is product 3', 'In Stock'),
('P04', 'Product 4', 40.99, 75, 'This is product 4', 'In Stock');

-- Bước 3: Tạo Unique Index và Composite Index trên bảng Products

CREATE UNIQUE INDEX id_productCode ON Products(productCode);
CREATE INDEX id_productNamePrice ON Products(productName,productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào

EXPLAIN SELECT * FROM products WHERE productName = 'Product1';

-- So sánh câu truy vấn trước và sau khi tạo index
-- Trước khi tạo index
SELECT * FROM Products WHERE productName = 'Product 1';
-- Sau khi tạo index
SELECT * FROM Products WHERE productCode = 'P01';

-- Bước 4: Tạo view, sửa đổi view và xoá view

CREATE VIEW productInfo AS
SELECT productCode,productName,productPrice,productStatus
FROM products;

SELECT * FROM productInfo;

ALTER VIEW productInfo AS
SELECT productCode,productName,productPrice,productStatus,productAmount
FROM products;

DROP VIEW productInfo;

-- Bước 5: Tạo store procedure

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product:

DELIMITER //
CREATE PROCEDURE add_product(
    p_productCode VARCHAR(50),
    p_productName VARCHAR(255),
    p_productPrice DECIMAL(10,2),
    p_productAmount INT,
    p_productDescription TEXT,
    p_productStatus VARCHAR(20)
)
BEGIN
    INSERT INTO Products (
        productCode, productName, productPrice, productAmount, 
        productDescription, productStatus
    )
    VALUES (
        p_productCode, p_productName, p_productPrice, p_productAmount, 
        p_productDescription, p_productStatus
    );
END //

DELIMITER ;

-- them moi san pham
CALL add_product('P0001', 'Product 1', 100.0, 50, 'Product 1 description', 'active');

-- Stored procedure sửa thông tin sản phẩm theo id trong bảng product:

DELIMITER //
CREATE PROCEDURE updateProductById(
	p_id int,
	p_productCore VARCHAR (50),
	p_productName VARCHAR (255),
	p_productPrice DECIMAL(10,2),
	p_productAmount INT,
	p_productDescription TEXT,
	p_productStatus VARCHAR(20)
)

BEGIN
	UPDATE products
	SET 
		productCode = p_productCore,
		productName = p_productName,
		productPrice = p_productPrice,
		productAmount = p_productAmount,
		productDescription = p_productDescription,
		productStatus = p_productStatus
	WHERE id = p_id;
END //
DELIMITER ;

-- sua san pham id 5
CALL updateProductById(5,'P0001 sua', 'Product sua', 999.0, 99, 'Product 1 description sua', 'active sua');

-- Stored procedure xoá sản phẩm theo id trong bảng product:
DELIMITER //
CREATE PROCEDURE deleteProductById(
	p_id INT
)
BEGIN
	DELETE FROM products
	WHERE id = p_id;
END //
DELIMITER ;

-- xoa san pham id 5
CALL deleteProductById(5);

