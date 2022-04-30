DROP DATABASE universe;

CREATE DATABASE universe;

\connect universe

ALTER DATABASE universe OWNER TO freecodecamp;

-- Galaxies_Types
CREATE TABLE galaxy_types (
    galaxy_types_id serial primary key,
    name character varying(30) NOT NULL unique,
    description text,
    wikipedia_link text
);

ALTER TABLE galaxy_types OWNER TO freecodecamp;

INSERT INTO galaxy_types(name, description, wikipedia_link) values
('Ellipticals', 'Vary from nearly circular to very elongated. They possess comparatively little gas and dust, contain older stars and are not actively forming stars anymore. The largest and rarest of these, called giant ellipticals, are about 300,000 light-years across. Astronomers theorize that these are formed by the mergers of smaller galaxies. Much more common are dwarf ellipticals, which are only a few thousand light-years wide.', 'https://en.wikipedia.org/wiki/Elliptical_galaxy'),
('Spiral', 'Appear as flat, blue-white disks of stars, gas and dust with yellowish bulges in their centers. These galaxies are divided into two groups: normal spirals and barred spirals. In barred spirals, the bar of stars runs through the central bulge. The arms of barred spirals usually start at the end of the bar instead of from the bulge. Spirals are actively forming stars and comprise a large fraction of all the galaxies in the local universe.', 'https://en.wikipedia.org/wiki/Spiral_galaxy'),
('Irregular', 'Which have very little dust, are neither disk-like nor elliptical. Astronomers often see irregular galaxies as they peer deeply into the universe, which is equivalent to looking back in time. These galaxies are abundant in the early universe, before spirals and ellipticals developed.', 'https://en.wikipedia.org/wiki/Irregular_galaxy');


-- Galaxies
CREATE TABLE galaxy (
    galaxy_id serial primary key,
    name character varying(30) NOT NULL unique,
    has_life boolean,
    wikipedia_link text,
    galaxy_types_id int not null references galaxy_types(galaxy_types_id)
);
ALTER TABLE galaxy OWNER TO freecodecamp;

INSERT INTO galaxy(name, has_life, wikipedia_link, galaxy_types_id) values
('Maffei 1', '0', 'https://en.wikipedia.org/wiki/Maffei', 1),
('Centaurus A', '0', 'https://en.wikipedia.org/wiki/Centaurus_A', 1),
('Milky Way', '1', 'https://en.wikipedia.org/wiki/Milky_Way', 2),
('IC 1954', '0', null, 2),
('ESO 338-4', '0', null, 3),
('IC 4710', '0', 'https://en.wikipedia.org/wiki/IC_4710', 3);


-- Stars
CREATE TABLE star(
    star_id serial primary key,
    name varchar(30) not null unique,
    age_in_millions_of_years numeric(6,2),
    number_of_planets int,
    wikipedia_link text,
    galaxy_id int not null references galaxy(galaxy_id)
);
ALTER TABLE star OWNER TO freecodecamp;

INSERT INTO star(name, age_in_millions_of_years, number_of_planets, wikipedia_link, galaxy_id) values
('Antares', 15, null, 'https://en.wikipedia.org/wiki/Antares', 3),
('Sun', 4603, 13, 'https://en.wikipedia.org/wiki/Sun', 3),
('Sirius', 250, null, 'https://en.wikipedia.org/wiki/Sirius', 3),
('Canopus', 25.1, null, 'https://en.wikipedia.org/wiki/Canopus', 3),
('Arcturus', 7.1, null, 'https://en.wikipedia.org/wiki/Arcturus', 3),
('Aldebaran', 6.4, null, 'https://en.wikipedia.org/wiki/Aldebaran', 3);


-- Planet
CREATE TABLE planet(
    planet_id serial primary key,
    name varchar(30) not null unique,
    is_dwarf boolean,
    age_in_millions_of_years numeric(6,2),
    has_life boolean not null,
    number_of_moons int,
    wikipedia_link text,
    star_id int not null references star(star_id)
);
ALTER TABLE planet OWNER TO freecodecamp;

