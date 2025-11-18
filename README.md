# FashionFusion_DWH_Project
📊 FashionFusion Online Retail Analytics
BigQuery Data Warehouse + Power BI Dashboard (YouTube Dark Theme)

End-to-end business analytics project using real retail transaction data.

🚀 Project Overview

This project demonstrates a complete data analytics pipeline using:

Google BigQuery for data warehousing

SQL for data cleaning, modeling & transformations

Star Schema (Fact + Dimension tables)

Power BI (YouTube Dark Theme) for business insights

The objective is to analyze online retail transactions, design a clean cloud data warehouse, and deliver actionable insights about revenue trends, product performance, customer behavior, and country-wise sales.

📁 Repository Structure
FashionFusion_DWH_Project/
│
├── data/
│   └── online_retail_II.csv
│
├── sql/
│   ├── 01_create_clean_view.sql
│   ├── 02_dim_country.sql
│   ├── 03_dim_product.sql
│   ├── 04_dim_customer.sql
│   ├── 05_dim_date.sql
│   └── 06_fact_sales.sql
│   └── 07_view_sales_by_month
│   └── 08_view_top_products
│   └── 09_customer_lifetime_value
│
├── bi/
│   ├── FashionFusion_Dashboard.pbix
│   └── youtube-dark.json
│   ├── executive_overview.png
│   └── product_performance.png
│
└── README.md

🧱 Data Architecture
🔹 Source Layer (Raw Data)

Uploaded CSV (online_retail_II.csv) into BigQuery dataset:
fashionfusion_raw.online_retail_raw

Key columns:
Invoice, StockCode, Description, Quantity, InvoiceDate, Price, Customer ID, Country

🔹 Cleansed Layer (VIEW)
CREATE OR REPLACE VIEW `fashionfusion_raw.online_retail_clean` AS
SELECT
  Invoice       AS InvoiceNo,
  StockCode     AS StockCode,
  Description   AS Description,
  Quantity      AS Quantity,
  InvoiceDate   AS InvoiceDate,
  Price         AS UnitPrice,
  `Customer ID` AS CustomerID,
  Country       AS Country
FROM fashionfusion_raw.online_retail_raw
WHERE `Customer ID` IS NOT NULL
  AND Quantity > 0
  AND Price > 0;

🔹 Data Warehouse Layer — Star Schema

Dataset: fashionfusion_dw

⭐ Fact Table — fact_sales

Contains transactional records with keys:

invoice_no

date_key

product_key

customer_key

country_key

quantity

unit_price

line_amount (Quantity × UnitPrice)

⭐ Dimension Tables
dim_customer
CustomerID AS customer_id,
FARM_FINGERPRINT(CAST(CustomerID AS STRING)) AS customer_key

dim_product
StockCode AS stock_code,
Description AS description,
FARM_FINGERPRINT(StockCode) AS product_key

dim_country
Country AS country_name,
FARM_FINGERPRINT(Country) AS country_key

dim_date

Generated from InvoiceDate with fields:

year

month

day

quarter

day_of_week

date_key (YYYYMMDD)

🧠 Semantic Layer — DAX Measures
Total Revenue = SUM(fact_sales[line_amount])

Total Quantity = SUM(fact_sales[Quantity])

Total Orders = DISTINCTCOUNT(fact_sales[invoice_no])


🎨 Power BI Dashboard (YouTube Dark Theme)

A modern, YouTube-inspired dark dashboard featuring:

✔ Red accent colors
✔ Bold typography
✔ High-contrast visuals
✔ Clear business storytelling

📌 Dashboard Pages
1️⃣ Executive Sales Overview

Total Revenue

Total Units Sold

Total Orders

Monthly Revenue Trend

Quantity Trend

Customer Distribution by Country

Month Slicer

2️⃣ Product Performance

Top 10 Products by Revenue

Product Revenue Table

Revenue Share Treemap

📉 Key Insights
💰The analysis reveals a high-volume international retail business generating more than $17M in revenue, with strong mid-year demand and consistent sales volume. However, revenue declines over time, signaling potential supply chain, marketing, or pricing challenges. A small set of top products drives the majority of revenue, highlighting a clear 80/20 pattern. The business benefits from a broad global customer base, opening opportunities for targeted promotions and geographic expansion.


🛠️ Tech Stack
Layer	Tool
Data Warehouse	Google BigQuery
ETL / Cleaning	BigQuery SQL
Data Modeling	Star Schema
Visualization	Power BI Desktop
Theme	Custom YouTube Dark JSON
Languages	SQL, DAX
🔗 How to Run This Project
1️⃣ Clone the repo
git clone https://github.com/username/FashionFusion_DWH.git

2️⃣ Load dataset into BigQuery

Upload → Create table → online_retail_raw

3️⃣ Run all SQL scripts

Creates:
✔ Clean View
✔ Dimension tables
✔ Fact table

4️⃣ Open the Power BI file

FashionFusion_Dashboard.pbix
Reconnect BigQuery credentials → dashboard loads instantly.

🧾 License

MIT License (free to use/share)

⭐ Final Notes

This project showcases strong skills in:

ETL / ELT

Cloud Data Warehousing

Power BI design

Data modeling

Dashboard storytelling

A complete, production-quality analytics project for your portfolio.
