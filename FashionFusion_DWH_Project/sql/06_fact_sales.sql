CREATE OR REPLACE TABLE `fashionfusion-dwh.fashionfusion_dw.fact_sales` AS
SELECT
  InvoiceNo AS invoice_no,
  FORMAT_DATE('%Y%m%d', DATE(InvoiceDate)) AS date_key,
  FARM_FINGERPRINT(StockCode) AS product_key,
  FARM_FINGERPRINT(CAST(CustomerID AS STRING)) AS customer_key,
  FARM_FINGERPRINT(Country) AS country_key,
  Quantity,
  UnitPrice,
  Quantity * UnitPrice AS line_amount
FROM `fashionfusion-dwh.fashionfusion_raw.online_retail_clean`;
