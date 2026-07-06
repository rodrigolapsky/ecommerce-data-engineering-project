CREATE OR REPLACE TABLE `study-workspace-500319.project_ecommerce_silver.tb_geolocation` AS
SELECT
    geolocation_zip_code_prefix,
    geolocation_lat,
    geolocation_lng,
    NULLIF(TRIM(geolocation_city), '') AS geolocation_city,
    NULLIF(TRIM(geolocation_state), '') AS geolocation_state
FROM `study-workspace-500319.project_ecommerce_silver.tb_geolocation`
WHERE NOT (
    geolocation_zip_code_prefix IS NULL
    AND geolocation_lat IS NULL
    AND geolocation_lng IS NULL
    AND geolocation_city IS NULL
    AND geolocation_state IS NULL)
