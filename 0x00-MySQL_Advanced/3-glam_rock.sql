-- Task: List all bands with Glam rock as their main style, ranked by their longevity.
-- This script will run on Ubuntu 18.04 LTS using MySQL 5.7 (version 5.7.30).
/* Compute lifespan of each band and list those with Glam rock style, ordered by lifespan */

SELECT band_name,
    (IFNULL(split, 2022) - formed) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;