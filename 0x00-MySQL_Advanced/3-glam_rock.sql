-- Task: List all bands with Glam rock as their main style, ranked by their longevity.
-- This script will run on Ubuntu 18.04 LTS using MySQL 5.7 (version 5.7.30).

/* Compute lifespan of each band and list those with Glam rock style, ordered by lifespan */
SELECT
    band_name,
    CASE
        WHEN split IS NULL THEN 2022 - formed
        ELSE split - formed
    END AS lifespan
FROM
    metal_bands
WHERE
    style = 'Glam rock'
ORDER BY
    lifespan DESC;
