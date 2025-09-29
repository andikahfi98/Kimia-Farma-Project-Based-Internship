CREATE OR REPLACE TABLE kimia_farma.kf_final_transaction_new AS
WITH base AS (
  SELECT
    *,
    CASE
      WHEN price <= 50000 THEN 0.10
      WHEN price > 50000 AND price <= 100000 THEN 0.15
      WHEN price > 100000 AND price <= 300000 THEN 0.20
      WHEN price > 300000 AND price <= 500000 THEN 0.25
      WHEN price > 500000 THEN 0.30
    END AS persentase_gross_laba,
    CAST(price * (1 - discount_percentage) AS INT64) AS nett_sales
  FROM kimia_farma.kf_final_transaction
)
SELECT
  *,
  CAST(nett_sales * persentase_gross_laba AS INT64) AS nett_profit
FROM base;