/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    name varchar(100)
);
CREATE TABLE animals(
id int PRIMARY KEY NOT NULL,
name VARCHAR(30) NOT NULL,
date_of_birth DATE,
escape_attempts INT,
neutered BOOL,
weight_kg DECIMAL);
