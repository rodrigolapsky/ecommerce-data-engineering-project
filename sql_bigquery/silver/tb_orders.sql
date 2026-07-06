CREATE OR REPLACE TABLE `study-workspace-500319.project_ecommerce_silver.tb_orders` AS
SELECT
    NULLIF(TRIM(order_id), '') AS order_id,
    NULLIF(TRIM(customer_id), '') AS customer_id,
    NULLIF(TRIM(order_status), '') AS order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
FROM `study-workspace-500319.project_ecommerce_silver.tb_orders`
WHERE NOT (
    order_id IS NULL
    AND customer_id IS NULL
    AND order_status IS NULL
    AND order_purchase_timestamp IS NULL
    AND order_approved_at IS NULL
    AND order_delivered_carrier_date IS NULL
    AND order_delivered_customer_date IS NULL
    AND order_estimated_delivery_date IS NULL)
