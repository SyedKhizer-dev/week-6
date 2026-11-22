USE sql_week01_assignment;

DROP PROCEDURE IF EXISTS getProductPrices;

DELIMITER //

CREATE PROCEDURE getProductPrices(IN target_date DATE)
BEGIN
    SELECT
        p.product_id,
        COALESCE(
            (
                SELECT pc.new_price
                FROM product_price_changes AS pc
                WHERE pc.product_id = p.product_id
                  AND pc.change_date <= target_date
                ORDER BY pc.change_date DESC
                LIMIT 1
            ),
            10
        ) AS price
    FROM (
        SELECT DISTINCT product_id
        FROM product_price_changes
    ) AS p;
END //

DELIMITER ;

CALL getProductPrices('2019-08-16');