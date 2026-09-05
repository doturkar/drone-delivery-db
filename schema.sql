-- Turn on foreign key support (makes sure, for example, that a
-- delivery can't reference a drone that doesn't exist)
PRAGMA foreign_keys = ON;

-- TABLE 1: warehouses — the physical buildings where drones live
CREATE TABLE warehouses (
    warehouse_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name         TEXT NOT NULL,
    city         TEXT NOT NULL,
    capacity     INTEGER NOT NULL
);

-- TABLE 2: customers — the people placing orders
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT NOT NULL,
    phone       TEXT,
    address     TEXT NOT NULL
);

-- TABLE 3: drones — each drone belongs to one warehouse
CREATE TABLE drones (
    drone_id        INTEGER PRIMARY KEY AUTOINCREMENT,
    model           TEXT NOT NULL,
    max_payload_kg  REAL NOT NULL,
    battery_pct     INTEGER NOT NULL DEFAULT 100,
    status          TEXT NOT NULL DEFAULT 'available',
    warehouse_id    INTEGER NOT NULL,
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

-- TABLE 4: orders — linked to a customer and a warehouse
CREATE TABLE orders (
    order_id           INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id        INTEGER NOT NULL,
    warehouse_id       INTEGER NOT NULL,
    package_weight_kg  REAL NOT NULL,
    order_date         TEXT NOT NULL,
    status             TEXT NOT NULL DEFAULT 'pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

-- TABLE 5: deliveries — the flight record linking an order to a drone
CREATE TABLE deliveries (
    delivery_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id        INTEGER NOT NULL,
    drone_id        INTEGER NOT NULL,
    dispatch_time   TEXT,
    delivery_time   TEXT,
    distance_km     REAL,
    flight_status   TEXT NOT NULL DEFAULT 'in-flight',
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (drone_id) REFERENCES drones(drone_id)
);