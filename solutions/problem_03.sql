USE sql_week01_assignment;

WITH
    all_friends AS (
        SELECT
            requester_id AS person_id
        FROM
            request_accepted
        UNION ALL
        SELECT
            accepter_id AS person_id
        FROM
            request_accepted
    )
SELECT
    person_id,
    COUNT(*) as num
FROM
    all_friends
GROUP BY
    person_id
ORDER BY
    num DESC
LIMIT
    1;