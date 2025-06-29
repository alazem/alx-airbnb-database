# 🏠 Airbnb Database Schema (3NF)

This project defines a normalized relational database schema for an Airbnb-style platform. The schema is designed to efficiently store and manage data about users, properties, bookings, and related entities while ensuring data integrity and reducing redundancy through normalization (up to Third Normal Form - 3NF).

---

## 🎯 Objectives

- Apply normalization principles (1NF, 2NF, 3NF)
- Create SQL `CREATE TABLE` statements
- Set appropriate constraints (Primary Keys, Foreign Keys, Checks)
- Ensure optimal performance with indexes
- Maintain a scalable and maintainable database design

---

## 📚 Entities & Relationships

### 1. `UserRole`
Stores distinct user roles such as `guest`, `host`, and `admin`.

### 2. `Users`
Stores registered user data. Each user has a role and unique email.

### 3. `Location`
Represents normalized address components for property listings.

### 4. `Property`
Stores information about properties listed by hosts. Each property is linked to a location and owner (user).

### 5. `Booking`
Represents reservation records. Links users to properties with specific dates.

### 6. `Review` *(optional)*
Stores user feedback on completed bookings.

---

## 🧱 Database Normalization

- **1NF**: Atomic fields and unique rows
- **2NF**: No partial dependencies on composite keys
- **3NF**: No transitive dependencies (e.g., address info moved to `Location`)

Normalization helps:
- Eliminate redundant data
- Ensure referential integrity
- Improve consistency and scalability

---

## ⚙️ Technologies

- **Database:** PostgreSQL (with `gen_random_uuid()` for UUIDs)
- **SQL Standards:** ANSI SQL
- **Optional Extensions:** `pgcrypto` for UUID generation

---

## 🛠️ Setup Instructions

1. Ensure PostgreSQL is installed and running.
2. Enable `pgcrypto` for UUID support:
   ```sql
   CREATE EXTENSION IF NOT EXISTS "pgcrypto";
