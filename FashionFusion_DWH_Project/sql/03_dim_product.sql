CREATE OR REPLACE TABLE `fashionfusion-dwh.fashionfusion_dw.dim_product` AS
SELECT DISTINCT
  StockCode AS stock_code,
  Description AS description,
  FARM_FINGERPRINT(StockCode) AS product_key
FROM `fashionfusion-dwh.fashionfusion_raw.online_retail_clean`;
