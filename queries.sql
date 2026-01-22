SELECT name FROM galaxy;

SELECT s.name AS star, g.name AS galaxy
FROM star s
JOIN galaxy g ON s.galaxy_id = g.galaxy_id;

SELECT p.name AS planet, COUNT(m.moon_id) AS moon_count
FROM planet p
LEFT JOIN moon m ON p.planet_id = m.planet_id
GROUP BY p.name;

