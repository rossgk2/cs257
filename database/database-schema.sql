CREATE TABLE athletes (
    id SERIAL,
    name text,
    sex text,
    age integer,
    height double,
    weight double,
    team integer
);

CREATE TABLE teams (
    id SERIAL,
    team_name text,
    NOC text
);

CREATE TABLE games (
    id SERIAL,
    year integer,
    season text
);

CREATE TABLE NOCs (
    id SERIAL,
    region text,
    notes text
);

CREATE TABLE cities (
    id SERIAL,
    city text,
);

CREATE TABLE sports (
    id SERIAL,
    sport text,
);

CREATE TABLE events (
    id SERIAL,
    event text,
);
