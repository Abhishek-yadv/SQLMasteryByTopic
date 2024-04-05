# Retrieve data
/*1. Write a SQL statement that displays all the information about all salespeople.*/
-- Sample table
CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);

INSERT INTO salesman (salesman_id, name, city, commission)
VALUES
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5007, 'Paul Adam', 'Rome', 0.13),
    (5003, 'Lauson Hen', 'San Jose', 0.12);

SELECT * FROM salesman;

/* 2nd. Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution" */
SELECT "This is SQL Exercise, Practice and Solution";
# Output : This is SQL Exercise, Practice and Solution

/*3rd. Write a SQL query to display three numbers in three columns. */
SELECT 4,5,6;
# Output : 	4	5	6

/* 4th. Write a SQL query to display the sum of two numbers 10 and 15 from the RDBMS server. *\
SELECT 10+15;
# Output : 25

/* 5. Write an SQL query to display the result of an arithmetic expression. */
SELECT 10 + 15 - 5 * 2;
# Output : 15

/* 6. Write a SQL statement to display specific columns such as names and commissions for all salespeople. */
SELECT name, commission
from salesman;

/* 7. Write a query to display the columns in a specific order, such as order date, salesman ID, order number, and purchase amount for all orders.*/
-- Sample table creation and insertation
CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(8, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

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

SELECT  ord_date, salesman_id, ord_no,purch_amt
FROM Orders;
/* 8th. From the orders, write a SQL query to identify the unique salespeople ID. Return salesman_id.
SELECT DISTINCT  salesman_id FROM orders;


/* 9. From the salesman table, write a SQL query to locate salespeople who live in the city of 'Paris'. Return salesperson's name, city. */
SELECT * FROM Salesman
where City  = 'Paris';

/* 10. From customertable, write a SQL query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id. */
-- Sample Table Creation and insertation
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);

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

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE grade = 200;

/* 11. From the orders table, write a SQL query to find orders that are delivered by a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt. */
SELECT ord_no, ord_date, purch_amt
FROM  orders
WHERE salesman_id = 5001;

/* 12. From the following table, write a SQL query to find the Nobel Prize winner(s) for the year 1970. Return year, subject and winner. */
-- Sample Table creation and insertation
CREATE TABLE nobel_win (
    YEAR INT,
    SUBJECT VARCHAR(50),
    WINNER VARCHAR(100),
    COUNTRY VARCHAR(50),
    CATEGORY VARCHAR(50)
);

