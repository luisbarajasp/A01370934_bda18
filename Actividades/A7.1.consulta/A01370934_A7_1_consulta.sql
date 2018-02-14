-- A01370934

explain
SELECT productLine, count(*)
FROM products
NATURAL JOIN orderdetails
NATURAL JOIN orders
NATURAL JOIN customers
WHERE customers.customerNumber=112
GROUP BY products.productLine;
