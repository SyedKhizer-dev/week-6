
USE sql_week01_assignment;

DROP PROCEDURE IF EXISTS getNthHighestSalary;

DELIMITER //

CREATE PROCEDURE getNthHighestSalary(IN Nth INT)
BEGIN
    DECLARE offset_value INT;

    SET offset_value = Nth - 1;

    SELECT (
        SELECT DISTINCT salary
        FROM employee_salaries
        ORDER BY salary DESC
        LIMIT offset_value, 1
    ) AS getNthHighestSalary;

END //

DELIMITER ;

CALL getNthHighestSalary(2);
