CREATE OR REPLACE VIEW `fashionfusion-dwh.fashionfusion_dw.vw_sales_by_month` AS
SELECT
  d.year,
  d.month,
  SUM(f.line_amount) AS total_revenue,
  SUM(f.quantity)    AS total_quantity
FROM `fashionfusion-dwh.fashionfusion_dw.fact_sales` f
JOIN `fashionfusion-dwh.fashionfusion_dw.dim_date` d
  ON f.date_key = d.date_key
GROUP BY d.year, d.month
ORDER BY d.year, d.month;
