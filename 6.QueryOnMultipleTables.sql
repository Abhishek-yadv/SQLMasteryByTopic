/*************************************************************/
/************************************************************/
/************* Query on Multiple Tables ********************/
/*1. write a SQL query to find the salespeople and customers who live in the same city. Return customer name, salesperson name and salesperson city.*/
-- SAMPLE table salesman customer and orders
-- salesman
CREATE TABLE salesman (
    salesman_id INT,
    name VARCHAR(255),
    city VARCHAR(255),
    commission DECIMAL(5, 2));
INSERT INTO salesman (salesman_id, name, city, commission)
VALUES
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5007, 'Paul Adam', 'Rome', 0.13),
    (5003, 'Lauson Hen', 'San Jose', 0.12);

--  customer table
CREATE TABLE customer (
    customer_id INT,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade INT,
    salesman_id INT);
    
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id)
VALUES
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3008, 'Julian Green', 'London', 300, 5002),
    (3004, 'Fabian Johnson', 'Paris', 300, 5006),
    (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
    (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
    (3001, 'Brad Guzan', 'London', NULL, 5005);
    
-- Orders table
CREATE TABLE orders (
    ord_no INT,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT);
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
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
    
# 1st method
SELECT customer.cust_name, salesman.name, salesman.city
FROM salesman, customer
WHERE salesman.city = customer.city;

-- 2nd method  
SELECT customer.cust_name, salesman.name, salesman.city
FROM customer
JOIN salesman
	ON customer.city = salesman.city;
    
/* 2. Write a SQL query to locate all the customers and the salesperson who works for them. Return customer name, and salesperson name. */
SELECT customer.cust_name, salesman.name
FROM customer
LEFT JOIN salesman
	ON customer.salesman_id = salesman.salesman_id;
    
-- 2nd method
SELECT customer.cust_name, salesman.name
FROM customer, salesman
WHERE salesman.salesman_id = customer.salesman_id;

/* 3.write a SQL query to find those salespeople who generated orders for their customers but are not located in the same city.
 Return ord_no, cust_name, customer_id (orders table), salesman_id (orders table). */
-- 1ST METHOD 
SELECT ord_no, cust_name, orders.customer_id, orders.salesman_id
FROM salesman, customer, orders
WHERE customer.city <> salesman.city
  AND orders.customer_id = customer.cust_id
  AND orders.salesman_id = salesman.salesman_id;

-- 2ND METHOD
SELECT ord_no, cust_name, orders.customer_id, orders.salesman_id
FROM orders
JOIN customer ON orders.customer_id = customer.cust_id
JOIN salesman ON orders.salesman_id = salesman.salesman_id
WHERE customer.city <> salesman.city;

/* 4.From the table orders and customer Write a SQL query to locate the orders made by customers. Return order number, customer name. */
SELECT orders.ord_no, customer.cust_name
FROM orders, customer
WHERE orders.customer_id = customer.cust_id;

# OR
SELECT ord_no,cust_name
FROM orders
JOIN customer
	ON customer.cust_id = orders.customer_id;
     
/* 5.From the table orders and customer, write a SQL query to find those customers where each customer has a grade and is served by a salesperson
 who belongs to a city. Return cust_name as "Customer", grade as "Grade". */
SELECT customer.cust_name AS "Customer", customer.grade AS "Grade", orders.ord_no AS "Order No."
FROM orders, salesman, customer
WHERE orders.customer_id = customer.cust_id
  AND orders.salesman_id = salesman.salesman_id
  AND salesman.city IS NOT NULL
  AND customer.grade IS NOT NULL;
  
# OR 
SELECT Customer.cust_name AS "Customer",  Customer.grade AS "Grade"
FROM Customer
JOIN Orders
    ON Customer.cust_id = Orders.customer_id
WHERE Customer.grade IS NOT NULL AND Customer.City IS NOT NULL AND Customer.salesman_id IS NOT NULL;

/* 6.From the salesman and customer table, write a SQL query to find those customers who are served by a salesperson and the salesperson earns
 commission in the range of 12% to 14% (Begin and end values are included.). Return cust_name AS "Customer", city AS "City". */
SELECT *
FROM customer, salesman;

SELECT cust_name as 'Customer', customer.city, name, commission
FROM customer, salesman
WHERE customer.salesman_id = salesman.salesman_id
  AND salesman.commission BETWEEN 0.12 AND 0.14; 
  
/* 7. From the table (salesman, customer and order), write a SQL query to find all orders executed by the salesperson and ordered by the customer
 whose grade is greater than or equal to 200. Compute purch_amt*commission as “Commission”. Return customer name, commission as “Commission%” and Commission.*/
SELECT ord_no, cust_name, commission AS "Commission%", purch_amt * commission AS "Commission"
FROM salesman, orders, customer
WHERE orders.customer_id = customer.cust_id
  AND orders.salesman_id = salesman.salesman_id
  AND customer.grade >= 200;

/* 8. From the following table customer and order, write a SQL query to find those customers who placed orders on October 5, 2012.
 Return customer_id, cust_name, city, grade, salesman_id, ord_no, purch_amt, ord_date, customer_id and salesman_id. */
SELECT *
FROM customer, orders
WHERE orders.customer_id = customer.cust_id
  AND Orders.ord_date = str_to_date('October 5, 2012', '%M %e, %Y')
  


 
 