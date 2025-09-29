CREATE OR REPLACE TABLE kimia_farma.kf_dashboard AS
SELECT
    ft.transaction_id,
    ft.date,
    ft.branch_id,
    kc.branch_name,
    kc.kota,
    kc.provinsi,
    kc.rating as rating_cabang,
    ft.customer_name,
    ft.product_id,
    p.product_name,
    ft.price,
    ft.discount_percentage,
    ft.persentase_gross_laba,
    ft.nett_sales,
    ft.nett_profit,
    ft.rating as rating_transaction
FROM kimia_farma.kf_final_transaction_new ft
LEFT JOIN kimia_farma.kf_product p 
       ON ft.product_id = p.product_id
LEFT JOIN kimia_farma.kf_kantor_cabang kc 
       ON ft.branch_id = kc.branch_id
LEFT JOIN kimia_farma.kf_inventory inv
       ON ft.product_id = inv.product_id
      AND ft.branch_id = inv.branch_id;
