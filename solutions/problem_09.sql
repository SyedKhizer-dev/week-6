USE sql_week01_assignment;

WITH
    approved AS (
        SELECT
            DATE_FORMAT (trans_date, '%Y-%m') AS month,
            country,
            COUNT(*) AS approved_count,
            SUM(amount) AS approved_amount,
            0 AS chargeback_count,
            0 AS chargeback_amount
        FROM
            transactions
        WHERE
            state = 'approved'
        GROUP BY
            DATE_FORMAT (trans_date, '%Y-%m'),
            country
    ),
    chargeback_totals AS (
        SELECT
            DATE_FORMAT (c.trans_date, '%Y-%m') AS month,
            t.country,
            0 AS approved_count,
            0 AS approved_amount,
            COUNT(*) AS chargeback_count,
            SUM(t.amount) AS chargeback_amount
        FROM
            chargebacks AS c
            INNER JOIN transactions AS t ON c.trans_id = t.id
        GROUP BY
            DATE_FORMAT (c.trans_date, '%Y-%m'),
            t.country
    ),
    combined AS (
        SELECT
            *
        FROM
            approved
        UNION ALL
        SELECT
            *
        FROM
            chargeback_totals
    )
SELECT
    month,
    country,
    SUM(approved_count) AS approved_count,
    SUM(approved_amount) AS approved_amount,
    SUM(chargeback_count) AS chargeback_count,
    SUM(chargeback_amount) AS chargeback_amount
FROM
    combined
GROUP BY
    month,
    country
HAVING
    SUM(approved_count) <> 0
    OR SUM(approved_amount) <> 0
    OR SUM(chargeback_count) <> 0
    OR SUM(chargeback_amount) <> 0;