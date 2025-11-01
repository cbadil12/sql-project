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
SELECT COUNT(DISTINCT species_id) AS num_diff_species
FROM observations;
-- 4. How many observations are there for the region with region_id = 2?;
SELECT COUNT(region_id) AS num_region_2_observations
FROM observations
WHERE region_id=2;
-- 5. How many observations were recorded on 1998-08-08?;
SELECT COUNT(observation_date) AS num_observations_recorded_on_1998_08_08
FROM observations
WHERE observation_date="1998-08-08";

-- Level 2 – Aggregation and ordering (GROUP BY, COUNT, ORDER BY, HAVING without JOIN);
-- 6. Which region_id has the most observations?;
SELECT region_id, COUNT(region_id) AS num_appeareances
FROM observations
GROUP BY region_id
ORDER BY num_appeareances DESC
LIMIT 1;
-- 7. What are the 5 most frequent species_id?;
SELECT species_id, COUNT(species_id) AS num_appeareances
FROM observations
GROUP BY species_id
ORDER BY num_appeareances DESC
LIMIT 5;
-- 8. Which species (species_id) have fewer than 5 records?;
SELECT species_id, COUNT(species_id) AS num_appeareances
FROM observations
GROUP BY species_id
HAVING num_appeareances < 5
ORDER BY num_appeareances DESC;
-- 9. Which observers (observer) recorded the most observations?;
SELECT observer, COUNT(observer) AS num_appeareances
FROM observations
GROUP BY observer
ORDER BY num_appeareances DESC
LIMIT 10;

-- MISSION 5
-- Your query here;


-- MISSION 6
-- Your query here;


-- MISSION 7
-- Your query here;


-- MISSION 8
-- Your query here;
