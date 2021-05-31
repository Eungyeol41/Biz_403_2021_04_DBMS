-- 관리자 접속
CREATE DATABASE nhDB;

CREATE USER nhUser@localhost IDENTIFIED BY '1234';
DROP USER nhUser@localhost;
USE mysql;
GRANT ALL PRIVILEGES ON *.* TO nhUser@localhost;