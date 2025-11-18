CREATE OR REPLACE TABLE `fashionfusion-dwh.fashionfusion_dw.dim_date` AS
SELECT DISTINCT
  DATE(InvoiceDate) AS date_value,
  FORMAT_DATE('%Y%m%d', DATE(InvoiceDate)) AS date_key,
  EXTRACT(YEAR FROM InvoiceDate) AS year,
  EXTRACT(MONTH FROM InvoiceDate) AS month,
  EXTRACT(DAY FROM InvoiceDate) AS day,
  EXTRACT(DAYOFWEEK FROM InvoiceDate) AS day_of_week,
  EXTRACT(QUARTER FROM InvoiceDate) AS quarter
FROM `fashionfusion-dwh.fashionfusion_raw.online_retail_clean`;
