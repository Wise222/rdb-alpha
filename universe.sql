--
-- PostgreSQL database dump
--
My Project--
--Wisdom Muke --
-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(60) NOT NULL,
    galaxy_type character varying(40) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2),
    description text,
    has_life boolean NOT NULL
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
    name character varying(40) NOT NULL,
    description text NOT NULL
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
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    radius_km integer NOT NULL,
    distance_from_planet_km integer,
    description text
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
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(40) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_star_au numeric(10,3)
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
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(40) NOT NULL,
    temperature_k integer NOT NULL,
    mass_solar numeric(8,3),
    is_visible boolean NOT NULL
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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0.00, 'Home galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000.00, 'Nearest major galaxy', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 3000000.00, 'Local Group member', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 400, 23000000.00, 'Interacting galaxy', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 9000, 29000000.00, 'Bright central bulge', false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 13000, 53000000.00, 'Giant elliptical galaxy', false);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 'Disk shaped galaxy with spiral arms');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'Rounded galaxy with older stars');
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', 'No clear shape');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, 1737, 384400, 'Earth moon');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 11, 9376, 'Mars moon');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 6, 23463, 'Mars moon');
INSERT INTO public.moon VALUES (4, 'Io', 5, true, 1821, 421700, 'Jupiter moon');
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, 1560, 671100, 'Jupiter moon');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, 2634, 1070400, 'Jupiter moon');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, 2410, 1882700, 'Jupiter moon');
INSERT INTO public.moon VALUES (8, 'Mimas', 6, true, 198, 185539, 'Saturn moon');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, true, 252, 238042, 'Saturn moon');
INSERT INTO public.moon VALUES (10, 'Tethys', 6, true, 531, 294619, 'Saturn moon');
INSERT INTO public.moon VALUES (11, 'Dione', 6, true, 561, 377396, 'Saturn moon');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, true, 763, 527108, 'Saturn moon');
INSERT INTO public.moon VALUES (13, 'Titan', 6, true, 2574, 1221870, 'Saturn moon');
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, true, 734, 3560820, 'Saturn moon');
INSERT INTO public.moon VALUES (15, 'Miranda', 7, true, 236, 129390, 'Uranus moon');
INSERT INTO public.moon VALUES (16, 'Ariel', 7, true, 579, 191020, 'Uranus moon');
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, true, 585, 266300, 'Uranus moon');
INSERT INTO public.moon VALUES (18, 'Titania', 7, true, 789, 435910, 'Uranus moon');
INSERT INTO public.moon VALUES (19, 'Oberon', 7, true, 761, 583520, 'Uranus moon');
INSERT INTO public.moon VALUES (20, 'Triton', 8, true, 1353, 354759, 'Neptune moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, true, 4500, 0.387);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, true, 4500, 0.723);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, true, 4500, 1.000);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, true, 4500, 1.524);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', false, true, 4500, 5.203);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', false, true, 4500, 9.537);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', false, true, 4500, 19.191);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', false, true, 4500, 30.068);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, 'Super-Earth', false, true, 6000, 0.850);
INSERT INTO public.planet VALUES (10, 'Proxima b', 2, 'Terrestrial', false, true, 4850, 0.048);
INSERT INTO public.planet VALUES (11, 'Gliese 667 Cc', 2, 'Super-Earth', false, true, 7000, 0.125);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 2, 'Terrestrial', false, true, 7600, 0.029);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 5778, 1.000, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M-type', 3042, 0.122, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A-type', 9940, 2.063, true);
INSERT INTO public.star VALUES (4, 'Vega', 1, 'A-type', 9602, 2.135, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 'Red supergiant', 3500, 16.500, true);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 'Blue supergiant', 12100, 21.000, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


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

