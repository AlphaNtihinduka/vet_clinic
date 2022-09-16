/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
-- Find all animals whose name ends in "mon".
SELECT * from animals
WHERE name like '%mon';
-- List the name of all animals born between 2016 and 2019.
SELECT name from animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';


-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name from animals
WHERE neutered = TRUE AND escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth from animals
WHERE  name = 'Agumon' OR name = 'Pikachu';

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts from animals
WHERE  weight_kg > 10.5;

-- Find all animals that are neutered.
SELECT * from animals
WHERE  neutered = TRUE;

-- Find all animals not named Gabumon.
SELECT * from animals
WHERE  name != 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * from animals
WHERE weight_kg <= 17.3 AND weight_kg >= 10.4;

-- unspecified to species column
BEGIN TRANSACTION;
UPDATE animals
SET species='unspecified';

-- Set species to digimon
BEGIN TRANSACTION;
UPDATE animals
SET species='digimon'
WHERE name LIKE '%mon';

-- Set species to pokemon
BEGIN TRANSACTION;
UPDATE animals
SET species='pokemon'
WHERE species ISNULL;
COMMIT TRANSACTION;

-- Deleting all records from animals
BEGIN TRANSACTION;
DELETE FROM animals;

ROLLBACK;

-- Deleting and set SAVEPOINT
BEGIN TRANSACTION;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT savepoint1;

ROLLBACK TO savepoint1;
UPDATE animals SET weight_kg= weight_kg * -1
WHERE weight_kg < 0;
COMMIT TRANSACTION;

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals that never escaped?
SELECT COUNT(*) FROM animals
WHERE escape_attempts=0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered?
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MAX(weight_kg), MIN(weight_kg) 
FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) 
FROM animals WHERE date_of_birth 
BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

