CREATE TABLE athletes (
    id SERIAL,
    name text,
    sex text,
    age float,
    height float,
    weight float,
    team_id integer,
    games text,
    city text,
    sport text,
    event text,
    medal text
);

CREATE TABLE teams (
    id SERIAL,
    name text,
    noc text,
    region text,
    notes text
);