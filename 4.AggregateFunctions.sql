/************************************************************/
/***********************************************************/
/****************** Aggregate Functions *******************/

/* 1.write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.*/
-- Sample Table
CREATE TABLE orders (
    ord_no INT,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

SELECT SUM(purch_amt) AS Total_purch_amt
FROM Orders;

/* 2.Write a SQL query to calculate the average purchase amount of all orders. Return average purchase Amount.*/
SELECT AVG(purch_amt) AS Average_purch_amt
FROM Orders;

/* 3.write a SQL query that counts the number of unique salespeople. Return number of salespeople. */
SELECT COUNT(DISTINCT(salesman_id)) AS Num_salesman
FROM Orders;

/* 4.write a SQL query to count the number of customers. Return number of customers. */
CREATE TABLE customer (
    customer_id INT,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT);

INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);

SELECT COUNT(customer_id) AS Num_cust
FROM customer;

/*  5.write a SQL query to determine the number of customers who received at least one grade for their activity.  */
SELECT  COUNT(ALL GRADE) AS Num_cust
FROM customer;

SELECT COUNT(*) AS Num_cust
FROM customer
WHERE Grade > 1;

/* 6. Write a SQL query to find the maximum purchase amount. */
SELECT MAX(purch_amt) AS Max_amt
FROM ORDERS;

/* 7. Write a SQL query to find the minimum purchase amount. */
SELECT MIN(purch_amt) AS Max_amt
FROM ORDERS;

/* 8.write a SQL query to find the highest grade of the customers in each city. Return city, maximum grade.*/
SELECT city, MAX(Grade) max_grade
FROM customer
GROUP BY City;

/* 9.write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount.*/
SELECT customer_id, MAX(purch_amt) as max_purch_amt
FROM ORDERS
GROUP BY customer_id;

/* 10.write a SQL query to find the highest purchase amount ordered by each customer on a particular date. Return, order date and highest purchase amount.*/
SELECT customer_id, ord_date, MAX(purch_amt) as max_purch_amt
FROM ORDERS
GROUP BY customer_id,ord_date;

/* 11. write a SQL query to determine the highest purchase amount made by each salesperson on '2012-08-17'. Return salesperson ID, purchase amount */
SELECT salesman_id, MAX(purch_amt) AS Max_purch
FROM orders
WHERE ord_date = '2012-08-17'
GROUP BY salesman_id;

/* 12.write a SQL query to find the highest order (purchase) amount by each customer on a particular order date. Filter the result by highest order (purchase) amount above 2000.00. Return customer id, order date and maximum purchase amount.*/
SELECT customer_id	ord_date, MAX(purch_amt) AS Max_purch
FROM orders
WHERE purch_amt > 2000
GROUP BY customer_id,ord_date;

/* 13.write a SQL query to find the maximum order (purchase) amount in the range 2000 - 6000 (Begin and end values are included.) by combination of each customer and order date. Return customer id, order date and maximum purchase amount.*/
SELECT customer_id	ord_date, MAX(purch_amt) AS Max_purch
FROM orders
WHERE purch_amt BETWEEN 2000 AND 6000
GROUP BY customer_id,ord_date;

/* 14.write a SQL query to find the maximum order (purchase) amount based on the combination of each customer and order date. Filter the rows for maximum order (purchase) amount is either 2000, 3000, 5760, 6000. Return customer id, order date and maximum purchase amount.*/
SELECT customer_id	ord_date, MAX(purch_amt) AS Max_purch
FROM orders
WHERE purch_amt IN (2000, 3000, 5760, 6000)
GROUP BY customer_id,ord_date;

/* 15.write a SQL query to determine the maximum order amount for each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Return customer id and maximum purchase amount. */
SELECT customer_id	ord_date, MAX(purch_amt) AS Max_purch
FROM orders
WHERE customer_id >= 3002 AND customer_id <= 3007
GROUP BY customer_id;

/* 16. write a SQL query to find the maximum order (purchase) amount for each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Filter the rows for maximum order (purchase) amount is higher than 1000. Return customer id and maximum purchase amount.*/
SELECT customer_id	ord_date, MAX(purch_amt) AS Max_purch
FROM orders
WHERE customer_id BETWEEN 3002 AND 3007
GROUP BY customer_id
HAVING MAX(purch_amt)>1000;

/* 17.write a SQL query to determine the maximum order (purchase) amount generated by each salesperson. Filter the rows for the salesperson ID is in the range 5003 and 5008 (Begin and end values are included.). Return salesperson id and maximum purchase amount.*/
SELECT customer_id	ord_date, MAX(purch_amt) AS Max_purch
FROM orders
WHERE salesman_id >= 5003 AND salesman_id <= 5008
GROUP BY customer_id;

/* 18. Write a SQL query to count all the orders generated on '2012-08-17'. Return number of orders.*/
SELECT count(ord_no)
FROM orders
WHERE ord_date = '2012-08-17';

-- OR
SELECT count(*)
FROM orders
WHERE ord_date = '2012-08-17';

/* 19. write a SQL query to count the number of salespeople in a city. Return number of salespeople.*/
-- Sample
-- Create the salesman table
CREATE TABLE salesman (
    salesman_id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);

-- Insert the given values into the salesman table
INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

SELECT count(DISTINCT salesman_id)
FROM orders;

-- OR
SELECT COUNT(*) AS num_of_salespeople
FROM salesman
WHERE city IS NOT NULL;

/* 20.Write a SQL query to count the number of orders based on the combination of each order date and salesperson. Return order date, salesperson id.*/
SELECT ord_date, salesman_id, COUNT(*)
FROM orders;

/* 21. Write a SQL query to calculate the average product price. Return average product price.*/
-- Create the item_mast table
CREATE TABLE item_mast (
    PRO_ID INT,
    PRO_NAME VARCHAR(50),
    PRO_PRICE DECIMAL(8, 2),
    PRO_COM INT);

INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM)
 VALUES(101, 'Mother Board', 3200.00, 15),
		(102, 'Key Board', 450.00, 16),
		(103, 'ZIP drive', 250.00, 14),
		(104, 'Speaker', 550.00, 16),
		(105, 'Monitor', 5000.00, 11),
		(106, 'DVD drive', 900.00, 12),
		(107, 'CD drive', 800.00, 12),
		(108, 'Printer', 2600.00, 13),
		(109, 'Refill cartridge', 350.00, 13),
		(110, 'Mouse', 250.00, NULL);
SELECT AVG(PRO_PRICE)
FROM item_mast;

/* 22. write a SQL query to count the number of products whose price are higher than or equal to 350. Return number of products.*/
SELECT COUNT(PRO_ID)
FROM item_mast
WHERE PRO_PRICE >=350;

/* 23. write a SQL query to compute the average price for unique companies. Return average price and company id.*/
SELECT AVG(DISTINCT PRO_PRICE),PRO_COM
FROM item_mast
WHERE PRO_COM IS NOT NULL
GROUP BY PRO_COM;

/* 24.write a SQL query to compute the sum of the allotment amount of all departments. Return sum of the allotment amount.*/
CREATE TABLE emp_department (
    DPT_CODE INT,
    DPT_NAME VARCHAR(50),
    DPT_ALLOTMENT INT);
INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES
(57, 'IT', 65000),
(63, 'Finance', 15000),
(47, 'HR', 240000),
(27, 'RD', 55000),
(89, 'QC', 75000);
SELECT SUM(DPT_ALLOTMENT)
FROM emp_department;

/* 25.write a SQL query to count the number of employees in each department. Return department code and number of employees.*/
SELECT emp_dept, COUNT(*)
FROM emp_details
GROUP BY emp_dept;


