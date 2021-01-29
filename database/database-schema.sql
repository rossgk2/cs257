CREATE TABLE athletes (
    id SERIAL,
    name text,
    sex text,
    age float,
    height float,
    weight float,
    team_id integer,
    game_id integer,
    city text,
    sport text
    event text
    medal text
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