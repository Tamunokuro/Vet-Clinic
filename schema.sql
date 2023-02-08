/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL, 
    weight_kg DECIMAL NOT NULL
);

ALTER TABLE animals
ADD CONSTRAINT id PRIMARY KEY (id);

ALTER Table animals
ADD species VARCHAR(20);

CREATE TABLE owners (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(50) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE species (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD species_id INT;

ALTER TABLE animals
ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals
ADD owner_id INT;

ALTER TABLE animals
ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL
);

CREATE TABLE specialisations (
    species_id INT,
    vet_id INT
);

ALTER TABLE specialisations
ADD FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE CASCADE;

ALTER TABLE specialisations
ADD FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE CASCADE;

CREATE TABLE visits (
    vet_id INT,
    animal_id INT,
    date_of_visit DATE
);

ALTER TABLE visits
ADD FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE CASCADE;

ALTER Table visits
ADD FOREIGN KEY (animal_id) REFERENCES animals (id) ON DELETE CASCADE;

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX visits_animal_id_index ON visits (animal_id);
CREATE INDEX visits_vet_id_index ON visits (vet_id);