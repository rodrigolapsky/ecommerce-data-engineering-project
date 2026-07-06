CREATE OR REPLACE TABLE `study-workspace-500319.project_ecommerce_silver.tb_customers` AS
SELECT
    NULLIF(TRIM(customer_id), '') AS customer_id,
    NULLIF(TRIM(customer_unique_id), '') AS customer_unique_id,
    customer_zip_code_prefix,
    NULLIF(TRIM(customer_city), '') AS customer_city,
    NULLIF(TRIM(customer_state), '') AS customer_state
FROM `study-workspace-500319.project_ecommerce_silver.tb_customers`
WHERE NOT (
    customer_id IS NULL
    AND customer_unique_id IS NULL
    AND customer_zip_code_prefix IS NULL
    AND customer_city IS NULL
    AND customer_state IS NULL)
