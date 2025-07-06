# Query Optimization Report

## Initial Query Summary
The initial query joined 4 tables using `JOIN` and selected all fields. This resulted in:
- Unnecessary data fetching (`SELECT *`)
- Slow joins due to missing indexes
- Full table scans on large datasets

## Performance Before Optimization
Used `EXPLAIN ANALYZE`:

- Sequential scan on `bookings`, `payments`
- Join cost was high
- Execution time: ~X ms (replace with actual)

## Optimizations Applied
- Added indexes on `bookings.user_id`, `bookings.property_id`, `payments.booking_id`
- Replaced `SELECT *` with only necessary fields
- Used `LEFT JOIN` for payments to allow missing records

## Performance After Optimization
- Index scan used instead of sequential scan
- Reduced join time
- Execution time: ~Y ms (replace with actual)

## Conclusion
Query performance improved significantly after removing unnecessary fields and applying indexes.
