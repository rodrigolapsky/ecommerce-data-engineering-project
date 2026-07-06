CREATE OR REPLACE VIEW `study-workspace-500319.project_ecommerce_gold.vw_customers` AS
SELECT
c.customer_id,
c.customer_unique_id,
c.customer_zip_code_prefix,
c.customer_city,
c.customer_state,
g.geolocation_lat,
g.geolocation_lng
FROM `study-workspace-500319.project_ecommerce_silver.tb_customers` c

LEFT JOIN `study-workspace-500319.project_ecommerce_silver.tb_geolocation` g
    ON c.customer_zip_code_prefix = g.geolocation_zip_code_prefix;
