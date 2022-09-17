/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');
INSERT INTO animals VALUES(01, 'Agumon', '2020-02-03', 1, TRUE, 10.23);
INSERT INTO animals VALUES(02, 'Gabumon', '2018-11-15', 2, TRUE, 8.00);
INSERT INTO animals VALUES(03, 'Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals VALUES(04, 'Devimon', '2017-05-12', 5, TRUE, 11.00);
INSERT INTO animals VALUES(5, 'Chamander', '2020-02-08', 0, FALSE, -11.00);
INSERT INTO animals VALUES(6, 'Plantmon', '2021-11-15', 2, TRUE, -5.70);
INSERT INTO animals VALUES(7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals VALUES(8, 'Angemon', '2005-06-12', 1, TRUE, -45);
INSERT INTO animals VALUES(9, 'Boarmon', '2005-06-07', 7, TRUE, 20.40);
INSERT INTO animals VALUES(10, 'Blossom', '1998-10-13', 3, TRUE, 17.00);
INSERT INTO animals VALUES(11, 'Ditto', '2022-05-14', 4, TRUE, 22.00);

-- insert values into owners table
INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 38);

-- insert values into species table
INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');

-- Modify your inserted animals so it includes the species_id value:
  -- If the name ends in "mon" it will be Digimon
UPDATE animals
SET species_id = 1
WHERE name LIKE '%mon';

-- All other animals are Pokemon
UPDATE animals
SET species_id = 1
WHERE species_id ISNULL;

-- Modify your inserted animals to include owner information (owner_id):
    -- Sam Smith owns Agumon.
BEGIN TRANSACTION;
UPDATE animals
SET owner_id = 1
WHERE name LIKE 'Agumon';

COMMIT;

BEGIN TRANSACTION;
UPDATE animals
SET owner_id = 2
WHERE name IN ('Gabumon', 'Pikachu');

COMMIT;

UPDATE animals
SET owner_id = 3
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = 5
WHERE name IN ('Angemon', 'Boarmon');

UPDATE animals
SET owner_id = 4
WHERE name IN ('Chamander', 'Squirtle', 'Blossom');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations(vets_id, species_id) VALUES(1, 1);
INSERT INTO specializations(vets_id, species_id) VALUES(3, 1);
INSERT INTO specializations(vets_id, species_id) VALUES(3, 2);
INSERT INTO specializations(vets_id, species_id) VALUES(4, 2);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Agumon'),
  (SELECT vets.id FROM vets WHERE vets.name ='William Tatcher'),
  '2020-05-24'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Agumon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez'),
  '2020-07-22'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Gabumon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Jack Harkness'),
  '2021-02-02'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Pikachu'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2020-01-05'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Pikachu'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2020-03-08'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Pikachu'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2020-04-14'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Devimon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez'),
  '2021-05-04'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Chamander'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Jack Harkness'),
  '2021-02-24'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Plantmon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2019-12-21'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Plantmon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'William Tatcher'),
  '2020-08-10'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Plantmon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2021-04-07'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Squirtle'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez'),
  '2019-09-29'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Angemon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Jack Harkness'),
  '2020-10-03'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Angemon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Jack Harkness'),
  '2020-11-04'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Boarmon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2019-01-24'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Boarmon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2019-05-15'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Boarmon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2020-02-27'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Boarmon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2020-08-03'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Blossom'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez'),
  '2020-05-24'
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Blossom'),
  (SELECT vets.id FROM vets WHERE vets.name = 'William Tatcher'),
  '2021-01-11'
);