INSERT INTO nobel_win (YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY)
VALUES
    (1970, 'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
    (1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
    (1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
    (1970, 'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
    (1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
    (1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
    (1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),
    (1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
    (1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
    (1971, 'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
    (1971, 'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
    (1971, 'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
    (1971, 'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
    (1978, 'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
    (1978, 'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
    (1987, 'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
    (1987, 'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
    (1987, 'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),
    (1994, 'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
    (1994, 'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'),
    (1987, 'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
    (1987, 'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
    (1987, 'Economics', 'Robert Solow', 'USA', 'Economist'),
    (1994, 'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist');

SELECT * FROM 
nobel_win
WHERE YEAR = 1970;

/* 13. From the nobel_win table, write a SQL query to find the Nobel Prize winner in ‘Literature’ for 1971. Return winner.*/
SELECT Winner
FROM nobel_win
WHERE SUBJECT = "Literature" AND YEAR = 1971;

/* 14. From the nobel_win table, write a SQL query to locate the Nobel Prize winner ‘Dennis Gabor'. Return year, subject. */
SELECT year, subject
FROM nobel_win
WHERE winner = "Dennis Gabor";

/* 15. From the nobel_win table, write a SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner. */
SELECT year, subject
FROM nobel_win
WHERE SUBJECT = "Physics" AND Year > 1950;

/* 16. From the nobel_win table, write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975.
	Begin and end values are included. Return year, subject, winner, and country. */
SELECT year, subject, winner, country
FROM nobel_win
WHERE subject = "Chemistry" AND year BETWEEN 1965 AND 1975;

/* 17. Write a SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak from nobel_win.*/
-- This query selects all columns from the 'nobel_win' table. 
SELECT *
FROM nobel_win
WHERE year > 1972 AND winner IN ('Menachem Begin', 'Yitzhak Rabin');
  
/* 18. write a SQL query to retrieve the details of the winners whose first names match with the string ‘Louis’. Return year, subject, winner, country, and category.*/
SELECT  year, subject, winner, country, category
FROM nobel_win
WHERE winner LIKE "Louis%";

/* 19.write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971. Return year, subject, winner, country, and category.*/
SELECT *
FROM nobel_win
WHERE (subject = 'Physics' AND year = 1970)
UNION
(SELECT * FROM nobel_win WHERE (subject = 'Economics' AND year = 1971));

# OR
SELECT *
FROM nobel_win
WHERE (subject = 'Physics' AND year = 1970)
OR (subject = 'Economics' AND year = 1971);

/*20.From nobel_win , write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. Return year, subject, winner, country, and category.*/
SELECT year, subject, winner, country, category
FROM nobel_win
WHERE YEAR = 1970
AND SUBJECT NOT IN ("Physiology", "Economics");

/* 21. write a SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category. */
SELECT year, subject, winner, country, category
FROM nobel_win
WHERE winner = 'Physiology' AND YEAR < 1971
UNION 
SELECT year, subject, winner, country, category
FROM nobel_win
WHERE winner = 'Peace' OR YEAR >= 1974;

/* 22.write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category. */
SELECT  year, subject, winner, country, category
FROM nobel_win
WHERE WINNER = 'Johannes Georg Bednorz';

/* 23. write a SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'. Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending. */
SELECT year, subject, winner, country,category
FROM nobel_win
WHERE subject NOT LIKE "%P"
ORDER BY year DESC, winner;

/* 24.write a SQL query to find the details of 1970 Nobel Prize winners. Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set. Return year, subject, winner, country, and category. */
SELECT year, subject, winner, country, category
FROM nobel_win
WHERE year = 1970
ORDER BY
    (CASE
        WHEN subject = 'Chemistry' THEN 1
        WHEN subject = 'Economics' THEN 1
        ELSE 0
    END), subject, winner;
    
/* 25. From the following table, write a SQL query to select a range of products whose price is in the range Rs.200 to Rs.600. Begin and end values are included. Return pro_id, pro_name, pro_price, and pro_com. */
-- CREATING Sample table item_mast;
-- Create table item_mast
CREATE TABLE item_mast (
    PRO_ID INT,
    PRO_NAME VARCHAR(50),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM INT
);

-- Insert data into item_mast
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM)
VALUES
    (101, 'Mother Board', 3200.00, 15),
    (102, 'Key Board', 450.00, 16),
    (103, 'ZIP drive', 250.00, 14),
    (104, 'Speaker', 550.00, 16),
    (105, 'Monitor', 5000.00, 11),
    (106, 'DVD drive', 900.00, 12),
    (107, 'CD drive', 800.00, 12),
    (108, 'Printer', 2600.00, 13),
    (109, 'Refill cartridge', 350.00, 13),
    (110, 'Mouse', 250.00, 12);

SELECT pro_id, pro_name, pro_price, pro_com
FROM item_mast
WHERE pro_price between 200 AND 600;

/*26. From the following table, write a SQL query to calculate the average price for a manufacturer code of 16. Return avg.  */
SELECT AVG(pro_price)
FROM item_mast
WHERE pro_com = 16;

/* 27. From the following table, write a SQL query to display the pro_name as 'Item Name' and pro_price as 'Price in Rs.' */
SELECT pro_name AS 'Item Name', pro_price  AS 'Price in Rs.'
FROM item_mast
WHERE pro_price between 200 AND 600;

/* 28.write a SQL query to find the items whose prices are higher than or equal to $250. Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price. */
SELECT pro_name, pro_price
FROM item_mast
WHERE pro_price > 250 
ORDER BY pro_price DESC, pro_name ASC;

/* 29 write a SQL query to calculate average price of the items for each company. Return average price and company code. */
SELECT AVG(pro_price), pro_com
FROM item_mast
GROUP BY pro_com;

/* 30. From the following table, write a SQL query to find the cheapest item(s). Return pro_name and, pro_price.  */
SELECT pro_name, pro_price
FROM item_mast
WHERE  pro_price = (SELECT min(pro_price) FROM item_mast);

/* 31. From the following table, write a SQL query to find the unique last name of all employees. Return emp_lname. */
-- Create table emp_details
CREATE TABLE emp_details (
    EMP_IDNO INT,
    EMP_FNAME VARCHAR(50),
    EMP_LNAME VARCHAR(50),
    EMP_DEPT INT
);

-- Insert data into emp_details
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT)
VALUES
    (127323, 'Michale', 'Robbin', 57),
    (526689, 'Carlos', 'Snares', 63),
    (843795, 'Enric', 'Dosio', 57),
    (328717, 'Jhon', 'Snares', 63),
    (444527, 'Joseph', 'Dosni', 47),
    (659831, 'Zanifer', 'Emily', 47),
    (847674, 'Kuleswar', 'Sitaraman', 57),
    (748681, 'Henrey', 'Gabriel', 47),
    (555935, 'Alex', 'Manuel', 57),
    (539569, 'George', 'Mardy', 27),
    (733843, 'Mario', 'Saule', 63),
    (631548, 'Alan', 'Snappy', 27),
    (839139, 'Maria', 'Foster', 57);
    
SELECT DISTINCT EMP_LNAME
FROM emp_details;

/* 32. write a SQL query to find the details of employees whose last name is 'Snares'. Return emp_idno, emp_fname, emp_lname, and emp_dept. */
SELECT emp_idno, emp_fname, emp_lname, emp_dept
FROM emp_details
WHERE emp_lname = 'Snares';

/* 33. From the following table, write a SQL query to retrieve the details of the employees who work in the department 57. Return emp_idno, emp_fname, emp_lname and emp_dept.. */
SELECT emp_idno, emp_fname, emp_lname, emp_dept
FROM emp_details
WHERE EMP_DEPT = 57