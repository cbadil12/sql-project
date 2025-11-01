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
    t1.region_name,
    t1.species_name,
    t1.num_observations
FROM (
    SELECT 
        r1.name AS region_name,
        s1.scientific_name AS species_name,
        COUNT(*) AS num_observations
    FROM observations AS o1
    INNER JOIN regions AS r1
        ON o1.region_id = r1.id
    INNER JOIN species AS s1
        ON o1.species_id = s1.id
    GROUP BY region_name, species_name
    ) AS t1
WHERE t1.num_observations = (
    SELECT MAX(t2.num_observations)
    FROM (
        SELECT 
            r2.name AS region_name,
            s2.scientific_name AS species_name,
            COUNT(*) AS num_observations
        FROM observations AS o2
        INNER JOIN regions AS r2
            ON o2.region_id = r2.id
        INNER JOIN species AS s2
            ON o2.species_id = s2.id
        GROUP BY region_name, species_name
    ) AS t2
    WHERE t2.region_name = t1.region_name
);

