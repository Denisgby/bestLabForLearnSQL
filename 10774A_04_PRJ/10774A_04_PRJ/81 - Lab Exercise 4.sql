---------------------------------------------------------------------
-- LAB 04
--
-- Exercise 4
---------------------------------------------------------------------

USE TSQL2012;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Open the project file F:\10774A_Labs\10774A_04_PRJ\10774A_04_PRJ.ssmssln and T-SQL script 81 - Lab Exercise 4.sql. Ensure that you are connected to the TSQL2012 database.
--
-- Write a SELECT statement to display the categoryid and productname columns from the Production.Products table.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 82 - Lab Exercise 4 - Task 1 Result.txt.
---------------------------------------------------------------------

select p.categoryid, p.productname
from Production.Products p


---------------------------------------------------------------------
-- Task 2
-- 
-- Enhance the SELECT statement in task 1 by adding a CASE expression that generates a result column named categoryname. The new column should hold the translation of the category ID to its respective category name based on the mapping table supplied earlier. Use the value “Other” for any category IDs not found in the mapping table. 
--
-- Execute the written statement and compare the result that you got with the desired output shown in the file 83 - Lab Exercise 4 - Task 2 Result.txt.
---------------------------------------------------------------------


SELECT
	P.categoryid, P.productname,
	CASE P.categoryid
		WHEN 1 THEN 'Beverages'
		WHEN 2 THEN 'Condiments'
		WHEN 3 THEN 'Confections'
		WHEN 4 THEN 'Dairy Products'
		WHEN 5 THEN 'Grains/Cereals'
		WHEN 6 THEN 'Meat/Poultry'
		WHEN 7 THEN 'Produce'
		WHEN 8 THEN 'Seafood'
		ELSE 'Other'
	END AS categoryname
FROM Production.Products AS P;

---------------------------------------------------------------------
-- Task 3
-- 
-- Modify the SELECT statement in task 2 by adding a new column named iscampaign. This column will show the description “Campaign Products” for the categories Beverages, Produce, and Seafood and the description “Non-Campaign Products” for all other categories.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 84 - Lab Exercise 4 - Task 3 Result.txt.
---------------------------------------------------------------------


SELECT
	P.categoryid, P.productname,

	CASE P.categoryid
		WHEN 1 THEN 'Beverages'
		WHEN 2 THEN 'Condiments'
		WHEN 3 THEN 'Confections'
		WHEN 4 THEN 'Dairy Products'
		WHEN 5 THEN 'Grains/Cereals'
		WHEN 6 THEN 'Meat/Poultry'
		WHEN 7 THEN 'Produce'
		WHEN 8 THEN 'Seafood'
		ELSE 'Other'
	END AS categoryname,
		CASE P.categoryid
		WHEN 1 THEN 'Campaign Products'
		WHEN 7 THEN 'Campaign Products'
		WHEN 8 THEN 'Campaign Products'
		ELSE 'Non-Campaign Products'
	END AS iscampaign
FROM Production.Products AS P;
