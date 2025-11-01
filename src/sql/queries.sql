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

-- Level 3 – Relationships between tables (JOIN);
-- 10. Show the region name (regions.name) for each observation;
SELECT 
    obs.id AS obs_id,
    species_id,
    region_id,
    reg.name,
    observer,
    observation_date,
    latitude,
    longitude,
    count
FROM observations AS obs
INNER JOIN regions AS reg
    ON obs.region_id = reg.id;
-- 11. Show the scientific name of each recorded species (species.scientific_name);
SELECT 
    obs.id AS obs_id,
    species_id,
    scientific_name,
    region_id,
    observer,
    observation_date,
    latitude,
    longitude,
    count
FROM observations AS obs
INNER JOIN species AS esp
    ON obs.species_id = esp.id;

-- 12. Which is the most observed species in each region?;
SELECT 
    r.name AS region_name,
    s.scientific_name AS species_name,
    COUNT(*) AS total_count
FROM observations AS o
INNER JOIN species AS s
    ON o.species_id = s.id
INNER JOIN regions As r
    ON o.region_id = r.id
GROUP BY region_name, species_name
ORDER BY region_name, total_count DESC;

-- Level 4 (optional) – Data manipulation;
-- 13.Insert a new fictitious observation into the `observations` table;
INSERT INTO observations
    (species_id, region_id, observer, observation_date, count)
VALUES (25, 8, 'Carlitos', '2025-11-01', 1);
-- 14. Correct the scientific name of a species with a typo;
UPDATE species
SET species.scientific_name="Carlitos Maximus"
WHERE species.scienfic_name="Carlitos MinimusSss"
-- 15. Delete a test observation (use its `id`);
DELETE FROM observations
WHERE id = 55;