INSERT INTO planet(name, is_dwarf, age_in_millions_of_years, number_of_moons, has_life, wikipedia_link, star_id) values
('Mercury', '0', 4600, 0, '0', 'https://en.wikipedia.org/wiki/Mercury_(planet)', 2),
('Venus', '0', 4600, 0, '0', 'https://en.wikipedia.org/wiki/Venus', 2),
('Earth', '0', 4540, 1, '1', 'https://en.wikipedia.org/wiki/Earth', 2),
('Mars', '0', 4603, 2, '0', 'https://en.wikipedia.org/wiki/Mars', 2),
('Jupiter', '0', 4603, 79, '0', 'https://en.wikipedia.org/wiki/Jupiter', 2),
('Saturn', '0', 4503, 82, '0', 'https://en.wikipedia.org/wiki/Saturn', 2),
('Uranus', '0', 4503, 27, '0', 'https://en.wikipedia.org/wiki/Uranus', 2),
('Neptune', '0', 4503, 14, '0', 'https://en.wikipedia.org/wiki/Neptune', 2),
('Pluto', '1', 4600, 5, '0', 'https://en.wikipedia.org/wiki/Pluto', 2),
('Eris', '1', 4503, 1, '0', 'https://en.wikipedia.org/wiki/Eris_(dwarf_planet)', 2),
('Haumea', '1', 4503, 2, '0', 'https://en.wikipedia.org/wiki/Haumea', 2),
('Makemake', '1', 4503, 1, '0', 'https://en.wikipedia.org/wiki/Makemake', 2),
('Ceres', '1', 4573, 0, '0', 'https://en.wikipedia.org/wiki/Ceres_(dwarf_planet)', 2);


-- Moons
CREATE TABLE moon(
    moon_id serial primary key,
    name varchar(30) not null unique,
    is_spherical boolean,
    wikipedia_link text,
    planet_id int not null references planet(planet_id)
);
ALTER TABLE moon OWNER TO freecodecamp;

INSERT INTO moon(name, is_spherical, wikipedia_link, planet_id) values
('Moon', '1', 'https://en.wikipedia.org/wiki/Moon', 3),
('Deimos', '0', 'https://en.wikipedia.org/wiki/Deimos_(moon)', 4),
('Phobos', '0', 'https://en.wikipedia.org/wiki/Phobos_(moon)', 4),
('Europa', '1', 'https://en.wikipedia.org/wiki/Europa_(moon)', 5),
('Ganymede', '1', 'https://en.wikipedia.org/wiki/Ganymede_(moon)', 5),
('Calisto', '1', 'https://en.wikipedia.org/wiki/Callisto_(moon)', 5),
('Io', '1', 'https://en.wikipedia.org/wiki/Io_(moon)', 5),
('Dia', null, 'https://en.wikipedia.org/wiki/Dia_(moon)', 5),
('Adrastea', '1', 'https://en.wikipedia.org/wiki/Adrastea_(moon)', 5),
('Aitne', '0', 'https://en.wikipedia.org/wiki/Aitne_(moon)', 5),
('Amalthea', '0', 'https://en.wikipedia.org/wiki/Amalthea_(moon)', 5),
('Ananke', '0', 'https://en.wikipedia.org/wiki/Ananke_(moon)', 5),
('Aoede', '0', 'https://en.wikipedia.org/wiki/Aoede_(moon)', 5),
('Kallichore', '0', 'https://en.wikipedia.org/wiki/Kallichore_(moon)', 5),
('Hermippe', '0', 'https://en.wikipedia.org/wiki/Hermippe_(moon)', 5),
('Cyllene', '0', 'https://en.wikipedia.org/wiki/Cyllene_(moon)', 5),
('Elara', '0', 'https://en.wikipedia.org/wiki/Elara_(moon)', 5),
('Ersa', null, 'https://en.wikipedia.org/wiki/Ersa_(moon)', 5),
('Euporie', '0', 'https://en.wikipedia.org/wiki/Euporie_(moon)', 5),
('Eupheme', '0', 'https://en.wikipedia.org/wiki/Eupheme_(moon)', 5);
