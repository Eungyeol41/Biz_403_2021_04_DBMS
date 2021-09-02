CREATE USER 'gimbap'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON *.* TO 'gimbap'@'%';
CREATE DATABASE gimbapDB;
USE gimbapDB;

DROP TABLE tbl_products;
DROP TABLE tbl_orders;

INSERT INTO tbl_products(p_code, p_name, p_price) VALUES ('P0014', '로제 떡볶이', 4000);