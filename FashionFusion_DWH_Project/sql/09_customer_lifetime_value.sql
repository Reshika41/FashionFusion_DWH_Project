CREATE OR REPLACE VIEW `fashionfusion-dwh.fashionfusion_dw.vw_customer_lifetime` AS
SELECT
  c.customer_id,
  COUNT(DISTINCT f.invoice_no) AS num_orders,
  SUM(f.line_amount)           AS lifetime_value
FROM `fashionfusion-dwh.fashionfusion_dw.fact_sales` f
JOIN `fashionfusion-dwh.fashionfusion_dw.dim_customer` c
  ON f.customer_key = c.customer_key
GROUP BY c.customer_id
ORDER BY lifetime_value DESC;
