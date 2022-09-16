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