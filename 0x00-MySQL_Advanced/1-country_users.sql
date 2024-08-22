-- Task: Create a table named 'users' with specific attributes, including an enumeration for 'country'.
-- This script will run on Ubuntu 18.04 LTS using MySQL 5.7 (version 5.7.30).

/* Creating the 'users' table if it doesn't already exist */
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,                   -- 'id' is the primary key, auto-incremented, and never null
    email VARCHAR(255) NOT NULL UNIQUE,               -- 'email' is a string, never null, and must be unique
    name VARCHAR(255),                                -- 'name' is a string with a maximum length of 255 characters
    country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US',  -- 'country' is an enumeration with a default value of 'US'
    PRIMARY KEY (id)                                  -- Setting 'id' as the primary key
);
