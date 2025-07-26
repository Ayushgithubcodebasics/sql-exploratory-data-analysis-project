# Advanced SQL Analytics Project

A comprehensive data analytics project demonstrating advanced SQL techniques for business intelligence and data exploration. This project transforms raw sales data into actionable insights through systematic analysis, covering everything from basic exploration to complex reporting.

**Key Achievement**: Built end-to-end analytical framework processing 60K+ transactions across 18K+ customers and 295 products.

## Project Architecture

```
SQL Analytics Framework
├──Data Warehousing Layer
├──Exploratory Data Analysis (EDA)
└──Advanced Analytics & Reporting
```

## Core Capabilities

### **Data Exploration & Profiling**
- Database structure analysis using information schema
- Dimension vs. Measure classification framework
- Data quality assessment and boundary analysis

### **Advanced Analytics Techniques**
- **Trend Analysis**: Time-series performance tracking
- **Cumulative Analysis**: Running totals and moving averages using window functions
- **Performance Comparison**: Year-over-year and period-over-period analysis
- **Customer Segmentation**: VIP/Regular/New customer classification
- **Revenue Distribution**: Part-to-whole analysis with percentage contributions

### **Business Intelligence Reporting**
- **Customer 360° Report**: Complete customer lifecycle analysis
- **Product Performance Dashboard**: Revenue and sales performance metrics
- **KPI Calculations**: Recency, Average Order Value, Monthly Spend Analytics

## Technical Skills Demonstrated

**SQL Techniques:**
- Complex JOINs and CTEs (Common Table Expressions)
- Advanced Window Functions (`ROW_NUMBER()`, `LAG()`, `LEAD()`)
- Aggregate Functions with custom business logic
- Date Functions and time-based calculations
- CASE WHEN statements for data segmentation
- Subqueries and derived tables

**Database Design:**
- Star schema implementation
- Fact and dimension table relationships
- View creation for reporting layers

## Key Business Insights Delivered

### Customer Analytics
- **18,083** active customers analyzed
- **Customer Segmentation**: 1,655 VIP, 2,332 Regular, 14,096 New customers
- **Geographic Distribution**: 6-country customer base analysis
- **Lifecycle Metrics**: Customer lifespan and recency analysis

### Product Performance  
- **295** products across 4 main categories analyzed
- **Revenue Concentration**: Bikes category dominates with 69% of total sales
- **Performance Segmentation**: High/Medium/Low performer classification
- **Price Analysis**: $486 average selling price identified

### Sales Intelligence
- **$29.4M** total revenue processed
- **60K+** items sold across **27K** unique orders
- **4-year** historical trend analysis (2010-2014)
- **Seasonal Patterns**: December peak sales identification

## Technologies Used

- **Database**: SQL Server
- **Query Language**: T-SQL
- **Development**: SQL Server Management Studio (SSMS)
- **Version Control**: Git

## Sample Query Showcase

**Customer Segmentation with Performance Metrics:**
```sql
WITH customer_metrics AS (
    SELECT 
        c.customer_key,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(s.sales_amount) AS total_spending,
        DATEDIFF(MONTH, MIN(s.order_date), MAX(s.order_date)) AS lifespan,
        COUNT(DISTINCT s.order_number) AS total_orders
    FROM fact_sales s
    LEFT JOIN dim_customers c ON s.customer_key = c.customer_key
    WHERE s.order_date IS NOT NULL
    GROUP BY c.customer_key, c.first_name, c.last_name
)
SELECT *,
    CASE 
        WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
        WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
        ELSE 'New'
    END AS customer_segment
FROM customer_metrics
ORDER BY total_spending DESC;
```

## Business Impact

This project demonstrates the ability to:
- Transform raw transactional data into strategic insights
- Identify revenue opportunities and customer patterns
- Create scalable reporting infrastructure
- Support data-driven decision making

## Quick Start

1. **Setup Database:**
   ```sql
   -- Run init_database.sql to create schema and load data
   ```

2. **Explore Data:**
   ```sql
   -- Execute exploratory_analysis.sql for initial insights
   ```

3. **Generate Reports:**
   ```sql
   SELECT * FROM gold.report_customers;
   SELECT * FROM gold.report_products;
   ```

## Results & Deliverables

- **2 Comprehensive Reports**: Customer 360° and Product Performance views
- **15+ KPIs**: Including recency, AOV, customer lifetime value
- **Multiple Segmentation Models**: Customer behavior and product performance
- **Trend Analysis**: Multi-year business performance insights
