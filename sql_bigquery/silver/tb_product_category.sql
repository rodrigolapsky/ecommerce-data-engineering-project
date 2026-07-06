CREATE OR REPLACE TABLE `study-workspace-500319.project_ecommerce_silver.tb_product_category` AS
SELECT
    NULLIF(TRIM(string_field_0), '') AS string_field_0,
    NULLIF(TRIM(string_field_1), '') AS string_field_1
FROM `study-workspace-500319.project_ecommerce_silver.tb_product_category`
WHERE NOT (
    string_field_0 IS NULL
    AND string_field_1 IS NULL)
