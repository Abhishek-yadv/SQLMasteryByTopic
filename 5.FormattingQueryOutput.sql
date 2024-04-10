/********************************************************/
/*******************************************************/
/*************** FormattingQueryOutput  ***************/

/*1.Write a SQL query to select all the salespeople. Return salesman_id, name, city, commission with the percent sign (%).*/
-- Sample Table
CREATE TABLE salesman (
    salesman_id INT,
    name VARCHAR(255),
    city VARCHAR(255),
    commission DECIMAL(5, 2));
INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);
SELECT salesman_id, name ,city, '%', commission*100 AS 'commission%'
FROM salesman;

/* 2.write a SQL query to find the number of orders booked for each day. Return the result in a format like "For 2001-10-10 there are 15 orders".*/
-- Sample table
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
# 
SELECT CONCAT(' For ', ord_date, ', there are ', COUNT(ord_no), ' orders.') AS col1
FROM orders
GROUP BY ord_date;

/*3. write a SQL query to find all the orders. Sort the result-set in ascending order by ord_no. Return all fields. */
SELECT *
FROM orders
ORDER BY ord_no;

/*4. write a SQL query to find all the orders. Sort the result-set in descending order by ord_date. Return all fields. */
SELECT *
FROM orders
ORDER BY ord_no DESC;

/*5. write a SQL query to find all the orders. Sort the result-set in descending order by ord_date and purch_amt. Return all fields. */
SELECT *
FROM orders
ORDER BY ord_date, purch_amt DESC;

/*6. write a SQL query to find all the customers. Sort the result-set by customer_id. Return cust_name, city, grade. */
SELECT cust_name, city,	grade
FROM customer
ORDER BY customer_id ;

/*7. write a SQL query that calculates the maximum purchase amount generated by each salesperson for each order date. Sort the result-set by salesperson id and order date in ascending order. Return salesperson id, order date and maximum purchase amount. */
SELECT salesman_id,	ord_date, MAX(purch_amt) AS max_purch
FROM ORDERS
GROUP BY salesman_id,ord_date
ORDER BY salesman_id, ord_date ASC;

/* 8.write a SQL query to find all the customers. Sort the result-set in descending order on 3rd field. Return customer name, city and grade. */
SELECT cust_name, city, grade
FROM CUSTOMER
ORDER BY 3 DESC;

/* 9.write a SQL query that counts the unique orders and the highest purchase amount for each customer. 
Sort the result-set in descending order on 2nd field. Return customer ID, number of distinct orders and highest purchase amount by each customer.*/
SELECT customer_id, COUNT(DISTINCT ord_no), max(purch_amt) AS MAX
FROM ORDERS
GROUP BY customer_id;

/* 10.write a SQL query to calculate the summation of purchase amount, total commission (15% for all salespeople) by each order date. Sort the result-set on order date. Return order date, summation of purchase amount and commission.*/
SELECT ord_date, SUM(purch_amt), SUM(purch_amt) * 0.15
FROM orders
GROUP BY ord_date
ORDER BY ord_date;




