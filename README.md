SQL-Based Data Analysis for Business Insights
Introduction
This project provides a comprehensive demonstration of data analysis using SQL to extract actionable insights from a sample dataset. It follows a structured approach, starting from basic data exploration and profiling to advanced analytics techniques like performance analysis, customer segmentation, and time-series analysis. The ultimate goal is to create detailed, insightful reports that can inform strategic business decisions.
This repository is designed for anyone looking to understand the practical application of SQL in data analytics, from aspiring data analysts to seasoned professionals seeking to refine their analytical frameworks.
Table of Contents
Project Overview
Key Features
Technologies Used
Getting Started
Prerequisites
Installation
Project Structure
1. Database Exploration
2. Exploratory Data Analysis (EDA)
3. Advanced Analytics
Final Reports
Customer 360° Report
Product Performance Report
Contact
Project Overview
The project is divided into three main phases:
Data Warehousing & Setup: Preparing the data and database environment for analysis. This involves creating the database schema and importing the necessary data.
Exploratory Data Analysis (EDA): Understanding the fundamental characteristics of the dataset by identifying dimensions and measures, exploring unique values, and analyzing date ranges.
Advanced Analytics: Applying sophisticated SQL techniques to answer specific business questions. This includes analyzing trends, comparing performance, segmenting data, and creating comprehensive reports.
Key Features
Data Profiling: Initial analysis to understand the structure, content, and quality of the data.
Dimension & Measure Identification: A core framework for structuring analysis by categorizing data into descriptive attributes (dimensions) and quantifiable metrics (measures).
Time-Series Analysis: Tracking key metrics over time to identify trends, seasonality, and growth patterns.
Performance Analysis: Comparing key performance indicators (KPIs) against benchmarks like averages or previous periods (Year-over-Year).
Customer & Product Segmentation: Grouping customers and products into meaningful segments based on behavior and value.
Comprehensive Reporting: Consolidating all analyses into final, easy-to-consume views (Customer 360° Report and Product Performance Report).
Technologies Used
Database: Microsoft SQL Server
IDE: SQL Server Management Studio (SSMS)
Language: Transact-SQL (T-SQL)
Getting Started
Follow these instructions to get the project up and running on your local machine.
Prerequisites
Microsoft SQL Server (any edition, including Express)
SQL Server Management Studio (SSMS)
Installation
There are three ways to set up the database for this project:
Method 1: Using the Initialization Script (Recommended)
Download the project files and locate the init_database.sql script.
Open the script in SSMS.
Important: Modify the file paths within the script to match the location of the CSV data files on your local machine.
Ensure you are connected to the master database in SSMS.
Execute the entire script. This will create the DataWarehouseAnalytics database, the schema, tables, and import all the data.
Method 2: Manual Flat File Import
Create a new database in SSMS (e.g., DataWarehouseAnalytics).
Right-click on the new database, navigate to Tasks -> Import Flat File....
Follow the wizard to import each of the three CSV files (customers, products, sales) from the Gold tables folder.
Ensure you allow NULL values during the import process to avoid errors.
Method 3: Restoring from Backup
Locate the DataWarehouseAnalytics.bak file.
Copy this file to the Backup folder of your SQL Server instance. (e.g., C:\Program Files\Microsoft SQL Server\...\MSSQL\Backup\)
In SSMS, right-click on Databases and select Restore Database....
Select Device and locate the .bak file.
Click OK to restore the database.
Project Structure
The analysis is structured into a logical progression of steps, each building upon the last.
1. Database Exploration
The first step is to understand the database schema.
-- List all tables and views in the database
SELECT
    TABLE_CATALOG,
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES;

-- Explore the columns of a specific table (e.g., DimCustomer)
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    ORDINAL_POSITION
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'DimCustomer';


2. Exploratory Data Analysis (EDA)
This phase involves basic analysis to get a feel for the data.
Dimension Exploration: Identifying unique values in dimensional columns.
-- Find all unique product categories and subcategories
SELECT DISTINCT
    Category,
    Subcategory
FROM DimProduct
ORDER BY 1, 2;


Date Exploration: Understanding the time span of the data.
-- Find the first and last order dates
SELECT
    MIN(OrderDate) AS FirstOrderDate,
    MAX(OrderDate) AS LastOrderDate
FROM FactSales;


Measure Exploration: Calculating high-level aggregate metrics.
-- Calculate key business metrics
SELECT 'Total Revenue' AS MeasureName, SUM(SalesAmount) AS MeasureValue FROM FactSales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT OrderNumber) FROM FactSales
UNION ALL
SELECT 'Total Customers', COUNT(DISTINCT CustomerKey) FROM FactSales;


3. Advanced Analytics
Diving deeper to uncover more complex insights.
Change Over Time: Analyzing sales performance year over year.
-- Yearly sales performance
SELECT
    YEAR(OrderDate) AS OrderYear,
    SUM(SalesAmount) AS TotalSales,
    COUNT(DISTINCT CustomerKey) AS TotalCustomers
FROM FactSales
WHERE OrderDate IS NOT NULL
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;


Cumulative Analysis: Calculating running totals to track growth.
-- Calculate running total of sales over time
WITH MonthlySales AS (
    SELECT
        EOMONTH(OrderDate) AS MonthEnd,
        SUM(SalesAmount) AS TotalSales
    FROM FactSales
    GROUP BY EOMONTH(OrderDate)
)
SELECT
    MonthEnd,
    TotalSales,
    SUM(TotalSales) OVER (ORDER BY MonthEnd) AS RunningTotalSales
FROM MonthlySales;


Performance Analysis: Comparing yearly product sales to the average and the previous year.
-- Year-over-Year sales growth for a product
SELECT
    ProductName,
    OrderYear,
    CurrentSales,
    LAG(CurrentSales, 1, 0) OVER (PARTITION BY ProductName ORDER BY OrderYear) AS PreviousYearSales
FROM YearlyProductSales_CTE;


Data Segmentation: Grouping customers based on their spending behavior.
-- Segment customers into VIP, Regular, and New
CASE
    WHEN LifespanInMonths >= 12 AND TotalSpending > 5000 THEN 'VIP'
    WHEN LifespanInMonths >= 12 AND TotalSpending <= 5000 THEN 'Regular'
    ELSE 'New'
END AS CustomerSegment


Final Reports
The culmination of this project is two comprehensive views that provide a 360-degree perspective on customers and products.
Customer 360° Report
This report consolidates key customer metrics, including:
Demographics: Name, age, and derived age groups.
Aggregations: Total orders, total sales, total quantity, and number of unique products purchased.
Behavioral Segments: VIP, Regular, and New customer segments.
KPIs: Recency (months since last order), average order value, and average monthly spend.
Product Performance Report
This report provides deep insights into product performance, including:
Details: Product name, category, and subcategory.
Aggregations: Total orders, total sales, total quantity, and number of unique customers.
Performance Segments: High, Medium, and Low performers based on revenue.
KPIs: Average selling price, average order revenue, and average monthly revenue.
These reports are created as Views in the database (report_customers and report_products) for easy access by business intelligence tools or other analysts.
Contact
Your Name - [Your Email] - [Link to your LinkedIn profile]
Project Link: https://github.com/your_username/your_repository
