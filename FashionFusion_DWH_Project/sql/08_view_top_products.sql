CREATE OR REPLACE VIEW `fashionfusion-dwh.fashionfusion_dw.vw_top_products` AS
SELECT
  p.stock_code,
  p.description,
  SUM(f.line_amount) AS revenue,
  SUM(f.quantity)    AS qty_sold
FROM `fashionfusion-dwh.fashionfusion_dw.fact_sales` f
JOIN `fashionfusion-dwh.fashionfusion_dw.dim_product` p
  ON f.product_key = p.product_key
GROUP BY p.stock_code, p.description
ORDER BY revenue DESC
LIMIT 10;
