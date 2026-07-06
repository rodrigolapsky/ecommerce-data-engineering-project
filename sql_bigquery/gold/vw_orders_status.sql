CREATE OR REPLACE VIEW `study-workspace-500319.project_ecommerce_gold.vw_orders_status` AS
SELECT
o.order_id,
o.customer_id,
o.order_status,
DATE(o.order_purchase_timestamp) AS order_date,
DATE(o.order_approved_at) AS approved_date,
DATE(o.order_delivered_carrier_date) AS carrier_date,
DATE(o.order_delivered_customer_date) AS delivered_date,
DATE(o.order_estimated_delivery_date) AS estimated_delivery_date,
DATE_DIFF(DATE(o.order_delivered_customer_date), DATE(o.order_purchase_timestamp), DAY) AS delivery_days,

CASE 
WHEN o.order_delivered_customer_date IS NOT NULL
AND o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 'delayed'
ELSE 'on_time'
END AS late_delivery_flag
FROM `study-workspace-500319.project_ecommerce_silver.tb_orders` o
