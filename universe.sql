--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    wikipedia_link text,
    galaxy_types_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    wikipedia_link text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    wikipedia_link text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_dwarf boolean,
    age_in_millions_of_years numeric(6,2),
    has_life boolean NOT NULL,
    number_of_moons integer,
    wikipedia_link text,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(6,2),
    number_of_planets integer,
    wikipedia_link text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Maffei 1', false, 'https://en.wikipedia.org/wiki/Maffei', 1);
INSERT INTO public.galaxy VALUES (2, 'Centaurus A', false, 'https://en.wikipedia.org/wiki/Centaurus_A', 1);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', true, 'https://en.wikipedia.org/wiki/Milky_Way', 2);
INSERT INTO public.galaxy VALUES (4, 'IC 1954', false, NULL, 2);
INSERT INTO public.galaxy VALUES (5, 'ESO 338-4', false, NULL, 3);
INSERT INTO public.galaxy VALUES (6, 'IC 4710', false, 'https://en.wikipedia.org/wiki/IC_4710', 3);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Ellipticals', 'Vary from nearly circular to very elongated. They possess comparatively little gas and dust, contain older stars and are not actively forming stars anymore. The largest and rarest of these, called giant ellipticals, are about 300,000 light-years across. Astronomers theorize that these are formed by the mergers of smaller galaxies. Much more common are dwarf ellipticals, which are only a few thousand light-years wide.', 'https://en.wikipedia.org/wiki/Elliptical_galaxy');
INSERT INTO public.galaxy_types VALUES (2, 'Spiral', 'Appear as flat, blue-white disks of stars, gas and dust with yellowish bulges in their centers. These galaxies are divided into two groups: normal spirals and barred spirals. In barred spirals, the bar of stars runs through the central bulge. The arms of barred spirals usually start at the end of the bar instead of from the bulge. Spirals are actively forming stars and comprise a large fraction of all the galaxies in the local universe.', 'https://en.wikipedia.org/wiki/Spiral_galaxy');
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', 'Which have very little dust, are neither disk-like nor elliptical. Astronomers often see irregular galaxies as they peer deeply into the universe, which is equivalent to looking back in time. These galaxies are abundant in the early universe, before spirals and ellipticals developed.', 'https://en.wikipedia.org/wiki/Irregular_galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 'https://en.wikipedia.org/wiki/Moon', 3);
INSERT INTO public.moon VALUES (2, 'Deimos', false, 'https://en.wikipedia.org/wiki/Deimos_(moon)', 4);
INSERT INTO public.moon VALUES (3, 'Phobos', false, 'https://en.wikipedia.org/wiki/Phobos_(moon)', 4);
INSERT INTO public.moon VALUES (4, 'Europa', true, 'https://en.wikipedia.org/wiki/Europa_(moon)', 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', true, 'https://en.wikipedia.org/wiki/Ganymede_(moon)', 5);
INSERT INTO public.moon VALUES (6, 'Calisto', true, 'https://en.wikipedia.org/wiki/Callisto_(moon)', 5);
INSERT INTO public.moon VALUES (7, 'Io', true, 'https://en.wikipedia.org/wiki/Io_(moon)', 5);
INSERT INTO public.moon VALUES (8, 'Dia', NULL, 'https://en.wikipedia.org/wiki/Dia_(moon)', 5);
INSERT INTO public.moon VALUES (9, 'Adrastea', true, 'https://en.wikipedia.org/wiki/Adrastea_(moon)', 5);
INSERT INTO public.moon VALUES (10, 'Aitne', false, 'https://en.wikipedia.org/wiki/Aitne_(moon)', 5);
INSERT INTO public.moon VALUES (11, 'Amalthea', false, 'https://en.wikipedia.org/wiki/Amalthea_(moon)', 5);
INSERT INTO public.moon VALUES (12, 'Ananke', false, 'https://en.wikipedia.org/wiki/Ananke_(moon)', 5);
INSERT INTO public.moon VALUES (13, 'Aoede', false, 'https://en.wikipedia.org/wiki/Aoede_(moon)', 5);
INSERT INTO public.moon VALUES (14, 'Kallichore', false, 'https://en.wikipedia.org/wiki/Kallichore_(moon)', 5);
INSERT INTO public.moon VALUES (15, 'Hermippe', false, 'https://en.wikipedia.org/wiki/Hermippe_(moon)', 5);
INSERT INTO public.moon VALUES (16, 'Cyllene', false, 'https://en.wikipedia.org/wiki/Cyllene_(moon)', 5);
INSERT INTO public.moon VALUES (17, 'Elara', false, 'https://en.wikipedia.org/wiki/Elara_(moon)', 5);
INSERT INTO public.moon VALUES (18, 'Ersa', NULL, 'https://en.wikipedia.org/wiki/Ersa_(moon)', 5);
INSERT INTO public.moon VALUES (19, 'Euporie', false, 'https://en.wikipedia.org/wiki/Euporie_(moon)', 5);
INSERT INTO public.moon VALUES (20, 'Eupheme', false, 'https://en.wikipedia.org/wiki/Eupheme_(moon)', 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 4600.00, false, 0, 'https://en.wikipedia.org/wiki/Mercury_(planet)', 2);
INSERT INTO public.planet VALUES (2, 'Venus', false, 4600.00, false, 0, 'https://en.wikipedia.org/wiki/Venus', 2);
INSERT INTO public.planet VALUES (3, 'Earth', false, 4540.00, true, 1, 'https://en.wikipedia.org/wiki/Earth', 2);
INSERT INTO public.planet VALUES (4, 'Mars', false, 4603.00, false, 2, 'https://en.wikipedia.org/wiki/Mars', 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 4603.00, false, 79, 'https://en.wikipedia.org/wiki/Jupiter', 2);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 4503.00, false, 82, 'https://en.wikipedia.org/wiki/Saturn', 2);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 4503.00, false, 27, 'https://en.wikipedia.org/wiki/Uranus', 2);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 4503.00, false, 14, 'https://en.wikipedia.org/wiki/Neptune', 2);
INSERT INTO public.planet VALUES (9, 'Pluto', true, 4600.00, false, 5, 'https://en.wikipedia.org/wiki/Pluto', 2);
INSERT INTO public.planet VALUES (10, 'Eris', true, 4503.00, false, 1, 'https://en.wikipedia.org/wiki/Eris_(dwarf_planet)', 2);
INSERT INTO public.planet VALUES (11, 'Haumea', true, 4503.00, false, 2, 'https://en.wikipedia.org/wiki/Haumea', 2);
INSERT INTO public.planet VALUES (12, 'Makemake', true, 4503.00, false, 1, 'https://en.wikipedia.org/wiki/Makemake', 2);
INSERT INTO public.planet VALUES (13, 'Ceres', true, 4573.00, false, 0, 'https://en.wikipedia.org/wiki/Ceres_(dwarf_planet)', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Antares', 15.00, NULL, 'https://en.wikipedia.org/wiki/Antares', 3);
INSERT INTO public.star VALUES (2, 'Sun', 4603.00, 13, 'https://en.wikipedia.org/wiki/Sun', 3);
INSERT INTO public.star VALUES (3, 'Sirius', 250.00, NULL, 'https://en.wikipedia.org/wiki/Sirius', 3);
INSERT INTO public.star VALUES (4, 'Canopus', 25.10, NULL, 'https://en.wikipedia.org/wiki/Canopus', 3);
INSERT INTO public.star VALUES (5, 'Arcturus', 7.10, NULL, 'https://en.wikipedia.org/wiki/Arcturus', 3);
INSERT INTO public.star VALUES (6, 'Aldebaran', 6.40, NULL, 'https://en.wikipedia.org/wiki/Aldebaran', 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_types_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


