CREATE OR REPLACE TABLE `study-workspace-500319.project_ecommerce_silver.tb_sellers` AS
SELECT
    NULLIF(TRIM(seller_id), '') AS seller_id,
    seller_zip_code_prefix,
    NULLIF(TRIM(seller_city), '') AS seller_city,
    NULLIF(TRIM(seller_state), '') AS seller_state
FROM `study-workspace-500319.project_ecommerce_silver.tb_sellers`
WHERE NOT (
    seller_id IS NULL
    AND seller_zip_code_prefix IS NULL
    AND seller_city IS NULL
    AND seller_state IS NULL)
