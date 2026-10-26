CREATE DATABASE zepto_database;
USE zepto_database;


select * from zepto_v1;
select count(*) from zepto_v1;

SELECT COUNT(*) AS total_rows FROM zepto_data;

SHOW COLUMNS FROM zepto_v1;

ALTER TABLE zepto_v1
ADD COLUMN sku_id INT AUTO_INCREMENT PRIMARY KEY FIRST;

SHOW COLUMNS FROM zepto_v1;

SELECT DISTINCT name FROM zepto_v1;
SELECT COUNT(DISTINCT name) FROM zepto_v1;

SELECT * FROM zepto_V1
WHERE mrp IS NULL OR
outOfStock IS NULL OR 
quantity IS NULL;

-- WE DONT HAVE ANY NULL values IN COMPLETE DATA(CHECKED FOR ALL COLUMNS)

SELECT COUNT(DISTINCT name) , COUNT( DISTINCT Category) FROM zepto_V1;
SELECT DISTINCT Category FROM zepto_V1;

SELECT outOfStock , COUNT(*) FROM zepto_V1
GROUP BY outOfStock;

SELECT * FROM zepto_v1 WHERE mrp=0;
-- ONE row have mrp = 0 so we need to delete it

SELECT * FROM zepto_v1 limit 10;
-- mrp and discountedSellingPrice is in paise so we need to divide it by 100 to convert in ruppees

UPDATE zepto_V1
SET mrp = mrp/100.0 ,  
discountedSellingPrice = discountedSellingPrice/100.0 
WHERE sku_id > 0; 

SELECT * FROM zepto_v1 limit 10;








