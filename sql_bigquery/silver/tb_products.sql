CREATE OR REPLACE TABLE `study-workspace-500319.project_ecommerce_silver.tb_products` AS
SELECT
    NULLIF(TRIM(product_id), '') AS product_id,
    NULLIF(TRIM(product_category_name), '') AS product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM `study-workspace-500319.project_ecommerce_silver.tb_products`
WHERE NOT (
    product_id IS NULL
    AND product_category_name IS NULL
    AND product_name_lenght IS NULL
    AND product_description_lenght IS NULL
    AND product_photos_qty IS NULL
    AND product_weight_g IS NULL
    AND product_length_cm IS NULL
    AND product_height_cm IS NULL
    AND product_width_cm IS NULL)
