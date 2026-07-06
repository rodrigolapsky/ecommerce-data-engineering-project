CREATE OR REPLACE TABLE `study-workspace-500319.project_ecommerce_silver.tb_order_items` AS
SELECT
    NULLIF(TRIM(order_id), '') AS order_id,
    order_item_id,
    NULLIF(TRIM(product_id), '') AS product_id,
    NULLIF(TRIM(seller_id), '') AS seller_id,
    shipping_limit_date,
    price,
    freight_value
FROM `study-workspace-500319.project_ecommerce_silver.tb_order_items`
WHERE NOT (
    order_id IS NULL
    AND order_item_id IS NULL
    AND product_id IS NULL
    AND seller_id IS NULL
    AND shipping_limit_date IS NULL
    AND price IS NULL
    AND freight_value IS NULL)
