---------------------------------------------------------------------
-- LAB 04
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL2012;
GO

---------------------------------------------------------------------
-- Task 1
---------------------------------------------------------------------

SELECT
	C.contactname, C.contacttitle 
FROM Sales.Customers AS C;

---------------------------------------------------------------------
-- Task 2
---------------------------------------------------------------------

SELECT
	C.contactname AS Name, C.contacttitle AS Title, C.companyname AS [Company Name]
FROM Sales.Customers AS C;

---------------------------------------------------------------------
-- Task 3
---------------------------------------------------------------------

SELECT
	P.productname AS [Product Name]
FROM Production.Products AS P;

---------------------------------------------------------------------
-- Task 4
---------------------------------------------------------------------
SELECT 
	city, country
FROM Sales.Customers;
