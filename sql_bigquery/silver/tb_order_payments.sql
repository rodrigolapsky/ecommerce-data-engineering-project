CREATE OR REPLACE TABLE `study-workspace-500319.project_ecommerce_silver.tb_order_payments` AS
SELECT
    NULLIF(TRIM(order_id), '') AS order_id,
    payment_sequential,
    NULLIF(TRIM(payment_type), '') AS payment_type,
    payment_installments,
    payment_value
FROM `study-workspace-500319.project_ecommerce_silver.tb_order_payments`
WHERE NOT (
    order_id IS NULL
    AND payment_sequential IS NULL
    AND payment_type IS NULL
    AND payment_installments IS NULL
    AND payment_value IS NULL)
