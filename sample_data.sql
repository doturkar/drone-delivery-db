-- Add 2 warehouses
INSERT INTO warehouses (name, city, capacity) VALUES
    ('San Jose Hub', 'San Jose', 20),
    ('Oakland Hub', 'Oakland', 15);

-- Add 4 customers
INSERT INTO customers (name, phone, address) VALUES
    ('Maria Chen', '408-555-0101', '123 Willow St, San Jose, CA'),
    ('James Patel', '408-555-0102', '456 Oak Ave, San Jose, CA'),
    ('Lena Ortiz', '510-555-0103', '789 Pine Rd, Oakland, CA'),
    ('Tom Nguyen', '510-555-0104', '321 Cedar Blvd, Oakland, CA');

-- Add 5 drones (3 at San Jose Hub, 2 at Oakland Hub)
INSERT INTO drones (model, max_payload_kg, battery_pct, status, warehouse_id) VALUES
    ('SkyHawk X2', 5.0, 100, 'available', 1),
    ('SkyHawk X2', 5.0, 82,  'available', 1),
    ('FalconLite', 2.5, 45,  'charging',  1),
    ('SkyHawk X2', 5.0, 100, 'available', 2),
    ('FalconLite', 2.5, 90,  'available', 2);

-- Add 4 orders
INSERT INTO orders (customer_id, warehouse_id, package_weight_kg, order_date, status) VALUES
    (1, 1, 1.2, '2026-08-28', 'delivered'),
    (2, 1, 3.4, '2026-08-30', 'dispatched'),
    (3, 2, 0.8, '2026-08-31', 'pending'),
    (4, 2, 2.0, '2026-08-31', 'pending');

-- Add 2 delivery flight records
INSERT INTO deliveries (order_id, drone_id, dispatch_time, delivery_time, distance_km, flight_status) VALUES
    (1, 1, '2026-08-28 09:00', '2026-08-28 09:22', 4.7, 'completed'),
    (2, 2, '2026-08-30 14:10', NULL, 6.1, 'in-flight');