-- Task: Rank country origins of bands by the number of non-unique fans.
-- This script will run on Ubuntu 18.04 LTS using MySQL 5.7 (version 5.7.30).

/* Aggregating the number of fans by country of origin and ordering by the number of fans */
SELECT origin, SUM(fans) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
