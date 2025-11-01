SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;

-- python src/app.py
;

-- Level 1 – Basic exploration (SELECT, LIMIT, DISTINCT, WHERE);
-- 1. What are the first 10 recorded observations?;
SELECT *
FROM observations
LIMIT 10;
-- 2. Which region identifiers (region_id) appear in the data?;
SELECT DISTINCT region_id AS unique_regions
FROM observations;
-- 3. How many distinct species (species_id) have been observed?;
SELECT DISTINCT COUNT(species_id) AS num_diff_species
FROM observations;
-- 4. How many observations are there for the region with region_id = 2?;
SELECT COUNT(region_id) AS num_region_2_observations
FROM observations
WHERE region_id=2;
-- 5. How many observations were recorded on 1998-08-08?;
SELECT COUNT(observation_date) AS num_observations_recorded_on_1998_08_08
FROM observations
WHERE observation_date="1998-08-08";

-- MISSION 4
-- Your query here;


-- MISSION 5
-- Your query here;


-- MISSION 6
-- Your query here;


-- MISSION 7
-- Your query here;


-- MISSION 8
-- Your query here;
