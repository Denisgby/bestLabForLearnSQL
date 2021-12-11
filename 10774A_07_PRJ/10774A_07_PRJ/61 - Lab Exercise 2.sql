---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 2
---------------------------------------------------------------------

USE TSQL2012;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Open the project file F:\10774A_Labs\10774A_07_PRJ\10774A_07_PRJ.ssmssln and the T-SQL script 61 - Lab Exercise 2.sql. Ensure that you are connected to the TSQL2012 database.
--
-- Write a SELECT statement to retrieve distinct values for the custid column from the Sales.Orders table. Filter the results to include only orders placed in February 2008.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 62 - Lab Exercise 2 - Task 1 Result.txt.
---------------------------------------------------------------------
select distinct custid
from sales.Orders
where year(orderdate) = '2008' and MONTH(orderdate)='2'

---------------------------------------------------------------------
-- Task 2
-- 
-- Write a SELECT statement with these columns:
--  Current date and time
--  First date of the current month
--  Last date of the current month
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 63 - Lab Exercise 2 - Task 2 Result.txt.
---------------------------------------------------------------------

select CURRENT_TIMESTAMP
select GETDATE()
select  cast (DATEADD (DAY, -DAY(current_timestamp)+1, current_timestamp) as date)
select 	EOMONTH(CURRENT_TIMESTAMP) AS endofmonth;
select  DATEADD (day, -day(GETDATE())+1, GETDATE() )
select -day(GETDATE())+1
---------------------------------------------------------------------
-- Task 3
-- 
-- Write a SELECT statement against the Sales.Orders table and retrieve the orderid, custid, and orderdate columns. Filter the results to include only orders placed in the last five days of the order month.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 64 - Lab Exercise 2 - Task 3 Result.txt.
---------------------------------------------------------------------

select o.orderid, o.custid, o.custid, o.orderdate
from sales.Orders o
where day(o.orderdate) between DAY(EOMONTH(o.orderdate))-4 AND DAY(EOMONTH(o.orderdate))

-----------or---------
SELECT 
	orderid, custid, orderdate
FROM Sales.Orders
WHERE 
	DATEDIFF(
		day,
		orderdate,
		EOMONTH(orderdate)  
	) < 5;
---------------------------------------------------------------------
-- Task 4
-- 
-- Write a SELECT statement against the Sales.Orders and Sales.OrderDetails tables and retrieve all the distinct values for the productid column. Filter the results to include only orders placed in the first 10 weeks of the year 2007.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 65 - Lab Exercise 2 - Task 4 Result.txt.
---------------------------------------------------------------------
select DISTINCT od.productid
from sales.orders o join Sales.OrderDetails od ON o.orderid=od.orderid
where DATEPART(week, orderdate) <= 10 
	  AND YEAR(orderdate) = 2007;

	  ---------------------------------------------------------------------

SELECT DISTINCT
	d.productid
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON d.orderid = o.orderid
WHERE 
	DATEPART(week, orderdate) <= 10 
	AND YEAR(orderdate) = 2007;