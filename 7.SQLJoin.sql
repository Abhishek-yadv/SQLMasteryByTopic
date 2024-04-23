/*********************************************/
/********************************************/
/************* SQL Join ********************/

/* 1.Write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.*/
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
# Answer 
SELECT Salesman.name, cust_name, customer.city
FROM Customer
JOIN Salesman
	ON Customer.city = Salesman.city;
    
/*2. write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city. */
SELECT ord_no, cust_name, customer.city
FROM Customer
JOIN Orders
	ON Customer.cust_id = Orders.customer_id
WHERE orders.purch_amt BETWEEN 500 AND 2000;

/*3. write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission. */
SELECT C.cust_name AS "Cusotmer",C.city, S.name AS "Salesman", S.commission
FROM Customer C
JOIN Salesman S
	ON C.salesman_id  = S.salesman_id;
    
/*4. write a SQL query to find salespeople who received commissions of more than 12 percent from the company.
 Return Customer Name, customer city, Salesman, commission. */
SELECT C.cust_name AS "Customer Name",
	   C.city,
       S.name AS "Salesman",
       S.commission
 FROM Customer C
 JOIN Salesman S
	ON C.salesman_id = S.salesman_id
WHERE S.commission > 0.12;
 
/*5. write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received
 a commission of more than 12% from the company, Return Customer Name, customer city, Salesman, salesman city, commission.*/
SELECT C.cust_name AS "Customer Name",
	   C.city,
       S.name AS "Salesman",
       S.commission
 FROM Customer C
 JOIN Salesman S
	ON C.salesman_id = S.salesman_id
WHERE S.commission > 0.12 AND C.city != S.City;
# Or WHERE S.commission > 0.12 AND C.city <> S.City; 

/* 6. write a SQL query to find the details of an order.
 Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission. */
SELECT O.ord_no, O.ord_date, O.purch_amt,
       C.cust_name AS "Customer Name", C.grade, 
       S.name AS "Salesman", S.commission 
FROM Customer C
JOIN Orders O
	ON C.cust_id = O.customer_id
JOIN Salesman S
	ON S.salesman_id = O.salesman_id;
    
# OR
SELECT O.ord_no, O.ord_date, O.purch_amt,
       C.cust_name AS "Customer Name", C.grade, 
       S.name AS "Salesman", S.commission 
FROM Orders O
JOIN Customer C
	ON C.cust_id = O.customer_id
JOIN Salesman S
	ON S.salesman_id = O.salesman_id;

# OR
SELECT * 
FROM Orders O
RIGHT JOIN Customer C
	ON C.cust_id = O.customer_id
RIGHT JOIN Salesman S
	ON S.salesman_id = O.salesman_id;
    
/* 7. Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table
 appears once and only the relational rows are returned. */
SELECT  *
FROM Orders O
NATURAL JOIN Customer C
NATURAL JOIN Salesman S;
    
/*8. write a SQL query to display the customer name, customer city, grade, salesman, salesman city.
 The results should be sorted by ascending customer_id. */
SELECT * 
FROM Customer C
JOIN Salesman S
	ON C.salesman_id = S.salesman_id
ORDER BY C.cust_id;
 
/*9.  write a SQL query to find those customers with a grade less than 300. Return cust_name,
 customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id. */
SELECT C.cust_name, C.city, C.grade, S.name, S.city
FROM Customer C
LEFT JOIN Salesman S
	ON C.salesman_id = S.salesman_id
WHERE C.grade < 300
ORDER BY C.cust_id;

/* 10. make a report with customer name, city, order number, order date, and order amount in ascending order
 according to the order date to determine whether any of the existing customers have placed an order or not.*/
SELECT a.cust_name, a.city, b.ord_no,
       b.ord_date, b.purch_amt AS "Order Amount" 
FROM customer a 
LEFT OUTER JOIN orders b 
ON a.customer_id = b.customer_id 
ORDER BY b.ord_date;

/* 11. SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name,
 and commission to determine if any of the existing customers have not placed orders or if they have placed orders 
 through their salesman or by themselves. */
SELECT a.cust_name, a.city, b.ord_no,
       b.ord_date, b.purch_amt AS "Order Amount", 
       c.name, c.commission 
FROM customer a 
LEFT OUTER JOIN orders b 
ON a.customer_id = b.customer_id 
LEFT OUTER JOIN salesman c 
ON c.salesman_id = b.salesman_id;
 
/* 12. Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers
 or have not yet joined any of the customers. */
SELECT a.cust_name, a.city, a.grade, 
       b.name AS "Salesman", b.city 
FROM customer a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id = a.salesman_id 
ORDER BY b.salesman_id;

/* 13.  write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount. Condition for selecting list of salesmen
 1. Salesmen who works for one or more customer or,
 2. Salesmen who not yet join under any customer, Condition for selecting list of customer,
 3. placed one or more orders,
 4. no order placed to their salesman. */
SELECT a.cust_name, a.city, a.grade, 
       b.name AS "Salesman", 
       c.ord_no, c.ord_date, c.purch_amt 
FROM customer a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id = a.salesman_id 
RIGHT OUTER JOIN orders c 
ON c.customer_id = a.customer_id;

/* 14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join
 any of the customer. The customer may have placed, either one or more orders on or above order amount 2000
 and must have a grade, or he may not have placed any order to the associated supplier. */
 SELECT a.cust_name, a.city, a.grade, 
       b.name AS "Salesman", 
       c.ord_no, c.ord_date, c.purch_amt 
FROM customer a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id = a.salesman_id 
LEFT OUTER JOIN orders c 
ON c.customer_id = a.customer_id
WHERE c.purch_amt > 2000 AND a.grade IS NOT NULL;

