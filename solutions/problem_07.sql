USE sql_week01_assignment;

DROP PROCEDURE IF EXISTS getFirstLoginCount;

DELIMITER //

CREATE PROCEDURE getFirstLoginCount(
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    WITH first_login AS (
        SELECT
            user_id,
            MIN(activity_date) AS login_date
        FROM traffic
        WHERE activity = 'login'
        GROUP BY user_id
    )
    SELECT
        login_date,
        COUNT(*) AS user_count
    FROM first_login
    WHERE login_date BETWEEN start_date AND end_date
    GROUP BY login_date;
END //

DELIMITER ;

CALL getFirstLoginCount('2019-04-01', '2019-06-30');