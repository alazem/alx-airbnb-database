-- Enable pgcrypto for UUID generation
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ================================
-- 1. User Roles
-- ================================
INSERT INTO UserRole (role_name) VALUES
('guest'),
('host'),
('admin');

-- ================================
-- 2. Users
-- ================================
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role_id)
VALUES
(gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '1234567890', 1),
(gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '0987654321', 2),
(gen_random_uuid(), 'Admin', 'User', 'admin@example.com', 'hashed_pw3', NULL, 3);

-- ================================
-- 3. Locations
-- ================================
INSERT INTO Location (location_id, address, city, state, postal_code, country)
VALUES
(gen_random_uuid(), '123 Maple St', 'Seattle', 'WA', '98101', 'USA'),
(gen_random_uuid(), '456 Oak Ave', 'San Francisco', 'CA', '94105', 'USA');

-- ================================
-- 4. Properties
-- ================================
-- Use real UUIDs from above or hardcoded sample ones for demonstration
-- Note: Replace location_id and user_id with actual IDs from selects
INSERT INTO Property (property_id, user_id, location_id, title, description, price_per_night, property_type)
VALUES
(gen_random_uuid(),
 (SELECT user_id FROM Users WHERE email = 'bob@example.com'),
 (SELECT location_id FROM Location WHERE city = 'Seattle'),
 'Modern Apartment Downtown',
 'Cozy 2-bedroom apartment in the heart of the city.',
 120.00, 'Apartment'),

(gen_random_uuid(),
 (SELECT user_id FROM Users WHERE email = 'bob@example.com'),
 (SELECT location_id FROM Location WHERE city = 'San Francisco'),
 'Charming Cottage',
 'Quiet and lovely cottage with garden.',
 90.00, 'Cottage');

-- ================================
-- 5. Bookings
-- ================================
-- Replace property_id and user_id with values from inserted records
INSERT INTO Booking (booking_id, user_id, property_id, start_date, end_date, total_price, payment_status)
VALUES
(gen_random_uuid(),
 (SELECT user_id FROM Users WHERE email = 'alice@example.com'),
 (SELECT property_id FROM Property WHERE title = 'Modern Apartment Downtown'),
 '2025-07-10', '2025-07-15', 600.00, 'paid'),

(gen_random_uuid(),
 (SELECT user_id FROM Users WHERE email = 'alice@example.com'),
 (SELECT property_id FROM Property WHERE title = 'Charming Cottage'),
 '2025-08-01', '2025-08-04', 270.00, 'pending');

-- ================================
-- 6. Reviews (Optional)
-- ================================
INSERT INTO Review (review_id, booking_id, user_id, rating, comment)
VALUES
(gen_random_uuid(),
 (SELECT booking_id FROM Booking WHERE total_price = 600.00),
 (SELECT user_id FROM Users WHERE email = 'alice@example.com'),
 5, 'Fantastic stay, very clean and comfortable!'),

(gen_random_uuid(),
 (SELECT booking_id FROM Booking WHERE total_price = 270.00),
 (SELECT user_id FROM Users WHERE email = 'alice@example.com'),
 4, 'Nice place, but could use better wifi.');
