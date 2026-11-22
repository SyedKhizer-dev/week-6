USE sql_week01_assignment;

SELECT
    customer_id
FROM
    customer
GROUP BY
    customer_id
HAVING
    COUNT(DISTINCT product_key) = (
        SELECT
            COUNT(*)
        FROM
            product_catalog
    );