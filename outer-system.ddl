-- HELLO, WELCOME!
-- OLÁ, BEM-VINDOS!

-- THIS IS A STUDY DATABASE.
CREATE DATABASE outer_system WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';
\connect  outer_system

CREATE TABLE public.stars 
(
    stars_id INT PRIMARY KEY NOT NULL,
    stars_name VARCHAR(255) NOT NULL UNIQUE,
    stars_type VARCHAR(255) NOT NULL,
    color VARCHAR(255),
    stars_mass DECIMAL(10, 2),
    stars_radius DECIMAL(10, 2),
    stars_luminosity DECIMAL(10, 2),
    stars_age DECIMAL(10, 2),
    stars_distance DECIMAL(10, 2) NOT NULL,
    solar_system_id  INT REFERENCES  public.solar_systems(solar_system_id)
);

CREATE TABLE public.planets
(
    planets_id INT PRIMARY KEY NOT NULL,
    planets_name VARCHAR(255) NOT NULL UNIQUE,
    planets_type VARCHAR(255) NOT NULL,
    planets_mass DECIMAL(10, 2),
    planets_radius DECIMAL(10, 2),
    planets_orbital_period DECIMAL(10, 2),
    moon_id INT NOT NULL FOREIGN KEY REFERENCES  public.moon(moon_id),
    stars_id INT NOT NULL FOREIGN KEY REFERENCES  public.stars(stars_id),
    has_life  BOOLEAN NOT NULL
);

CREATE TABLE public.species
(
    species_name VARCHAR(255) NOT NULL UNIQUE PRIMARY KEY,
    species_type VARCHAR(255) NOT NULL,
    diet  VARCHAR(255) NOT NULL,
    is_extinct   BOOLEAN NOT NULL,
    is_advanced  BOOLEAN NOT NULL,
    is_enemy     BOOLEAN,
    is_hostile   BOOLEAN NOT NULL,
    planets_id  INT NOT NULL FOREIGN KEY REFERENCES  public.planets(planets_id),
    stars_id INT NOT NULL FOREIGN KEY REFERENCES  public.stars(stars_id)
);

CREATE TABLE public.societies
(
    society_id INT PRIMARY KEY NOT NULL,
    society_name VARCHAR(255) NOT NULL UNIQUE,
    is_advanced   BOOLEAN NOT NULL FOREIGN KEY REFERENCES public.species(is_advanced),
    is_hostile    BOOLEAN NOT NULL FOREIGN KEY REFERENCES  public.species(is_hostile),
    is_enemy      BOOLEAN NOT NULL FOREIGN KEY REFERENCES public.species(is_enemy),
    species_name VARCHAR(255) NOT NULL FOREIGN KEY REFERENCES public.species(species_name),
)

CREATE TABLE public.blackholes
(
    blackholes_id INT PRIMARY KEY NOT NULL,
    blackholes_name VARCHAR(255) NOT NULL UNIQUE,
    blackholes_mass DECIMAL (10, 2) NOT NULL,
    blackholes_radius DECIMAL(10, 2),
    blackholes_luminosity DECIMAL(10, 2),
    blackholes_age DECIMAL(10, 2),
    blackholes_distance DECIMAL(10, 2) NOT NULL
);

CREATE TABLE public.strange_objects
(
    strange_objects_id INT PRIMARY KEY NOT NULL,
    strange_objects_name VARCHAR(255) NOT NULL UNIQUE,
    strange_objects_type VARCHAR(255) NOT NULL,
    strange_objects_mass DECIMAL(10, 2),
    strange_objects_radius DECIMAL(10, 2),
    strange_objects_luminosity DECIMAL(10, 2),
    strange_objects_age DECIMAL(10, 2),
    strange_objects_distance DECIMAL(10, 2) NOT NULL,
    strange_objects _location VARCHAR(255)
    planets_id  INT FOREIGN KEY REFERENCES public.planets(planets_id)
    moon_id  INT FOREIGN KEY REFERENCES public.moon(moon_id)
);

CREATE TABLE public.wormholes 
(
    wormholes_id INT PRIMARY KEY NOT NULL,
    wormholes_name VARCHAR(255) NOT NULL UNIQUE,
    wormholes_mass DECIMAL(10, 2),
    wormholes_radius DECIMAL(10, 2),
    wormholes_distance  DECIMAL(10, 2) NOT NULL,
    wormholes_location VARCHAR(255) 
);

CREATE TABLE public.solar_systems
(
    solar_system_id INT PRIMARY KEY NOT NULL,
    solar_system_name VARCHAR(255) NOT NULL UNIQUE,
    stars_id  INT NOT NULL FOREIGN KEY REFERENCES public.stars(stars_id),
    planets_id  INT NOT NULL FOREIGN KEY REFERENCES public.planets(planets_id),
    moon_id  INT NOT NULL FOREIGN KEY REFERENCES public.moon(moon_id),
    blackholes_id  INT FOREIGN KEY REFERENCES public.blackholes(blackholes_id),
    wormholes_id  INT FOREIGN KEY REFERENCES public.wormholes(wormholes_id),
    strange_objects_id  INT FOREIGN KEY REFERENCES public.strange_objects(strange_objects_id),
    has_life  BOOLEAN NOT NULL
);



