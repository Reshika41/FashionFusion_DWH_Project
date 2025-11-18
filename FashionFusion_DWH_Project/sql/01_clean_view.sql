CREATE OR REPLACE VIEW `fashionfusion-dwh.fashionfusion_raw.online_retail_clean` AS
SELECT
  InvoiceNo AS invoice_no,
  StockCode,
  Description,
  Quantity,
  InvoiceDate,
  Price AS UnitPrice,
  `Customer ID` AS CustomerID,
  Country
FROM `fashionfusion-dwh.fashionfusion_raw.online_retail_raw`
WHERE `Customer ID` IS NOT NULL
  AND Quantity > 0
  AND Price > 0;
