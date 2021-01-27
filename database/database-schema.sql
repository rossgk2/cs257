CREATE TABLE athletes (
    id SERIAL,
    Name text,
    Sex text,
    Age integer,
    Height double,
    Weight double,
    Team text
);

CREATE TABLE teams (
    id SERIAL,
    Team-name text,
    NOC text
);

CREATE TABLE games (
    id SERIAL,
    Year integer,
    Season text
);

CREATE TABLE NOCs (
    id SERIAL,
    region text,
    notes text
);

CREATE TABLE cities (
    id SERIAL,
    City text,
);

CREATE TABLE sports (
    id SERIAL,
    Sport text,
);

CREATE TABLE events (
    id SERIAL,
    Event text
);