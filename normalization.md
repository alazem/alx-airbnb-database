# Airbnb Database Normalization to 3NF

## Step 1: First Normal Form (1NF)

To achieve 1NF, we ensured:
- Each table has a primary key.
- All values are atomic (no multiple values in a single field).
- No repeating groups.

✅ Example Fix:
The `address`, `city`, `state`, and `postal_code` in the Property table are already in atomic form. No need for splitting unless a full address string was previously stored in one field.

---

## Step 2: Second Normal Form (2NF)

2NF requires:
- The database is already in 1NF.
- No partial dependencies (non-key fields depending on part of a composite key).

✅ Example Fix:
In the `Booking` table, all attributes depend on the whole key (`booking_id`), so no partial dependency.

---

## Step 3: Third Normal Form (3NF)

3NF requires:
- The database is already in 2NF.
- No transitive dependencies (non-key attributes depending on other non-key attributes).

### 🔍 Identified Violations and Fixes:

### 1. **Property Table — Transitive Dependency**
- `city`, `state`, `postal_code`, `country` depend on `address`, not directly on `property_id`.

✅ **Fix:** Create a separate `Location` table.

```sql
CREATE TABLE Location (
    location_id UUID PRIMARY KEY,
    address VARCHAR NOT NULL,
    city VARCHAR NOT NULL,
    state VARCHAR NOT NULL,
    postal_code VARCHAR NOT NULL,
    country VARCHAR NOT NULL
);
