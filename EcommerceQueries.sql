/*
SQL and PowerBI - dashboard automation
*/


-- created table
USE AmazonEcommerce

IF OBJECT_ID('EcommerceData') IS NOT NULL DROP TABLE EcommerceData

CREATE TABLE EcommerceData
(
	Order_Date DATE,
	Time TIME,
	Aging FLOAT,
	Customer NUMERIC,
	Gender NVARCHAR (100),
	Device_Type NVARCHAR (100),
	Customer_Login_Type NVARCHAR (100),
	Product_Category NVARCHAR (100),
	Product NVARCHAR (100),
	Sales NUMERIC,
	Quantity NUMERIC,
	Discount FLOAT,
	Profit FLOAT,
	Shipping_Cost FLOAT,
	Order_Priority NVARCHAR (100),
	Payment_Method NVARCHAR (100),
);

-- importing the data 
BULK INSERT EcommerceData
FROM 'C:\Users\HOHOHAHA\Desktop\DA PROJECTS\AMAZON\Ecommerce_Dataset.csv'
WITH (FORMAT='CSV');

-- created views 
USE AmazonEcommerce
GO
CREATE VIEW Analysis AS
SELECT Order_Date, Product_Category, Product, Sales, Profit
FROM AmazonEcommerce..EcommerceData;


-- created stored procedure for automation
CREATE PROCEDURE Ecommerce_Dataset_Input_Monthly AS

IF OBJECT_ID('EcommerceData') IS NOT NULL DROP TABLE EcommerceData

CREATE TABLE EcommerceData
(
	Order_Date DATE,
	Time TIME,
	Aging FLOAT,
	Customer NUMERIC,
	Gender NVARCHAR (100),
	Device_Type NVARCHAR (100),
	Customer_Login_Type NVARCHAR (100),
	Product_Category NVARCHAR (100),
	Product NVARCHAR (100),
	Sales NUMERIC,
	Quantity NUMERIC,
	Discount FLOAT,
	Profit FLOAT,
	Shipping_Cost FLOAT,
	Order_Priority NVARCHAR (100),
	Payment_Method NVARCHAR (100),
)

BULK INSERT EcommerceData
FROM 'C:\Users\HOHOHAHA\Desktop\DA PROJECTS\AMAZON\Ecommerce_Dataset.csv'
WITH (FORMAT='CSV');

EXEC Ecommerce_Dataset_Input_Monthly

-- scheduled job from SQL Server Agent then connected to PowerBI

