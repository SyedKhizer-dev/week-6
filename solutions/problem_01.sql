USE sql_week01_assignment;

SELECT
    m.name
FROM
    employee_reports AS m
    INNER JOIN employee_reports AS e ON m.id = e.manager_id
GROUP BY
    m.id,
    m.name
HAVING
    COUNT(e.id) >= 5;