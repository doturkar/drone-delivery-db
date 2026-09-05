# Drone Delivery Logistics Database

A small relational database that models a drone delivery company —
warehouses, drones, customers, orders, and deliveries. Built to
practice core relational database concepts: schema design, DDL
(building tables), and DML (inserting, querying, updating, and
deleting data).

## What is this project?

This project models a mini drone delivery company (like a small Amazon
Prime Air), tracking warehouses, drones, customers, orders, and delivery
flights in a relational database built with SQLite.

## Files

- `schema.sql` — DDL: builds the 5 tables and their relationships
- `sample_data.sql` — DML: inserts sample rows into every table
- `queries.sql` — DML: SELECT, JOIN, UPDATE, DELETE, and GROUP BY examples
- `drone_delivery.db` — the actual database file, generated from the scripts above

## How to run it

```bash
python3 -c "
import sqlite3
conn = sqlite3.connect('drone_delivery.db')
conn.executescript(open('schema.sql').read())
conn.executescript(open('sample_data.sql').read())
conn.executescript(open('queries.sql').read())
conn.commit()
print('Done!')
"
```

## Concepts demonstrated

- Relational schema design (primary keys, foreign keys)
- DDL: `CREATE TABLE`
- DML: `INSERT`, `SELECT`, `JOIN`, `UPDATE`, `DELETE`, `GROUP BY`
