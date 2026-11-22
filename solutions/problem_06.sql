USE sql_week01_assignment;

DROP PROCEDURE IF EXISTS getUserOrders;

DELIMITER //

CREATE PROCEDURE getUserOrders(IN target_year INT)
BEGIN
    SELECT
        u.user_id,
        u.join_date,
        COUNT(o.order_id) AS orders_in_year
    FROM users AS u
    LEFT JOIN orders AS o
        ON u.user_id = o.buyer_id
        AND YEAR(o.order_date) = target_year
    GROUP BY
        u.user_id,
        u.join_date;
END //

DELIMITER ;


CALL getUserOrders(2019);