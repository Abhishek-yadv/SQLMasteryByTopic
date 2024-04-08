/************************************************************/
/***********************************************************/
/*********** Wildcard & Special Operators *****************/

/*1. Write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. Return salesman_id, name, city, commission. */
-- Sample Data
CREATE TABLE salesman (
    salesman_id INT,
    name VARCHAR(255),
    city VARCHAR(255),
    commission DECIMAL(4,2));
    
INSERT INTO salesman (salesman_id, name, city, commission) VALUES
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5007, 'Paul Adam', 'Rome', 0.13),
    (5003, 'Lauson Hen', 'San Jose', 0.12);

SELECT salesman_id, name, city, commission
FROM salesman
WHERE CITY = 'Paris' OR CITY = 'Rome';

# OR 
SELECT salesman_id, name, city, commission
FROM salesman
WHERE CITY IN ('Paris','Rome');

/* 2.Write a SQL query to find the details of the salespeople who come from either 'Paris' or 'Rome'. Return salesman_id, name, city, commission. */
SELECT salesman_id, name, city, commission
FROM salesman
WHERE CITY = 'Paris' OR CITY = 'Rome';

# OR 
SELECT salesman_id, name, city, commission
FROM salesman
WHERE CITY IN ('Paris','Rome');

/* 3.Write a SQL query to find the details of those salespeople who live in cities other than Paris and Rome. Return salesman_id, name, city, commission. */
SELECT salesman_id, name, city, commission
FROM salesman
WHERE CITY NOT IN ('Paris','Rome');

/* 4. Write a SQL query to retrieve the details of all customers whose ID belongs to any of the values 3007, 3008 or 3009. Return customer_id, cust_name, city, grade, and salesman_id. */
CREATE TABLE customer (
    customer_id INT,
    cust_name VARCHAR(255),
    city VARCHAR(255),
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

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE customer_id IN (3007, 3008,3009);

/* 5.Write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 (begin and end values are included). Return salesman_id, name, city, and commission. */
SELECT salesman_id, name, city, commission
FROM salesman
WHERE commission BETWEEN 0.12 AND 0.14;

/* 6.Write a SQL query to select orders between 500 and 4000 (begin and end values are included). Exclude orders amount 948.50 and 1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id.*/
CREATE TABLE orders (
    ord_no INT,
    purch_amt DECIMAL(10,2),
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

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM orders
WHERE (purch_amt BETWEEN 500 AND 4000) AND (purch_amt NOT IN ( 948.50, 1983.43));

/* 7. Write a SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (not inclusive).
 Return salesman_id, name, city, commission. */
SELECT salesman_id, name, city, commission
 FROM salesman
 WHERE name BETWEEN "A" AND "L";
 
 # OR
 SELECT salesman_id, name, city, commission
 FROM salesman
 WHERE name regexp "^[A-K]";
 
SELECT salesman_id, name, city, commission
FROM salesman
WHERE name LIKE 'A%' OR
      name LIKE 'B%' OR
      name LIKE 'C%' OR
      name LIKE 'D%' OR
      name LIKE 'E%' OR
      name LIKE 'F%' OR
      name LIKE 'G%' OR
      name LIKE 'H%' OR
      name LIKE 'I%' OR
      name LIKE 'J%' OR
      name LIKE 'K%';
      
/* 8. Write a SQL query to find the details of all salespeople except those whose names begin with any letter between 'A' and 'M'. Return salesman_id, name, city, commission. */
SELECT salesman_id, name, city, commission
FROM salesman
 WHERE name NOT BETWEEN "A" AND "L";
 
/*9. From the following table, write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id.*/
SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE cust_name LIKE "b%";

/*10. From the following table, write a SQL query to find the details of the customers whose names end with the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.*/
SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE cust_name LIKE "%n";

/*11. Write a SQL query to find the details of those salespeople whose names begin with ‘N’ and the fourth character is 'l'. Rests may be any character. Return salesman_id, name, city, commission. */
SELECT salesman_id, name, city, commission
FROM salesman
WHERE name LIKE "%N";

/*12. From the following table, write a SQL query to find those rows where col1 contains the escape character underscore ( _ ). Return col1.*/
-- Sample table
CREATE TABLE testtable (
    col1 VARCHAR(255)
);
INSERT INTO testtable (col1) VALUES
    ('A001/DJ-402\44_/100/2015'),
    ('A001_\DJ-402\44_/100/2015'),
    ('A001_DJ-402-2014-2015'),
    ('A002_DJ-401-2014-2015'),
    ('A001/DJ_401'),
    ('A001/DJ_402\44'),
    ('A001/DJ_402\44\2015'),
    ('A001/DJ-402%45\2015/200'),
    ('A001/DJ_402\45\2015%100'),
    ('A001/DJ_402%45\2015/300'),
    ('A001/DJ-402\44');

SELECT *
FROM testtable
WHERE col1 LIKE "%/_%" ESCAPE "/";

/* 13. Write a SQL query to identify those rows where col1 does not contain the escape character underscore ( _ ). Return col1.*/
SELECT *
FROM testtable
WHERE col1 NOT LIKE "%/_%" ESCAPE "/";

/* 14.  Write a SQL query to find rows in which col1 contains the forward slash character ( / ). Return col1  */
SELECT *
FROM testtable
WHERE col1 LIKE "%//%" ESCAPE "/";

/* 15. Write a SQL query to identify those rows where col1 does not contain the forward slash character ( / ). Return col1.*/
SELECT *
FROM testtable
WHERE col1 NOT LIKE "%//%" ESCAPE "/";

/* 16. From the following table, write a SQL query to find those rows where col1 contains the string ( _/ ). Return col1. */
SELECT *
FROM testtable
-- Filters the rows to only include those where the 'col1' column:
-- - Contains the sequence of characters '%/_//%' where the underscore '_' is followed by a forward slash '/'.
-- The ESCAPE clause is used to escape the special character '/' in the pattern.
WHERE col1 LIKE '%/_//%' ESCAPE '/';

/* 17. Write a SQL query to find those rows where col1 does not contain the string ( _/ ). Return col1.*/
SELECT *
FROM testtable
-- Filters the rows to only include those where the 'col1' column:
-- - Contains the sequence of characters '%/_//%' where the underscore '_' is followed by a forward slash '/'.
-- The ESCAPE clause is used to escape the special character '/' in the pattern.
WHERE col1 NOT LIKE '%/_//%' ESCAPE '/';


/* 18. Write a SQL query to find those rows where col1 contains the character percent ( % ). Return col1.*/
SELECT *
FROM testtable
WHERE col1 LIKE '%/%%' ESCAPE '/';

SELECT *
FROM testtable
WHERE col1 REGEXP '.*%.*';

/* 19. Write a SQL query to find those rows where col1 does not contain the character percent ( % ). Return col1.*/
SELECT *
FROM testtable
WHERE col1 NOT LIKE '%/%%' ESCAPE '/';

SELECT *
FROM testtable
WHERE col1 NOT REGEXP '.*%.*';

/* 20. Write a SQL query to find all those customers who does not have any grade. Return customer_id, cust_name, city, grade, salesman_id.*/
SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE grade IS NULL;

/* 21. Write a SQL query to locate all customers with a grade value. Return customer_id, cust_name,city, grade, salesman_id. */
SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE grade IS NOT NULL;

/* 22. Write a SQL query to locate the employees whose last name begins with the letter 'D'. Return emp_idno, emp_fname, emp_lname and emp_dept. */
SELECT emp_idno, emp_fname, emp_lname and emp_dept
FROM emp_details
WHERE emp_lname regexp '^D';
