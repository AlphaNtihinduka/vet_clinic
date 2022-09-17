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

-- What animals belong to Melody Pond?
SELECT animals.name, owners.full_name
FROM animals JOIN owners ON animals.owner_id=owners.id
WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT owners.full_name, animals.name AS animal_name
FROM owners LEFT JOIN animals ON owners.id=animals.owner_id;

-- How many animals are there per species?
SELECT species.name, COUNT(*) AS species_number
FROM species JOIN animals ON species.id = animals.species_id
GROUP BY species.name;

-- - List all Digimon owned by Jennifer Orwell.
SELECT name AS digimon_animals, owners.full_name 
FROM (
    SELECT animals.name, animals.owner_id 
    FROM animals JOIN SPECIES ON species_id = species.id 
    WHERE species.name LIKE 'Digimon'
    ) AS digimonAnimals 
JOIN owners ON digimonAnimals.owner_id = owners.id 
WHERE owners.full_name LIKE 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name
FROM animals JOIN owners ON animals.owner_id=owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts<1;

-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) AS total_animals
from animals JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY total_animals DESC LIMIT 1;

SELECT animals.name, vets.name, visits.date_of_visit
FROM animals 
JOIN visits  ON animals.id = visits.animals_id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY date_of_visit DESC LIMIT 1;

SELECT vets.name, COUNT(animals.name) AS different_animals_seen_by_mendez
FROM animals 
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY vets.name;

SELECT vets.name AS VetNames, species.name AS specialization
FROM vets
LEFT JOIN specializations ON vets.id = specializations.vets_id
LEFT JOIN species ON species.id = specializations.species_id;

SELECT animals.name, COUNT(animals.name) as highest_visit
FROM animals
JOIN visits ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER by highest_visit DESC LIMIT 1;

SELECT animals.name AS animal_name, vets.name AS vet_name, visits.date_of_visit
FROM visits
JOIN vets ON visits.vets_id = vets.id
JOIN animals ON visits.animals_id = animals.id
WHERE vets.name = 'Maisy Smith'
ORDER BY date_of_visit LIMIT 1;

SELECT 
    animals.name,  
    animals.escape_attempts,
    animals.weight_kg,
    species.name,
    vets.name AS vet_name,
    visits.date_of_visit 
FROM visits
JOIN animals ON visits.animals_id = animals.id
JOIN vets ON visits.vets_id = vets.id
JOIN species ON species.id = animals.species_id
ORDER BY date_of_visit DESC LIMIT 1;

SELECT SUM(count) AS number_of_visits 
FROM (
SELECT COUNT(distinct visits.date_of_visit)
FROM visits
JOIN animals ON visits.animals_id = animals.id
LEFT JOIN specializations ON visits.vets_id = specializations.vets_id
WHERE animals.species_id <> specializations.species_id
UNION ALL
SELECT COUNT(visits.date_of_visit) FROM visits
JOIN animals ON visits.animals_id = animals.id
LEFT JOIN specializations ON visits.vets_id = specializations.vets_id
WHERE specializations.species_id ISNULL
) AS visitsTable

SELECT species.name AS species_name, COUNT(*)
FROM visits 
JOIN animals ON visits.animals_id = animals.id 
JOIN vets ON visits.vets_id = vets.id
JOIN species ON animals.species_id = species.id 
WHERE visits.vets_id = (SELECT id FROM vets WHERE name = 'Maisy Smith')
GROUP BY species.name;

