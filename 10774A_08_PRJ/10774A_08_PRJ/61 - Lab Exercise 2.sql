---------------------------------------------------------------------
-- LAB 08
--
-- Exercise 2
---------------------------------------------------------------------

USE TSQL2012;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Open the project file F:\10774A_Labs\10774A_08_PRJ\10774A_08_PRJ.ssmssln and the T-SQL script 61 - Lab Exercise 2.sql. Ensure that you are connected to the TSQL2012 database.
--
-- Write a SELECT statement against the Sales.Customers table and retrieve the custid and contactname columns. Add a calculated column named segmentgroup using a logical function IIF with the value “Target group” for customers that are from Mexico and have in the contact title the value “Owner”. Use the value “Other” for the rest of the customers. 
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 62 - Lab Exercise 2 - Task 1 Result.txt.
---------------------------------------------------------------------
select *
from Sales.Customers

select custid, contactname, case when country= 'mexico' and contacttitle = 'owner' then 'targer group'
 else 'other'
 end
from Sales.Customers

select custid, contactname, IIF(country= N'Mexico' and contacttitle = N'owner' , 'Target group', N'Other') as tg
from Sales.Customers
---------------------------------------------------------------------
-- Task 2
-- 
-- Modify the T-SQL statement from task 1 to change the calculated column to show the value “Target group” for all customers without a missing value in the region attribute or with the value “Owner” in the contact title attribute.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 63 - Lab Exercise 2 - Task 2 Result.txt. 
---------------------------------------------------------------------

SELECT
	IIF(contacttitle = N'Owner' OR region IS NOT NULL, N'Target group', N'Other') AS segmentgroup,  custid,  contactname
FROM Sales.Customers;


---------------------------------------------------------------------
-- Task 3
-- 
-- Write a SELECT statement against the Sales.Customers table and retrieve the custid and contactname columns. Add a calculated column named segmentgroup using the logic function CHOOSE with four possible descriptions (“Group One”, “Group Two”, “Group Three”, “Group Four”). Use the modulo operator on the column custid. (Use the expression custid % 4 + 1 to determine the target group.)
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 64 - Lab Exercise 2 - Task 3 Result.txt.
---------------------------------------------------------------------

SELECT CHOOSE(custid % 4 + 1, N'Group One', N'Group Two', N'Group Three', N'Group Four') AS segmentgroup, custid, contactname
FROM Sales.Customers;