USE sql_assignment;

CREATE TABLE
    IF NOT EXISTS employee_reports (
        id INT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        department VARCHAR(100),
        manager_id INT,
        FOREIGN KEY (manager_id) REFERENCES employee_reports (id)
    );

CREATE TABLE
    IF NOT EXISTS employee_salaries (id INT PRIMARY KEY, salary INT NOT NULL);

CREATE TABLE
    IF NOT EXISTS request_accepted (
        requester_id INT NOT NULL,
        accepter_id INT NOT NULL,
        accept_date DATE NOT NULL,
        PRIMARY KEY (requester_id, accepter_id)
    );

CREATE TABLE
    IF NOT EXISTS seat (id INT PRIMARY KEY, student VARCHAR(100) NOT NULL);

CREATE TABLE
    IF NOT EXISTS product_catalog (product_key INT PRIMARY KEY);

CREATE TABLE
    IF NOT EXISTS customer (
        customer_id INT NOT NULL,
        product_key INT NOT NULL,
        FOREIGN KEY (product_key) REFERENCES product_catalog (product_key)
    );

CREATE TABLE
    IF NOT EXISTS users (
        user_id INT PRIMARY KEY,
        join_date DATE NOT NULL,
        favorite_brand VARCHAR(100)
    );

CREATE TABLE
    IF NOT EXISTS items (
        item_id INT PRIMARY KEY,
        item_brand VARCHAR(100) NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS orders (
        order_id INT PRIMARY KEY,
        order_date DATE NOT NULL,
        item_id INT NOT NULL,
        buyer_id INT NOT NULL,
        seller_id INT NOT NULL,
        FOREIGN KEY (item_id) REFERENCES items (item_id),
        FOREIGN KEY (buyer_id) REFERENCES users (user_id),
        FOREIGN KEY (seller_id) REFERENCES users (user_id)
    );

CREATE TABLE
    IF NOT EXISTS traffic (
        user_id INT NOT NULL,
        activity ENUM ('login', 'logout', 'jobs', 'groups', 'homepage') NOT NULL,
        activity_date DATE NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS product_price_changes (
        product_id INT NOT NULL,
        new_price INT NOT NULL,
        change_date DATE NOT NULL,
        PRIMARY KEY (product_id, change_date)
    );

CREATE TABLE
    IF NOT EXISTS transactions (
        id INT PRIMARY KEY,
        country VARCHAR(100),
        state ENUM ('approved', 'declined') NOT NULL,
        amount INT NOT NULL,
        trans_date DATE NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS chargebacks (
        trans_id INT NOT NULL,
        trans_date DATE NOT NULL,
        FOREIGN KEY (trans_id) REFERENCES transactions (id)
    );

CREATE TABLE
    IF NOT EXISTS teams (
        team_id INT PRIMARY KEY,
        team_name VARCHAR(100) NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS matches (
        match_id INT PRIMARY KEY,
        host_team INT NOT NULL,
        guest_team INT NOT NULL,
        host_goals INT NOT NULL,
        guest_goals INT NOT NULL,
        FOREIGN KEY (host_team) REFERENCES teams (team_id),
        FOREIGN KEY (guest_team) REFERENCES teams (team_id)
    );