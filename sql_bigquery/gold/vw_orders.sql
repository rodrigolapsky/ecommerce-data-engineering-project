CREATE OR REPLACE VIEW `study-workspace-500319.project_ecommerce_gold.vw_orders` AS
SELECT
o.order_id,
o.customer_id,
o.order_status,
DATE(o.order_purchase_timestamp) AS order_date,
oi.product_id,
p.product_category_name,
oi.seller_id,
oi.price AS product_price,
oi.freight_value,
(oi.price + oi.freight_value) AS total_item_value,
pay.payment_value

FROM `study-workspace-500319.project_ecommerce_silver.tb_orders` o

LEFT JOIN `study-workspace-500319.project_ecommerce_silver.tb_order_itens` oi
ON o.order_id = oi.order_id

LEFT JOIN `study-workspace-500319.project_ecommerce_silver.tb_products` p
ON oi.product_id = p.product_id

LEFT JOIN (
  SELECT
        order_id,
        SUM(payment_value) AS payment_value
    FROM `study-workspace-500319.project_ecommerce_silver.tb_order_payments`
    GROUP BY order_id) pay
    ON o.order_id = pay.order_id
