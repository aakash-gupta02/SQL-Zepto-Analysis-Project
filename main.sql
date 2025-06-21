create database if not exists zepto;

use zepto;

CREATE TABLE zeptodata2 (
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp DECIMAL(8,2),
  discountPercent DECIMAL(5,2),
  availableQuantity INT,
  discountedSellingPrice DECIMAL(8,2),
  weightInGms INT,
  outOfStock BOOLEAN,
  quantity INT
);


CREATE TABLE zeptodata (
  id INT AUTO_INCREMENT PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp DECIMAL(8,2),
  discountPercent DECIMAL(5,2),
  availableQuantity INT,
  discountedSellingPrice DECIMAL(8,2),
  weightInGms INT,
  outOfStock BOOLEAN,
  quantity INT
);



select * from zeptodata;

