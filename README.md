Universe Relational Database System
Overview

The Universe Relational Database System is a PostgreSQL database designed to model a simplified universe made up of galaxies, stars, planets, and moons. 
It demonstrates strong relational design, data integrity, and practical SQL development.

This project was completed as part of the freeCodeCamp Relational Database Certification, specifically the Celestial Bodies Database project.

Purpose of the Project

This project demonstrates the ability to:

Translate a real-world domain into a relational database model

Create normalized tables with clear relationships

Enforce data integrity using constraints

Export and restore a database using PostgreSQL tools

It also serves as a portfolio project showing backend and database fundamentals.

Database Design
Tables

The database contains five tables:

galaxy

star

planet

moon

galaxy_types

Each table uses an auto-incrementing primary key and includes meaningful attributes relevant to the entity it represents.

Relationships

Each star belongs to one galaxy

Each planet belongs to one star

Each moon belongs to one planet

galaxy_types classifies galaxy structures

All relationships are enforced using foreign key constraints.

Key Features

Auto-incrementing primary keys

Foreign key relationships between tables

UNIQUE constraints on name columns

NOT NULL constraints for required fields

Use of multiple data types:

INT

NUMERIC

TEXT

BOOLEAN

Fully reproducible SQL dump

Sample Data Included

The database includes sample data for immediate use:

6 galaxies

6 stars

12 planets

20 moons

3 galaxy types

File Included

universe.sql
A complete PostgreSQL dump containing:

Database creation

Table schemas

Constraints

Sequences

Sample data inserts

How to Use
Requirements

PostgreSQL installed

psql command line access

Restore the Database
psql -U postgres < universe.sql


This will drop any existing universe database, recreate it, create all tables, and insert the sample data.

Connect to the Database
psql --username=freecodecamp --dbname=postgres


Inside psql:

\c universe

Verify the Setup
\dt

SELECT COUNT(*) FROM galaxy;
SELECT COUNT(*) FROM star;
SELECT COUNT(*) FROM planet;
SELECT COUNT(*) FROM moon;
SELECT COUNT(*) FROM galaxy_types;

Example SQL Queries

Use these queries to explore the database.

1 List all galaxies
SELECT galaxy_id, name, galaxy_type, distance_from_earth
FROM galaxy
ORDER BY galaxy_id;

2 Show stars and the galaxy they belong to
SELECT s.name AS star, g.name AS galaxy
FROM star s
JOIN galaxy g ON s.galaxy_id = g.galaxy_id
ORDER BY g.name, s.name;

3 Show planets and their stars
SELECT p.name AS planet, s.name AS star
FROM planet p
JOIN star s ON p.star_id = s.star_id
ORDER BY s.name, p.name;

4 Show moons and their planets
SELECT m.name AS moon, p.name AS planet
FROM moon m
JOIN planet p ON m.planet_id = p.planet_id
ORDER BY p.name, m.name;

5 Count planets per star
SELECT s.name AS star, COUNT(p.planet_id) AS planet_count
FROM star s
LEFT JOIN planet p ON s.star_id = p.star_id
GROUP BY s.name
ORDER BY planet_count DESC, s.name;

6 Count moons per planet
SELECT p.name AS planet, COUNT(m.moon_id) AS moon_count
FROM planet p
LEFT JOIN moon m ON p.planet_id = m.planet_id
GROUP BY p.name
ORDER BY moon_count DESC, p.name;

7 Find planets that have life
SELECT name, planet_type, distance_from_star_au
FROM planet
WHERE has_life = TRUE;

8 List all spherical moons with radius
SELECT name, radius_km
FROM moon
WHERE is_spherical = TRUE
ORDER BY radius_km DESC;

9 Show all objects in the Milky Way
SELECT g.name AS galaxy, s.name AS star, p.name AS planet, m.name AS moon
FROM galaxy g
JOIN star s ON s.galaxy_id = g.galaxy_id
LEFT JOIN planet p ON p.star_id = s.star_id
LEFT JOIN moon m ON m.planet_id = p.planet_id
WHERE g.name = 'Milky Way'
ORDER BY s.name, p.name, m.name;

Skills Demonstrated

Relational database modeling

PostgreSQL schema design

SQL joins and constraints

Data normalization

Database export and restoration

Practical querying and reporting

Project Links

Repository
https://github.com/Wise222/rdb-alpha

Raw SQL dump
https://raw.githubusercontent.com/Wise222/rdb-alpha/master/universe.sql

Author

Wisdom Muke
