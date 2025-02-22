CREATE DATABASE universe;

CREATE TABLE galaxy (
  galaxy_id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL,
  is_spherical BOOLEAN,
  black_hole_size_in_millions INT,
  galaxy_type TEXT NOT NULL
);

CREATE TABLE nebula (
  nebula_id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(30) UNIQUE NOT NULL,
  galaxy_id INT NOT NULL,
  FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(30) UNIQUE NOT NULL,
  age_in_millions_of_years NUMERIC(5,2),
  distance_from_earth INT,
  galaxy_id INT NOT NULL,
  FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(30) UNIQUE NOT NULL,
  has_life BOOLEAN,
  distance_from_earth INT,
  star_id INT NOT NULL,
  FOREIGN KEY (star_id) REFERENCES star(star_id)
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(30) UNIQUE NOT NULL,
  surface_temperature INT,
  tidal_locked BOOLEAN,
  planet_id INT NOT NULL,
  FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

INSERT INTO galaxy (name, is_spherical, galaxy_type)
VALUES ('Zelorith Expanse', TRUE, 'Spiral Galaxy'),
('Valtheris Veil', FALSE, 'Elliptical Galaxy'),
('Myrialis Cascade', FALSE, 'Lenticural Galaxy'),
('Nexalis Rift', FALSE, 'Irregular Galaxy'),
('Eryndall Spiral', TRUE, 'Spiral Galaxy'),
('Luthain Verge', FALSE, 'Lenticular Galaxy');

INSERT INTO nebula (name, galaxy_id)
VALUES ('Eclipse Veil', 1),
('Aurora Embrace', 3),
('Celestial Whispers', 6);

INSERT INTO star (name, distance_from_earth, galaxy_id)
VALUES ('Aurinex', 1000000, 1),
('Oridion', 2000000, 2),
('Celthorin', 3000000, 3),
('Kronith', 4000000, 4),
('Aetheris', 5000000, 5),
('Nytheris', 6000000, 6);

INSERT INTO planet (name, has_life, star_id)
VALUES ('Svarin', FALSE, 1),
('Pyronis', FALSE, 1),
('Cyralyn', TRUE, 2),
('Ferynos', FALSE, 2),
('Aesolyn', TRUE, 3),
('Vyrallis', FALSE, 3),
('Avaris', FALSE, 4),
('Thendros', TRUE, 4),
('Lythora', FALSE, 5),
('Brionis', FALSE, 5),
('Vallos', FALSE, 6),
('Myrithon', TRUE, 6);

INSERT INTO moon (name, surface_temperature, tidal_locked, planet_id)
VALUES ('Zylora',floor((random() * 2 - 1) * 80), FALSE, 1),
('Dralith',floor((random() * 2 - 1) * 80), FALSE, 1),
('Thalvos',floor((random() * 2 - 1) * 80), TRUE, 1),
('Veltrion',floor((random() * 2 - 1) * 80), FALSE, 2),
('Syros',floor((random() * 2 - 1) * 80), FALSE, 2),
('Qalith',floor((random() * 2 - 1) * 80), FALSE, 2),
('Lythera',floor((random() * 2 - 1) * 80), TRUE, 3),
('Tynara',floor((random() * 2 - 1) * 80), FALSE, 3),
('Korith',floor((random() * 2 - 1) * 80), TRUE, 3),
('Syvra',floor((random() * 2 - 1) * 80), FALSE, 4),
('Valtis',floor((random() * 2 - 1) * 80), FALSE, 4),
('Malyth',floor((random() * 2 - 1) * 80), TRUE, 4),
('Pyrelis',floor((random() * 2 - 1) * 80), FALSE, 5),
('Fenara',floor((random() * 2 - 1) * 80), FALSE, 5),
('Exorath',floor((random() * 2 - 1) * 80), TRUE, 5),
('Nyvora',floor((random() * 2 - 1) * 80), FALSE, 5),
('Teryn',floor((random() * 2 - 1) * 80), TRUE, 6),
('Xyvera',floor((random() * 2 - 1) * 80), FALSE, 6),
('Falorin',floor((random() * 2 - 1) * 80), TRUE, 6),
('Sylaris',floor((random() * 2 - 1) * 80), FALSE, 6);