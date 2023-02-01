/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
SELECT * from animals WHERE species = 'unspecified';
ROLLBACK TRANSACTION;
SELECT * from animals

BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * from animals;
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

SELECT * from animals;

BEGIN TRANSACTION;
DELETE from animals;
SELECT * from animals;
ROLLBACK TRANSACTION;

BEGIN TRANSACTION;
DELETE from animals WHERE date_of_birth > '2020-01-01';
SAVEPOINT deleteDOB20200101;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO deleteDOB20200101;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT TRANSACTION;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) from animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) from animals;
SELECT neutered, MAX(escape_attempts) from animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) from animals GROUP BY species;
SELECT species, AVG(escape_attempts) from animals 
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species; 


SELECT animals.* FROM animals
LEFT JOIN owners on owners.id = animals.owner_id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.* FROM animals
LEFT JOIN species on species.id = animals.species_id
WHERE species.name = 'Pokemon';

SELECT *, owners.id FROM animals
LEFT JOIN owners ON animals.owner_id = owners.id;

SELECT species.name, COUNT(animals.species_id) FROM animals
JOIN species ON animals.species_id = species.id 
GROUP BY species.name;

SELECT *, species.id FROM animals
LEFT JOIN owners ON owners.id = animals.owner_id
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT * FROM animals
LEFT JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts > 0;

SELECT owners.full_name, COUNT(animals.owner_id) 
FROM animals
LEFT JOIN owners ON animals.owner_id = owners.id 
GROUP BY owners.full_name; 
