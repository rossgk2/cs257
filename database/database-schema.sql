CREATE TABLE athletes (
    id SERIAL,
    Name text,
    Sex text,
    Age float,
    Height float,
    Weight float,
    Team_id integer,
    Game_id integer,
    City_id integer,
    Sport_id integer,
    Event_id integer,
    Medal text
);

CREATE TABLE teams (
    id SERIAL,
    Name text,
    NOC text,
    Region text,
    Notes text
);

CREATE TABLE games (
    id SERIAL,
    Year integer,
    Season text
);

CREATE TABLE cities (
    id SERIAL,
    City text
);

CREATE TABLE sports (
    id SERIAL,
    Sport text
);

CREATE TABLE events (
    id SERIAL,
    Event text
);