CREATE OR REPLACE VIEW `study-workspace-500319.project_ecommerce_gold.vw_products` AS
SELECT
p.product_id,
p.product_category_name AS category_name_pt,
pc.string_field_1 AS category_name_en,
p.product_name_lenght,    
p.product_description_lenght, 
p.product_photos_qty,
p.product_weight_g,
p.product_length_cm,
p.product_height_cm,
p.product_width_cm

FROM `study-workspace-500319.project_ecommerce_silver.tb_products` p

LEFT JOIN `study-workspace-500319.project_ecommerce_silver.tb_product_category` pc
ON p.product_category_name = pc.string_field_0;
