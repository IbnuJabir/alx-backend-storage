-- 6-bonus.sql: Create a stored procedure AddBonus
-- This script creates a stored procedure to add a new correction for a student.

DELIMITER $$

CREATE PROCEDURE AddBonus(
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score INT
)
BEGIN
    DECLARE project_id INT;

    -- Select the project ID if the project already exists
    SELECT id INTO project_id
    FROM projects
    WHERE name = project_name;

    -- If the project does not exist, create it and get the new project ID
    IF project_id IS NULL THEN
        INSERT INTO projects(name) VALUES (project_name);
        SET project_id = LAST_INSERT_ID();
    END IF;

    -- Insert the correction into the corrections table
    INSERT INTO corrections(user_id, project_id, score) 
    VALUES (user_id, project_id, score);
END$$

DELIMITER ;
