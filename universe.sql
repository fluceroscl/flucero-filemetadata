-- Crear la base de datos
CREATE DATABASE universe;

-- Conectar a la base de datos
\c universe;

-- Crear la tabla galaxy
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    has_life BOOLEAN NOT NULL,
    distance_from_earth INT NOT NULL
);

-- Crear la tabla star
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    age_in_millions_of_years INT,
    is_spherical BOOLEAN NOT NULL
);

-- Crear la tabla comet
CREATE TABLE comet (
    comet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    orbit_period NUMERIC NOT NULL,
    has_tail BOOLEAN NOT NULL,
    planet_id INT REFERENCES planet(planet_id) -- Relación con la tabla planet
);

-- Crear la tabla planet
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    star_id INT REFERENCES star(star_id),
    planet_types TEXT,
    age_in_millions_of_years INT NOT NULL
);

-- Crear la tabla moon
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    planet_id INT REFERENCES planet(planet_id),
    has_life BOOLEAN NOT NULL,
    distance_from_planet NUMERIC
);

-- Insertar datos en la tabla galaxy
INSERT INTO galaxy (name, description, has_life, distance_from_earth) VALUES
('Vía Láctea', 'Nuestra galaxia', TRUE, 0),
('Andrómeda', 'Galaxia más cercana', FALSE, 2530000),
('Triángulo', 'Galaxia en forma de triángulo', FALSE, 3000000),
('Sombrero', 'Galaxia espiral', FALSE, 28000000),
('Cigarro', 'Galaxia en forma de cigarro', FALSE, 100000000),
('Elíptica', 'Galaxia elíptica', FALSE, 50000000);

-- Insertar datos en la tabla star
INSERT INTO star (name, galaxy_id, age_in_millions_of_years, is_spherical) VALUES
('Sol', 1, 4600, TRUE),
('Sirius', 1, 200, TRUE),
('Proxima Centauri', 2, 4500, TRUE),
('Betelgeuse', 1, 100, FALSE),
('Rigel', 1, 800, TRUE),
('Aldebarán', 1, 650, FALSE);

-- Insertar datos en la tabla comet
INSERT INTO comet (name, orbit_period, has_tail, planet_id) VALUES
('Halley', 75.3, TRUE, 1),
('Hale-Bopp', 2533, TRUE, 3),
('Swift-Tuttle', 133, TRUE, 1);

-- Insertar datos en la tabla planet
INSERT INTO planet (name, star_id, planet_types, age_in_millions_of_years) VALUES
('Tierra', 1, 'Terrestre', 4.5),
('Marte', 1, 'Terrestre', 4.6),
('Júpiter', 1, 'Gaseoso', 4.6),
('Saturno', 1, 'Gaseoso', 4.5),
('Urano', 1, 'Gaseoso', 4.5),
('Neptuno', 1, 'Gaseoso', 4.5),
('Mercurio', 1, 'Terrestre', 4.6),
('Venus', 1, 'Terrestre', 4.6),
('Plutón', 1, 'Enano', 4.5),
('Eris', 1, 'Enano', 4.5),
('Haumea', 1, 'Enano', 4.5),
('Makemake', 1, 'Enano', 4.5);

-- Insertar datos en la tabla moon
INSERT INTO moon (name, planet_id, has_life, distance_from_planet) VALUES
('Luna', 1, FALSE, 384400),
('Fobos', 2, FALSE, 6000),
('Deimos', 2, FALSE, 23000),
('Io', 3, FALSE, 421700),
('Europa', 3, FALSE, 670900),
('Ganimedes', 3, FALSE, 1070400),
('Calisto', 3, FALSE, 1882700),
('Titán', 4, FALSE, 1222000),
('Rea', 4, FALSE, 527600),
('Tetis', 4, FALSE, 294600),
('Dione', 4, FALSE, 377400),
('Hiperión', 4, FALSE, 1480000),
('Japeto', 4, FALSE, 3569000),
('Miranda', 5, FALSE, 129000),
('Ariel', 5, FALSE, 116000),
('Umbriel', 5, FALSE, 266000),
('Titania', 5, FALSE, 436000),
('Oberón', 5, FALSE, 583000),
('Tritón', 6, FALSE, 354760),
('Nereida', 6, FALSE, 1170000),
('Proteo', 6, FALSE, 1300000);
