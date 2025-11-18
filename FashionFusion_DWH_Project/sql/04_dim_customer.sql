CREATE OR REPLACE TABLE `fashionfusion-dwh.fashionfusion_dw.dim_customer` AS
SELECT DISTINCT
  CustomerID AS customer_id,
  FARM_FINGERPRINT(CAST(CustomerID AS STRING)) AS customer_key
FROM `fashionfusion-dwh.fashionfusion_raw.online_retail_clean`;
