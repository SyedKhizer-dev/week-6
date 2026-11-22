USE sql_week01_assignment;

INSERT INTO
    employee_reports (id, name, department, manager_id)
VALUES
    (101, 'John', 'A', NULL),
    (102, 'Dan', 'A', 101),
    (103, 'James', 'A', 101),
    (104, 'Amy', 'A', 101),
    (105, 'Anne', 'A', 101),
    (106, 'Ron', 'B', 101);

INSERT INTO
    employee_salaries (id, salary)
VALUES
    (1, 100),
    (2, 200),
    (3, 300);

INSERT INTO
    request_accepted (requester_id, accepter_id, accept_date)
VALUES
    (1, 2, '2016-06-03'),
    (1, 3, '2016-06-08'),
    (2, 3, '2016-06-08'),
    (3, 4, '2016-06-09');

INSERT INTO
    seat (id, student)
VALUES
    (1, 'Abbot'),
    (2, 'Doris'),
    (3, 'Emerson'),
    (4, 'Green'),
    (5, 'Jeames');

INSERT INTO
    product_catalog (product_key)
VALUES
    (5),
    (6);

INSERT INTO
    customer (customer_id, product_key)
VALUES
    (1, 5),
    (2, 6),
    (3, 5),
    (3, 6),
    (1, 6);

INSERT INTO
    users (user_id, join_date, favorite_brand)
VALUES
    (1, '2018-01-01', 'Lenovo'),
    (2, '2018-02-09', 'Samsung'),
    (3, '2018-01-19', 'LG'),
    (4, '2018-05-21', 'HP');

INSERT INTO
    items (item_id, item_brand)
VALUES
    (1, 'Samsung'),
    (2, 'Lenovo'),
    (3, 'LG'),
    (4, 'HP');

INSERT INTO
    orders (
        order_id,
        order_date,
        item_id,
        buyer_id,
        seller_id
    )
VALUES
    (1, '2019-08-01', 4, 1, 2),
    (2, '2018-08-02', 2, 1, 3),
    (3, '2019-08-03', 3, 2, 3),
    (4, '2018-08-04', 1, 4, 2),
    (5, '2018-08-04', 1, 3, 4),
    (6, '2019-08-05', 2, 2, 4);

INSERT INTO
    traffic (user_id, activity, activity_date)
VALUES
    (1, 'login', '2019-05-01'),
    (1, 'homepage', '2019-05-01'),
    (1, 'logout', '2019-05-01'),
    (2, 'login', '2019-06-21'),
    (2, 'logout', '2019-06-21'),
    (3, 'login', '2019-01-01'),
    (3, 'jobs', '2019-01-01'),
    (3, 'logout', '2019-01-01'),
    (4, 'login', '2019-06-21'),
    (4, 'groups', '2019-06-21'),
    (4, 'logout', '2019-06-21'),
    (5, 'login', '2019-03-01'),
    (5, 'logout', '2019-03-01'),
    (5, 'login', '2019-06-21'),
    (5, 'logout', '2019-06-21');

INSERT INTO
    product_price_changes (product_id, new_price, change_date)
VALUES
    (1, 20, '2019-08-14'),
    (2, 50, '2019-08-14'),
    (1, 30, '2019-08-15'),
    (1, 35, '2019-08-16'),
    (2, 65, '2019-08-17'),
    (3, 20, '2019-08-18');

INSERT INTO
    transactions (id, country, state, amount, trans_date)
VALUES
    (101, 'US', 'approved', 1000, '2019-05-18'),
    (102, 'US', 'declined', 2000, '2019-05-19'),
    (103, 'US', 'approved', 3000, '2019-06-10'),
    (104, 'US', 'declined', 4000, '2019-06-13'),
    (105, 'US', 'approved', 5000, '2019-06-15');

INSERT INTO
    chargebacks (trans_id, trans_date)
VALUES
    (102, '2019-05-29'),
    (101, '2019-06-30'),
    (105, '2019-09-18');

INSERT INTO
    teams (team_id, team_name)
VALUES
    (10, 'Leetcode FC'),
    (20, 'NewYork FC'),
    (30, 'Atlanta FC'),
    (40, 'Chicago FC'),
    (50, 'Toronto FC');

INSERT INTO
    matches (
        match_id,
        host_team,
        guest_team,
        host_goals,
        guest_goals
    )
VALUES
    (1, 10, 20, 3, 0),
    (2, 30, 10, 2, 2),
    (3, 10, 50, 5, 1),
    (4, 20, 30, 1, 0),
    (5, 50, 30, 1, 0);