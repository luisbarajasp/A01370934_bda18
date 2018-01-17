CREATE DEFINER=`root`@`%` PROCEDURE `show_products`(in linea_producto VARCHAR(50))
BEGIN
DECLARE line VARCHAR(50);
set line = concat(linea_producto, "%");
SELECT *
FROM `classicmodels`.`products`
where productLine like line;

END

CREATE DEFINER=`root`@`localhost` PROCEDURE `count_customers_letter`(IN letter varchar(10))
begin 
declare name varchar(50); 
set name = concat(letter, "%"); 
SELECT COUNT(*) as count FROM customers WHERE customerName like name; 
end

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_most_less_expensive`()
begin
SELECT * FROM products as pr, (SELECT MIN(buyPrice) as min, MAX(buyPrice) as max from products) as p WHERE p.max = pr.buyPrice OR p.min = pr.buyPrice;
end
