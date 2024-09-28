-- HELLO, WELCOME!
-- OLÁ, BEM-VINDOS!

-- THIS IS A STUDY DATABASE.
CREATE DATABASE solar_system WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';
\connect  solar_system

CREATE TABLE public.sun (
    sun_id int serial not null,
    sun_name varchar(255) not null,
    sun_mass numeric(10, 2) not null,
    sun_radius numeric(10, 2) not null,
    sun_description text unique
);
-- ABOVE  IS THE TABLE FOR SUN,  THE CENTER OF OUR SOLAR SYSTEM.
-- OTHER WAY TO DO  IT IS TO USE THE FOLLOWING CODE:
-- CREATE TABLE  public.sun (sun_id int serial not null, sun_name varchar(255) not null,
--                           sun mass numeric (10, 2) not null, sun_radius numeric  (10, 2) not null,
--                           sun_description text unique);

-- NOW, I'LL CREATE NEW TABLES  FOR PLANETS IN OUR SOLAR SYSTEM...
-- P.S: IN 'SUN' ORDER...

CREATE TABLE public.mercury
(
    mercury_id int serial not null primary key,
    planet _name varchar(255) not null,
    planet_mass numeric(10, 2) not null,
    planet_radius numeric(10, 2) not null,
    planet_description text unique,
    planet_temperature  numeric(10, 2) not null,
    has_life boolean DEFAULT (false),
    sun _id int not null foreign key references public.sun(sun_id)

-- AS WE KNOW, VENUS DOESN'T HAVE LIFE... YET!
);


CREATE  TABLE public.venus
(
    venus_id int serial not null primary key,
    planet_name varchar(255) not null,
    planet_mass numeric(10, 2) not null,
    planet_radius numeric(10, 2) not null,
    planet_description text unique,
    planet_temperature numeric(10, 2) not null,
    has_life  boolean DEFAULT (false),
    sun _id int not null foreign key references public.sun(sun_id)
);


CREATE  TABLE public.earth
(
    earth_id int serial not null primary key,
    planet_name varchar(255) not null,
    planet_mass numeric(10, 2) not null,
    planet_radius numeric(10, 2) not null,
    planet_description text unique,
    planet_temperature numeric(10, 2) not null,
    has_life boolean DEFAULT (true),
    sun _id int not null foreign key references public.sun(sun_id)
    -- OUR HOME BTW...
);


CREATE TABLE  public.mars
(
    mars_id int serial not null primary key,
    planet_name varchar(255) not null,
    planet_mass numeric(10, 2) not null,
    planet_radius numeric(10, 2) not null,
    planet_description text unique,
    planet_temperature numeric(10, 2) not null,
    has_life boolean DEFAULT (false),
    sun _id int not null foreign key references public.sun(sun_id)
);


CREATE TABLE   public.jupiter
(
    jupiter_id int serial not null primary key,
    planet_name varchar(255) not null,
    planet_mass numeric(10, 2) not null,
    planet_radius numeric(10, 2) not null,
    planet_description text unique,
    planet_temperature numeric(10, 2) not null,
    has_life boolean DEFAULT (false),
    sun _id int not null foreign key references public.sun(sun_id)
);


CREATE TABLE   public.saturn
(
    saturn_id int serial not null primary key,
    planet_name varchar(255) not null,
    planet_mass numeric(10, 2) not null,
    planet_radius numeric(10, 2) not null,
    planet_description text unique,
    planet_temperature numeric(10, 2) not null,
    has_life boolean DEFAULT (false),
    sun _id int not null foreign key references public.sun(sun_id)
);

CREATE TABLE    public.uranus
(
    uranus_id int serial not null primary key,
    planet_name varchar(255) not null,
    planet_mass  numeric(10, 2) not null,
    planet_radius numeric(10, 2) not null,
    planet_description  text unique,
    planet_temperature numeric(10, 2) not null,
    has_life boolean DEFAULT (false),
    sun _id int not null foreign key references public.sun(sun_id)
);

CREATE TABLE    public.neptune
(
    neptune_id int serial not null primary key,
    planet_name varchar(255) not null,
    planet_mass  numeric(10, 2) not null,
    planet_radius numeric(10, 2) not null,
    planet_description  text unique,
    planet_temperature numeric(10, 2) not null,
    has_life boolean DEFAULT (false),
    sun _id int not null foreign key references public.sun(sun_id)
);

-- IK Pluto  is not a planet, but a dwarf planet
-- BTW, lemme include  a table for dwarf planets

CREATE TABLE    public.dwarf_planets
(
    dwarf_id int serial not null primary key,
    dwarf_name varchar(255) not null,
    dwarf_mass  numeric(10, 2) not null,
    dwarf_radius numeric(10, 2) not null,
    dwarf_description   text unique,
    dwarf_temperature  numeric(10, 2) not null,
    is_orbiting_a_star boolean NOT NULL '1' FOR  FALSE,  '0' FOR TRUE,
    if is_orbiting_a_star  = '1' THEN sun_id int not null foreign key references public.sun(sun_id),
    else  sun_id int not null default 0
-- ABOVE  IS A CASE STATEMENT IN SQL, BUT IT DOESN'T WORK IN POSTGRES... BTW, IT CAN BE USED  IN SQL SERVER, 
-- ORACLE, DB2, SYBASE, FIREBIRD, AND ACCESS
);

CREATE TABLE public.asteroids
(
    asteroid_id  int serial not null primary key,
    asteroid_name varchar(255) not null,
    asteroid_mass  numeric(10, 2),
    asteroid_radius numeric(10, 2) not null,
    is_orbiting_a_star  boolean NOT NULL '1' FOR  FALSE,  '0' FOR TRUE,
    if  is_orbiting_a_star  = '1' THEN  sun_id int not null foreign key references public.sun(sun_id),
    else   sun_id int not null default 0
    -- ABOVE  IS A CASE STATEMENT IN SQL, BUT IT DOESN'T WORK IN POSTGRES... BTW IT CAN  BE USED  IN SQL SERVER,
    --  ORACLE, DB2, SYBASE, FIREBIRD, AND ACCESS
);