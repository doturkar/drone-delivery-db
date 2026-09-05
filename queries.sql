-- 1) SELECT: "Show me every drone that is currently available"
SELECT drone_id, model, battery_pct, warehouse_id
FROM drones
WHERE status = 'available';

-- 2) SELECT with a JOIN: "Show me each order together with the
--    customer's name" (JOIN links two tables using customer_id)
SELECT orders.order_id, customers.name, orders.package_weight_kg, orders.status
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id;

-- 3) SELECT with a JOIN across 3 tables: full delivery history
SELECT
    deliveries.delivery_id,
    customers.name AS customer,
    drones.model AS drone_model,
    deliveries.distance_km,
    deliveries.flight_status
FROM deliveries
JOIN orders ON deliveries.order_id = orders.order_id
JOIN customers ON orders.customer_id = customers.customer_id
JOIN drones ON deliveries.drone_id = drones.drone_id;

-- 4) UPDATE: "Drone #3 finished charging -- mark it available again"
UPDATE drones
SET status = 'available', battery_pct = 100
WHERE drone_id = 3;

-- 5) UPDATE: "Order #2 just got delivered -- close out the flight"
UPDATE deliveries
SET delivery_time = '2026-08-30 14:35', flight_status = 'completed'
WHERE delivery_id = 2;

UPDATE orders
SET status = 'delivered'
WHERE order_id = 2;

-- 6) DELETE: "Customer Tom Nguyen cancelled order #4 -- remove it"
DELETE FROM orders
WHERE order_id = 4;

-- 7) SELECT: "Which warehouse has the most drones?"
SELECT warehouses.name, COUNT(drones.drone_id) AS drone_count
FROM warehouses
LEFT JOIN drones ON warehouses.warehouse_id = drones.warehouse_id
GROUP BY warehouses.name;