/* 15.For those customers from the existing list who put one or more orders, or which orders have been placed
 by the customer who is not on the list, create a report containing the customer name, city,
 order number, order date, and purchase amount */
SELECT a.cust_name, a.city, b.ord_no,
       b.ord_date, b.purch_amt AS "Order Amount" 
FROM customer a 
LEFT OUTER JOIN orders b 
ON a.customer_id = b.customer_id;

/* 16. Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list
 who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade. */
SELECT a.cust_name, a.city, b.ord_no,
       b.ord_date, b.purch_amt AS "Order Amount" 
FROM customer a 
LEFT OUTER JOIN orders b 
ON a.customer_id = b.customer_id
WHERE a.grade IS NOT NULL;
 
 /* 17.  Write a SQL query to combine each row of the salesman table with each row of the customer table. */
SELECT *
FROM Customer
CROSS JOIN Orders;

# Or 
SELECT *
FROM Customer
FULL JOIN Orders;
 
/* 18.  Write a SQL statement to create a Cartesian product between salesperson and customer,
 i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city. */
SELECT *
FROM Customer
CROSS JOIN Salesman
WHERE Salesman.city IS NOT NULL;

/* 19.  Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson
 will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade. */
SELECT *
FROM Customer
CROSS JOIN Salesman
WHERE Salesman.city IS NOT NULL
 AND Customer.grade IS NOT NULL;
 
/* 20. Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers
 and vice versa for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade. */
SELECT *
FROM Customer C
CROSS JOIN Salesman S
WHERE S.city <> C.City
AND C.city IS NOT NULL 
AND C.grade IS NOT NULL;

/* 21.From the following tables write a SQL query to select all rows from both participating tables as long as there is a match between pro_com and com_id.*/
-- Create Sample Table
-- Create the company_mast table
CREATE TABLE company_mast (
    COM_ID INT,
    COM_NAME VARCHAR(50)
);
INSERT INTO company_mast (COM_ID, COM_NAME) VALUES
    (11, 'Samsung'),
    (12, 'iBall'),
    (13, 'Epsion'),
    (14, 'Zebronics'),
    (15, 'Asus'),
    (16, 'Frontech');

-- item_mast table
CREATE TABLE item_mast (
    PRO_ID INT,
    PRO_NAME VARCHAR(50),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM INT
);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES
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
    
SELECT *
FROM company_mast C
JOIN item_mast I
	ON C.com_id = I.pro_com;

/* 22. Write a SQL query to display the item name, price, and company name of all the products.*/
SELECT I.pro_name, I.pro_price, C.com_name
FROM company_mast C
LEFT JOIN item_mast I
	ON C.com_id = I.pro_com;
    
/* 23. From the following tables write a SQL query to calculate the average price of items of each company. Return average value and company name. */
SELECT C.com_name, AVG(I.pro_price) AS price
FROM company_mast C
JOIN item_mast I
	ON C.com_id = I.pro_com
GROUP BY C.com_name;

/* 24. From the following tables write a SQL query to calculate and find the average price of items of each company
 higher than or equal to Rs. 350. Return average value and company name..*/
SELECT C.com_name, AVG(I.pro_price) AS price
FROM company_mast C
JOIN item_mast I
	ON C.com_id = I.pro_com
GROUP BY C.com_name
HAVING AVG(I.pro_price) > 350;

/* 25. From the following tables write a SQL query to find the most expensive product of each company.
 Return pro_name, pro_price and com_name. */
SELECT A.pro_name, A.pro_price, F.com_name
FROM item_mast A 
INNER JOIN company_mast F
ON A.pro_com = F.com_id
AND A.pro_price =
   (
     SELECT MAX(A.pro_price)
     FROM item_mast A
     WHERE A.pro_com = F.com_id
   );
   
/* 26. From the following tables write a SQL query to display all the data of employees including their department.*/
-- Creating Sample TABLE 
-- emp_department table
CREATE TABLE emp_department (
    DPT_CODE INT,
    DPT_NAME VARCHAR(50),
    DPT_ALLOTMENT DECIMAL(10, 2));
INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES
    (57, 'IT', 65000),
    (63, 'Finance', 15000),
    (47, 'HR', 240000),
    (27, 'RD', 55000),
    (89, 'QC', 75000);

-- Create the emp_details table
CREATE TABLE emp_details (
    EMP_IDNO INT,
    EMP_FNAME VARCHAR(50),
    EMP_LNAME VARCHAR(50),
    EMP_DEPT INT);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES
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

SELECT *
FROM emp_details ed
LEFT JOIN emp_department edprt
	on ed.EMP_DEPT = edprt.DPT_CODE;

/* 27. From the following tables write a SQL query to display the first and last names of each employee, as well as the department name and sanction amount.*/
SELECT ed.EMP_FNAME, ed.EMP_LNAME, edprt.DPT_NAME, edprt.DPT_ALLOTMENT
FROM emp_details ed
LEFT JOIN emp_department edprt
	on ed.EMP_DEPT = edprt.DPT_CODE;
    
/* 28. From the following tables write a SQL query to find the departments with budgets more than Rs. 50000 and display the first name and last name of employees. */
SELECT ed.EMP_FNAME, ed.EMP_LNAME, edprt.DPT_NAME, edprt.DPT_ALLOTMENT
FROM emp_details ed
JOIN emp_department edprt
	on ed.EMP_DEPT = edprt.DPT_CODE
WHERE edprt.DPT_ALLOTMENT > 50000;
    
/* 29.  From the following tables write a SQL query to find the names of departments where more than two employees are employed. Return dpt_name. */
SELECT emp_department.dpt_name
FROM emp_details 
INNER JOIN emp_department
ON emp_dept = dpt_code
GROUP BY emp_department.dpt_name
HAVING COUNT(*) > 2;

