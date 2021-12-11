---------------------------------------------------------------------
-- LAB 05
--
-- Exercise 2
---------------------------------------------------------------------

USE TSQL2012;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Open the project file F:\10774A_Labs\10774A_05_PRJ\10774A_05_PRJ.ssmssln and the T-SQL script 61 - Lab Exercise 2.sql. Ensure that you are connected to the TSQL2012 database.
--
-- The developer has written this query.
--
-- Execute the query exactly as written inside a query window and observe the result.
--
-- You get an error. What is the error message? Why do you think you got this error? 
---------------------------------------------------------------------

SELECT 
	Customers.custid, contactname, orderid
FROM Sales.Customers  
INNER JOIN Sales.Orders ON Customers.custid = Orders.custid;




---------------------------------------------------------------------
-- Task 2
-- 
-- Notice that there are full source table names written as table aliases. 
--
-- Apply the needed changes to the SELECT statement so that it will run without an error. Test the changes by executing the T-SQL statement.
--
-- Observe and compare the results that you got with the recommended result shown in the file 62 - Lab Exercise 2 - Task 2 Result.txt. 
---------------------------------------------------------------------

SELECT 
	Customers.custid, contactname, orderid
FROM Sales.Customers  
INNER JOIN Sales.Orders ON Customers.custid = Orders.custid;


---------------------------------------------------------------------
-- Task 3
-- 
-- Copy the T-SQL statement from task 2 and modify it to use the table aliases �C� for the Sales.Custumers table and �O� for the Sales.Orders table.
--
-- Execute the written statement and compare the results with the results in task 2.
--
-- Change the prefix of the columns in the SELECT statement with full source table names and execute the statement.
--
-- You get an error. Why?
--
-- Change the SELECT statement to use the table aliases written at the beginning of the task.
---------------------------------------------------------------------


SELECT 
	c.custid, contactname, orderid
FROM Sales.Customers c
INNER JOIN Sales.Orders o ON c.custid = o.custid;


---------------------------------------------------------------------
-- Task 4
-- 
-- Copy the T-SQL statement from task 3 and modify it to include three additional columns from the Sales.OrderDetails table: productid, qty, and unitprice.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 63 - Lab Exercise 2 - Task 4 Result.txt. 
---------------------------------------------------------------------


SELECT 
	c.custid, c.contactname, o.orderid, od.productid, od.qty, od.unitprice
FROM Sales.Customers c
INNER JOIN Sales.Orders o ON c.custid = o.custid
inner JOIN sales.OrderDetails od ON od.orderid=o.orderid
