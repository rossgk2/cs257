CREATE TABLE pokemon(
    id SERIAL,
    pokedex_number integer,
    pokemon_name text,
    legendary_id integer,
    type1_id integer,
    type2_id integer,
    ability1_id integer,
    ability2_id integer,
    hidden_ability integer,
    health integer,
    attack integer,
    defense integer,
    special_attack integer,
    special_defense integer,
    speed integer,
    region_id integer,
    catch_rate numeric,
    growth_type_id integer,
    male_percent numeric,
    game_id integer,
    egg_group1_id integer,
    egg_group2_id integer
);

create TABLE types (
    id SERIAL,
    pokemon_type text
);

create TABLE abilities (
    id SERIAL,
    ability text,
    ability_description text
);

create TABLE regions (
    id SERIAL,
    region text
);

create TABLE growth_types (
    id SERIAL,
    growth_type text
);

create TABLE games (
    id SERIAL,
    game text
);

create TABLE egg_groups (
    id SERIAL,
    egg_group text
);