--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

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
-- Name: abilities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.abilities (
    id integer NOT NULL,
    ability text,
    ability_description text
);


--
-- Name: abilities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.abilities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: abilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.abilities_id_seq OWNED BY public.abilities.id;


--
-- Name: egg_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egg_groups (
    id integer NOT NULL,
    egg_group text
);


--
-- Name: egg_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.egg_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: egg_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.egg_groups_id_seq OWNED BY public.egg_groups.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.games (
    id integer NOT NULL,
    game text
);


--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: legendaries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.legendaries (
    id integer NOT NULL,
    legendary_status text
);


--
-- Name: legendaries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.legendaries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: legendaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.legendaries_id_seq OWNED BY public.legendaries.id;


--
-- Name: pokemon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pokemon (
    id integer NOT NULL,
    pokedex_number integer,
    pokemon_name text,
    is_legendary integer,
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
    male_percent numeric,
    game_id integer,
    egg_group1_id integer,
    egg_group2_id integer
);


--
-- Name: pokemon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pokemon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pokemon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pokemon_id_seq OWNED BY public.pokemon.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    region text
);


--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.types (
    id integer NOT NULL,
    pokemon_type text
);


--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- Name: abilities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.abilities ALTER COLUMN id SET DEFAULT nextval('public.abilities_id_seq'::regclass);


--
-- Name: egg_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egg_groups ALTER COLUMN id SET DEFAULT nextval('public.egg_groups_id_seq'::regclass);


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: legendaries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.legendaries ALTER COLUMN id SET DEFAULT nextval('public.legendaries_id_seq'::regclass);


--
-- Name: pokemon id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pokemon ALTER COLUMN id SET DEFAULT nextval('public.pokemon_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- Data for Name: abilities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.abilities (id, ability, ability_description) FROM stdin;
0	overgrow	powers_up_grass-type_moves_when_the_pokémon's_hp_is_low.
1	thick_fat	the_pokémon_is_protected_by_a_layer_of_thick_fat_which_halves_the_damage_taken_from_fire-_and_ice-type_moves._
2	blaze	powers_up_fire-type_moves_when_the_pokémon's_hp_is_low._
3	tough_claws	powers_up_moves_that_make_direct_contact._
4	drought	turns_the_sunlight_harsh_when_the_pokémon_enters_a_battle.
5	torrent	powers_up_water-type_moves_when_the_pokémon's_hp_is_low._
6	mega_launcher	powers_up_aura_and_pulse_moves._
7	rattled	dark-_ghost-_and_bug-type_moves_scare_the_pokémon_and_boost_its_speed_stat.
8	punk_rock	boosts_the_power_of_sound-based_moves._the_pokémon_also_takes_half_the_damage_from_these_kinds_of_moves.
9	poison_point	contact_with_the_pokémon_may_poison_the_attacker.
10	rivalry	becomes_competitive_and_deals_more_damage_to_pokémon_of_the_same_gender_but_deals_less_to_pokémon_of_the_opposite_gender.
11	shed_skin	the_pokémon_may_heal_its_own_status_conditions_by_shedding_its_skin.
12	compound_eyes	the_pokémon's_compound_eyes_boost_its_accuracy.
13	no_guard	the_pokémon_employs_no-guard_tactics_to_ensure_incoming_and_outgoing_attacks_always_land.
14	swarm	powers_up_bug-type_moves_when_the_pokémon's_hp_is_low.
15	adaptability	powers_up_moves_of_the_same_type_as_the_pokémon.
16	limber	its_limber_body_protects_the_pokémon_from_paralysis.
17	shield_dust	this_pokémon's_dust_blocks_the_additional_effects_of_attacks_taken.
18	hydration	heals_status_conditions_if_it's_raining.
19	inner_focus	the_pokémon's_intensely_focused_and_that_protects_the_pokémon_from_flinching.
20	unseen_fist	the_pokémon_can_deal_damage_with_moves_that_make_physical_contact_even_if_the_target_is_protected.
21	unnerve	unnerves_opposing_pokémon_and_makes_them_unable_to_eat_berries.
22	synchronize	the_attacker_will_receive_the_same_status_condition_if_it_inflicts_a_burn_poison_or_paralysis_to_the_pokémon.
23	pressure	by_putting_pressure_on_the_opposing_pokémon_it_raises_their_pp_usage.
24	steadfast	the_pokémon's_determination_boosts_the_speed_stat_each_time_the_pokémon_flinches.
25	insomnia	the_pokémon_is_suffering_from_insomnia_and_cannot_fall_asleep.
26	magnet_pull	prevents_steel-type_pokémon_from_escaping_using_its_magnetic_force.
27	soundproof	soundproofing_gives_the_pokémon_full_immunity_to_all_sound-based_moves.
28	cute_charm	contact_with_the_pokémon_may_cause_infatuation.
29	flash_fire	powers_up_the_pokémon's_fire-type_moves_if_it's_hit_by_one.
30	snow_cloak	boosts_evasiveness_in_a_hailstorm.
31	chlorophyll	boosts_the_pokémon's_speed_stat_in_harsh_sunlight._
32	effect_spore	contact_with_the_pokémon_may_inflict_poison_sleep_or_paralysis_on_its_attacker.
33	sand_veil	boosts_the_pokémon's_evasiveness_in_a_sandstorm.
34	keen_eye	keen_eyes_prevent_other_pokémon_from_lowering_this_pokémon's_accuracy.
35	run_away	enables_a_sure_getaway_from_wild_pokémon.
36	gluttony	makes_the_pokémon_eat_a_held_berry_when_its_hp_drops_to_half_or_less_which_is_sooner_than_usual.
37	intimidate	the_pokémon_intimidates_opposing_pokémon_upon_entering_battle_lowering_their_attack_stat.
38	static	the_pokémon_is_charged_with_static_electricity_so_contact_with_it_may_cause_paralysis.
39	surge_surfer	doubles_the_pokémon's_speed_stat_on_electric_terrain.
40	pickup	the_pokémon_may_pick_up_the_item_an_opposing_pokémon_used_during_a_battle._it_may_pick_up_items_outside_of_battle_too.
41	battle_armor	hard_armor_protects_the_pokémon_from_critical_hits.
42	fur_coat	halves_the_damage_from_physical_moves.
43	damp	prevents_the_use_of_explosive_moves_such_as_self-destruct_by_dampening_its_surroundings.
44	rock_head	protects_the_pokémon_from_recoil_damage.
45	own_tempo	this_pokémon_has_its_own_tempo_and_that_prevents_it_from_becoming_confused.
46	levitate	by_floating_in_the_air_the_pokémon_receives_full_immunity_to_all_ground-type_moves.
47	lightning_rod	the_pokémon_draws_in_all_electric-type_moves._instead_of_being_hit_by_electric-type_moves_it_boosts_its_sp._atk.
48	natural_cure	all_status_conditions_heal_when_the_pokémon_switches_out.
49	early_bird	the_pokémon_awakens_from_sleep_twice_as_fast_as_other_pokémon.
50	swift_swim	boosts_the_pokémon's_speed_stat_in_rain.
51	illuminate	raises_the_likelihood_of_meeting_wild_pokémon_by_illuminating_the_surroundings.
52	oblivious	the_pokémon_is_oblivious_and_that_keeps_it_from_being_infatuated_or_falling_for_taunts.
53	flame_body	contact_with_the_pokémon_may_burn_the_attacker.
54	hyper_cutter	the_pokémon's_proud_of_its_powerful_pincers._they_prevent_other_pokémon_from_lowering_its_attack_stat.
55	water_absorb	restores_hp_if_hit_by_a_water-type_move_instead_of_taking_damage.
56	volt_absorb	restores_hp_if_hit_by_an_electric-type_move_instead_of_taking_damage.
57	trace	when_it_enters_a_battle_the_pokémon_copies_an_opposing_pokémon's_ability.
58	immunity	the_immune_system_of_the_pokémon_prevents_it_from_getting_poisoned.
59	hustle	boosts_the_attack_stat_but_lowers_accuracy.
60	sturdy	it_cannot_be_knocked_out_with_one_hit._one-hit_ko_moves_cannot_knock_it_out_either.
61	speed_boost	its_speed_stat_is_boosted_every_turn.
62	shadow_tag	this_pokémon_steps_on_the_opposing_pokémon's_shadow_to_prevent_it_from_escaping.
63	serene_grace	boosts_the_likelihood_of_additional_effects_occurring_when_attacking.
64	guts	it's_so_gutsy_that_having_a_status_condition_boosts_the_pokémon's_attack_stat.
65	magma_armor	the_pokémon_is_covered_with_hot_magma_which_prevents_the_pokémon_from_becoming_frozen.
66	suction_cups	this_pokémon_uses_suction_cups_to_stay_in_one_spot_to_negate_all_moves_and_items_that_force_switching_out.
67	vital_spirit	the_pokémon_is_full_of_vitality_and_that_prevents_it_from_falling_asleep.
68	sand_stream	the_pokémon_summons_a_sandstorm_when_it_enters_a_battle.
69	truant	the_pokémon_can't_use_a_move_if_it_had_used_a_move_on_the_previous_turn.
70	wonder_guard	its_mysterious_power_only_lets_supereffective_moves_hit_the_pokémon.
71	pure_power	using_its_pure_power_the_pokémon_doubles_its_attack_stat.
72	plus	boosts_the_sp._atk_stat_of_the_pokémon_if_an_ally_with_the_plus_or_minus_ability_is_also_in_battle.
73	minus	boosts_the_sp._atk_stat_of_the_pokémon_if_an_ally_with_the_plus_or_minus_ability_is_also_in_battle.
74	liquid_ooze	the_oozed_liquid_has_a_strong_stench_which_damages_attackers_using_any_draining_move.
75	rough_skin	this_pokémon_inflicts_damage_with_its_rough_skin_to_the_attacker_on_contact.
76	water_veil	the_pokémon_is_covered_with_a_water_veil_which_prevents_the_pokémon_from_getting_a_burn.
77	white_smoke	the_pokémon_is_protected_by_its_white_smoke_which_prevents_other_pokémon_from_lowering_its_stats.
78	marvel_scale	the_pokémon's_marvelous_scales_boost_the_defense_stat_if_it_has_a_status_condition.
79	forecast	the_pokémon_transforms_with_the_weather_to_change_its_type_to_water_fire_or_ice.
80	color_change	the_pokémon's_type_becomes_the_type_of_the_move_used_on_it.
81	shell_armor	a_hard_shell_protects_the_pokémon_from_critical_hits.
82	clear_body	prevents_other_pokémon's_moves_or_abilities_from_lowering_the_pokémon's_stats.
83	drizzle	the_pokémon_makes_it_rain_when_it_enters_a_battle.
84	air_lock	eliminates_the_effects_of_weather.
85	simple	the_stat_changes_the_pokémon_receives_are_doubled.
86	mold_breaker	moves_can_be_used_on_the_target_regardless_of_its_abilities.
87	anticipation	the_pokémon_can_sense_an_opposing_pokémon's_dangerous_moves.
88	honey_gather	the_pokémon_may_gather_honey_after_a_battle.
89	flower_gift	boosts_the_attack_and_sp._def_stats_of_itself_and_allies_in_harsh_sunlight.
90	sticky_hold	items_held_by_the_pokémon_are_stuck_fast_and_cannot_be_removed_by_other_pokémon.
91	technician	powers_up_the_pokémon's_weaker_moves.
92	aftermath	damages_the_attacker_if_it_contacts_the_pokémon_with_a_finishing_hit.
93	stench	by_releasing_stench_when_attacking_this_pokémon_may_cause_the_target_to_flinch.
94	snow_warning	the_pokémon_summons_a_hailstorm_when_it_enters_a_battle.
95	motor_drive	boosts_its_speed_stat_if_hit_by_an_electric-type_move_instead_of_taking_damage.
96	leaf_guard	prevents_status_conditions_in_harsh_sunlight.
97	slow_start	for_five_turns_the_pokémon's_attack_and_speed_stats_are_halved.
98	bad_dreams	reduces_the_hp_of_sleeping_opposing_pokémon.
99	multitype	changes_the_pokémon's_type_to_match_the_plate_or_z-crystal_it_holds.
100	victory_star	boosts_the_accuracy_of_its_allies_and_itself.
101	forewarn	when_it_enters_a_battle_the_pokémon_can_tell_one_of_the_moves_an_opposing_pokémon_has.
102	big_pecks	protects_the_pokémon_from_defense-lowering_effects.
103	unaware	when_attacking_the_pokémon_ignores_the_target_pokémon's_stat_changes.
104	sand_rush	boosts_the_pokémon's_speed_stat_in_a_sandstorm.
105	healer	sometimes_heals_an_ally's_status_condition.
106	prankster	gives_priority_to_a_status_move.
107	reckless	powers_up_moves_that_have_recoil_damage.
108	sheer_force	removes_additional_effects_to_increase_the_power_of_moves_when_attacking.
109	wonder_skin	makes_status_moves_more_likely_to_miss.
110	mummy	contact_with_the_pokémon_changes_the_attacker's_ability_to_mummy.
111	solid_rock	reduces_the_power_of_supereffective_attacks_taken.
112	defeatist	halves_the_pokémon's_attack_and_sp._atk_stats_when_its_hp_becomes_half_or_less.
113	illusion	comes_out_disguised_as_the_pokémon_in_the_party's_last_spot.
114	frisk	when_it_enters_a_battle_the_pokémon_can_check_an_opposing_pokémon's_held_item.
115	overcoat	protects_the_pokémon_from_things_like_sand_hail_and_powder.
116	ice_body	the_pokémon_gradually_regains_hp_in_a_hailstorm.
117	iron_barbs	inflicts_damage_on_the_attacker_upon_contact_with_iron_barbs.
118	telepathy	anticipates_an_ally's_attack_and_dodges_it.
119	iron_fist	powers_up_punching_moves.
120	defiant	boosts_the_pokémon's_attack_stat_sharply_when_its_stats_are_lowered.
121	justified	being_hit_by_a_dark-type_move_boosts_the_attack_stat_of_the_pokémon_for_justice.
122	turboblaze	moves_can_be_used_on_the_target_regardless_of_its_abilities.
123	teravolt	moves_can_be_used_on_the_target_regardless_of_its_abilities.
124	sand_force	boosts_the_power_of_rock-_ground-_and_steel-type_moves_in_a_sandstorm.
125	download	compares_an_opposing_pokémon's_defense_and_sp._def_stats_before_raising_its_own_attack_or_sp._atk_stat—whichever_will_be_more_effective.
126	flower_veil	ally_grass-type_pokémon_are_protected_from_status_conditions_and_the_lowering_of_their_stats.
127	sap_sipper	boosts_the_attack_stat_if_hit_by_a_grass-type_move_instead_of_taking_damage.
128	stance_change	the_pokémon_changes_its_form_to_blade_forme_when_it_uses_an_attack_move_and_changes_to_shield_forme_when_it_uses_king's_shield.
129	sweet_veil	prevents_itself_and_ally_pokémon_from_falling_asleep.
130	dry_skin	restores_hp_in_rain_or_when_hit_by_water-type_moves._reduces_hp_in_harsh_sunlight_and_increases_the_damage_received_from_fire-type_moves.
131	strong_jaw	the_pokémon's_strong_jaw_boosts_the_power_of_its_biting_moves.
132	refrigerate	normal-type_moves_become_ice-type_moves._the_power_of_those_moves_is_boosted_a_little.
133	cheek_pouch	restores_hp_as_well_when_the_pokémon_eats_a_berry.
134	fairy_aura	powers_up_each_pokémon's_fairy-type_moves.
135	dark_aura	powers_up_each_pokémon's_dark-type_moves.
136	aura_break	the_effects_of_aura_abilities_are_reversed_to_lower_the_power_of_affected_moves.
137	magician	the_pokémon_steals_the_held_item_of_a_pokémon_it_hits_with_a_move.
138	stakeout	doubles_the_damage_dealt_to_the_target's_replacement_if_the_target_switches_out.
139	battery	powers_up_ally_pokémon's_special_moves.
140	dancer	when_another_pokémon_uses_a_dance_move_it_can_use_a_dance_move_following_it_regardless_of_its_speed.
208	dragon's_maw	powers_up_dragon-type_moves.
141	schooling	when_it_has_a_lot_of_hp_the_pokémon_forms_a_powerful_school._it_stops_schooling_when_its_hp_is_low.__doesn't_work_until_level_20.
142	merciless	the_pokémon's_attacks_become_critical_hits_if_the_target_is_poisoned.
143	water_bubble	lowers_the_power_of_fire-type_moves_done_to_the_pokémon_and_prevents_the_pokémon_from_getting_a_burn.
144	corrosion	the_pokémon_can_poison_the_target_even_if_it's_a_steel_or_poison_type.
145	fluffy	halves_the_damage_taken_from_moves_that_make_direct_contact_but_doubles_that_of_fire-type_moves.
146	receiver	the_pokémon_copies_the_ability_of_a_defeated_ally.
147	wimp_out	the_pokémon_cowardly_switches_out_when_its_hp_becomes_half_or_less.
148	emergency_exit	the_pokémon_sensing_danger_switches_out_when_its_hp_becomes_half_or_less.
149	water_compaction	boosts_the_pokémon's_defense_stat_sharply_when_hit_by_a_water-type_move.
150	innards_out	damages_the_attacker_landing_the_finishing_hit_by_the_amount_equal_to_its_last_hp.
151	rks_system	changes_the_pokémon's_type_to_match_the_memory_disc_it_holds.
152	shields_down	when_its_hp_becomes_half_or_less_the_pokémon's_shell_breaks_and_it_becomes_aggressive.
153	comatose	it's_always_drowsing_and_will_never_wake_up._it_can_attack_without_waking_up.
154	disguise	once_per_battle_the_shroud_that_covers_the_pokémon_can_protect_it_from_an_attack.
155	dazzling	surprises_the_opposing_pokémon_making_it_unable_to_attack_using_priority_moves.
156	berserk	boosts_the_pokémon's_sp._atk_stat_when_it_takes_a_hit_that_causes_its_hp_to_become_half_or_less.
157	steelworker	powers_up_steel-type_moves.
158	bulletproof	protects_the_pokémon_from_some_ball_and_bomb_moves.
159	electric_surge	turns_the_ground_into_electric_terrain_when_the_pokémon_enters_a_battle.
160	psychic_surge	turns_the_ground_into_psychic_terrain_when_the_pokémon_enters_a_battle.
161	grassy_surge	turns_the_ground_into_grassy_terrain_when_the_pokémon_enters_a_battle.
162	misty_surge	turns_the_ground_into_misty_terrain_when_the_pokémon_enters_a_battle.
163	full_metal_body	prevents_other_pokémon's_moves_or_abilities_from_lowering_the_pokémon's_stats.
164	shadow_shield	reduces_the_amount_of_damage_the_pokémon_takes_while_its_hp_is_full.
165	beast_boost	the_pokémon_boosts_its_most_proficient_stat_each_time_it_knocks_out_a_pokémon.
166	prism_armor	reduces_the_power_of_supereffective_attacks_taken.
167	soul-heart	boosts_its_sp._atk_stat_every_time_a_pokémon_faints.
168	quick_draw	enables_the_pokémon_to_move_first_occasionally.
169	poison_touch	may_poison_a_target_when_the_pokémon_makes_contact.
170	cursed_body	may_disable_a_move_used_on_the_pokémon.
171	tangled_feet	raises_evasiveness_if_the_pokémon_is_confused.
172	parental_bond	parent_and_child_each_attacks.
173	aerilate	normal-type_moves_become_flying-type_moves._the_power_of_those_moves_is_boosted_a_little.
174	competitive	boosts_the_sp._atk_stat_sharply_when_a_stat_is_lowered.
175	curious_medicine	when_the_pokémon_is_brought_into_battle_any_stat_alterations_of_allies_are_removed.
176	weak_armor	physical_attacks_to_the_pokémon_lower_its_defense_stat_but_sharply_raise_its_speed_stat.
177	skill_link	maximizes_the_number_of_times_multistrike_moves_hit.
178	solar_power	boosts_the_sp._atk_stat_in_harsh_sunlight_but_hp_decreases_every_turn.
179	neuroforce	powers_up_moves_that_are_super_effective.
180	power_spot	just_being_next_to_the_pokémon_powers_up_moves.
181	regenerator	restores_a_little_hp_when_withdrawn_from_battle.
182	light_metal	halves_the_pokémon's_weight.
183	hunger_switch	the_pokémon_changes_its_form_alternating_between_its_full_belly_mode_and_hangry_mode_after_the_end_of_each_turn.
184	battle_bond	defeating_an_opposing_pokémon_strengthens_the_pokémon's_bond_with_its_trainer_and_it_becomes_ash-greninja._water_shuriken_gets_more_powerful.
185	delta_stream	the_pokémon_changes_the_weather_to_eliminate_all_of_the_flying_type's_weaknesses.
186	primordial_sea	the_pokémon_changes_the_weather_to_nullify_fire-type_attacks.
187	desolate_land	the_pokémon_changes_the_weather_to_nullify_water-type_attacks.
188	filter	reduces_the_power_of_supereffective_attacks_taken.
189	pixilate	normal-type_moves_become_fairy-type_moves._the_power_of_those_moves_is_boosted_a_little.
190	intrepid_sword	boosts_the_pokémon's_attack_stat_when_the_pokémon_enters_a_battle.
191	dauntless_shield	boosts_the_pokémon's_defense_stat_when_the_pokémon_enters_a_battle.
192	wandering_spirit	the_pokémon_exchanges_abilities_with_a_pokémon_that_hits_it_with_a_move_that_makes_direct_contact.
193	ice_face	the_pokémon's_ice_head_can_take_a_physical_attack_as_a_substitute_but_the_attack_also_changes_the_pokémon's_appearance._the_ice_will_be_restored_when_it_hails.
194	cotton_down	when_the_pokémon_is_hit_by_an_attack_it_scatters_cotton_fluff_around_and_lowers_the_speed_stat_of_all_pokémon_except_itself.
195	ball_fetch	if_the_pokémon_is_not_holding_an_item_it_will_fetch_the_poke_ball_from_the_first_failed_throw_of_the_battle.
196	steam_engine	boosts_the_pokémon's_speed_stat_drastically_if_hit_by_a_fire-_or_water-type_move.
197	ripen	ripens_berries_and_doubles_their_effect.
198	sand_spit	the_pokémon_creates_a_sandstorm_when_it's_hit_by_an_attack.
199	gulp_missile	when_the_pokémon_uses_surf_or_dive_it_will_come_back_with_prey._when_it_takes_damage_it_will_spit_out_the_prey_to_attack.
200	mimicry	changes_the_pokémon's_type_depending_on_the_terrain.
201	zen_mode	changes_the_pokémon's_shape_when_hp_is_half_or_less.
202	gorilla_tactics	boosts_the_pokémon's_attack_stat_but_only_allows_the_use_of_the_first_selected_move.
203	magic_bounce	reflects_status_moves_instead_of_getting_hit_by_them.
204	huge_power	doubles_the_pokémon's_attack_stat.
205	power_construct	other_cells_gather_to_aid_when_its_hp_becomes_half_or_less._then_the_pokémon_changes_its_form_to_complete_forme.
206	scrappy	the_pokémon_can_hit_ghost-type_pokémon_with_normal-_and_fighting-type_moves.
207	transistor	powers_up_electric-type_moves.
209	chilling_neigh	when_the_pokémon_knocks_out_a_target_it_utters_a_chilling_neigh_which_boosts_its_attack_stat.
210	grim_neigh	when_the_pokémon_knocks_out_a_target_it_utters_a_terrifying_neigh_which_boosts_its_special_attack_stat.
211	as_one	this_ability_combines_the_effects_of_both_calyrex’s_unnerve_ability_and_glastrier’s/spectrier’s_chilling_neigh/grim_neigh_ability.
212	NULL	NULL
213	magic_guard	the_pokémon_only_takes_damage_from_attacks.
214	tinted_lens	the_pokémon_can_use_not_very_effective_moves_to_deal_regular_damage.
215	arena_trap	prevents_opposing_pokémon_from_fleeing.
216	tangling_hair	contact_with_the_pokémon_lowers_the_attacker's_speed_stat.
217	cloud_nine	eliminates_the_effects_of_weather.
218	sniper	powers_up_moves_if_they_become_critical_hits_when_attacking.
219	anger_point	the_pokémon_is_angered_when_it_takes_a_critical_hit_and_that_maxes_its_attack_stat.
220	super_luck	the_pokémon_is_so_lucky_that_the_critical-hit_ratios_of_its_moves_are_boosted.
221	quick_feet	boosts_the_speed_stat_if_the_pokémon_has_a_status_condition.
222	rain_dish	the_pokémon_gradually_regains_hp_in_rain._
223	poison_heal	restores_hp_if_the_pokémon_is_poisoned_instead_of_losing_hp.
224	normalize	all_the_pokémon's_moves_become_normal_type._the_power_of_those_moves_is_boosted_a_little.
225	stall	the_pokémon_moves_after_all_other_pokémon_do.
226	storm_drain	draws_in_all_water-type_moves._instead_of_being_hit_by_water-type_moves_it_boosts_its_sp._atk.
227	unburden	boosts_the_speed_stat_if_the_pokémon's_held_item_is_used_or_lost.
228	klutz	the_pokémon_can't_use_any_held_items.
229	heatproof	the_heatproof_body_of_the_pokémon_halves_the_damage_from_fire-type_moves_that_hit_it.
230	infiltrator	passes_through_the_opposing_pokémon's_barrier_substitute_and_the_like_and_strikes.
231	moxie	the_pokémon_shows_moxie_and_that_boosts_the_attack_stat_after_knocking_out_any_pokémon.
232	slush_rush	boosts_the_pokémon's_speed_stat_in_a_hailstorm.
233	contrary	makes_stat_changes_have_an_opposite_effect.
234	stamina	boosts_the_defense_stat_when_hit_by_an_attack.
235	queenly_majesty	its_majesty_pressures_the_opposing_pokémon_making_it_unable_to_attack_using_priority_moves.
236	triage	gives_priority_to_a_healing_move.
237	pastel_veil	protects_the_pokémon_and_its_ally_pokémon_from_being_poisoned.
238	neutralizing_gas	if_the_pokémon_with_neutralizing_gas_is_in_the_battle_the_effects_of_all_pokémon's_abilities_will_be_nullified_or_will_not_be_triggered.
239	screen_cleaner	when_the_pokémon_enters_a_battle_the_effects_of_light_screen_reflect_and_aurora_veil_are_nullified_for_both_opposing_and_ally_pokémon.
240	heavy_metal	doubles_the_pokémon's_weight.
241	imposter	the_pokémon_transforms_itself_into_the_pokémon_it's_facing.
242	analytic	boosts_move_power_when_the_pokémon_moves_last.
243	friend_guard	reduces_damage_done_to_allies.
244	steely_spirit	powers_up_ally_pokémon's_steel-type_moves.
245	harvest	may_create_another_berry_after_one_is_used.
246	multiscale	reduces_the_amount_of_damage_the_pokémon_takes_while_its_hp_is_full.
247	pickpocket	steals_an_item_from_an_attacker_that_made_direct_contact.
248	moody	raises_one_stat_sharply_and_lowers_another_every_turn.
249	toxic_boost	powers_up_physical_attacks_when_the_pokémon_is_poisoned.
250	protean	changes_the_pokémon's_type_to_the_type_of_the_move_it's_about_to_use.
251	flare_boost	powers_up_special_attacks_when_the_pokémon_is_burned.
252	symbiosis	the_pokémon_passes_its_item_to_an_ally_that_has_used_up_an_item.
253	gale_wings	gives_priority_to_flying-type_moves_when_the_pokémon's_hp_is_full.
254	grass_pelt	boosts_the_pokémon's_defense_stat_on_grassy_terrain.
255	aroma_veil	protects_itself_and_its_allies_from_attacks_that_limit_their_move_choices.
256	gooey	contact_with_the_pokémon_lowers_the_attacker's_speed_stat.
257	long_reach	the_pokémon_uses_its_moves_without_making_contact_with_the_target.
258	liquid_voice	all_sound-based_moves_become_water-type_moves.
259	galvanize	normal-type_moves_become_electric-type_moves._the_power_of_those_moves_is_boosted_a_little.
260	power_of_alchemy	the_pokémon_copies_the_ability_of_a_defeated_ally.
261	perish_body	when_hit_by_a_move_that_makes_direct_contact_the_pokémon_and_the_attacker_will_faint_after_three_turns_unless_they_switch_out_of_battle.
262	stalwart	ignores_the_effects_of_opposing_pokémon's_abilities_and_moves_that_draw_in_moves.
263	libero	changes_the_pokémon's_type_to_the_type_of_the_move_it's_about_to_use.
264	mirror_armor	bounces_back_only_the_stat-lowering_effects_that_the_pokémon_receives.
265	ice_scales	the_pokémon_is_protected_by_ice_scales_which_halve_the_damage_taken_from_special_moves.
266	propeller_tail	ignores_the_effects_of_opposing_pokémon's_abilities_and_moves_that_draw_in_moves.
\.


--
-- Data for Name: egg_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.egg_groups (id, egg_group) FROM stdin;
0	amorphous
1	bug
2	ditto
3	dragon
4	fairy
5	field
6	flying
7	grass
8	human-like
9	mineral
10	monster
11	undiscovered
12	water_1
13	water_2
14	water_3
15	NULL
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.games (id, game) FROM stdin;
0	black_/_white
1	black_2_/_white_2
2	diamond_/_pearl
3	emerald
4	fire_red
5	gold_/_silver_/_crystal
6	leaf_green
7	let's_go_pikachu_/_let's_go_eevee
8	omega_ruby_/_alpha_sapphire
9	platinum
10	red_/_blue_/_yellow
11	ruby_/_sapphire
12	sun_/_moon
13	sword_/_shield
14	ultra_sun_/_ultra_moon
15	x_/_y
\.


--
-- Data for Name: legendaries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.legendaries (id, legendary_status) FROM stdin;
0	NULL
1	legendary
2	mythical
3	sub-legendary
\.


--
-- Data for Name: pokemon; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pokemon (id, pokedex_number, pokemon_name, is_legendary, type1_id, type2_id, ability1_id, ability2_id, hidden_ability, health, attack, defense, special_attack, special_defense, speed, region_id, catch_rate, male_percent, game_id, egg_group1_id, egg_group2_id) FROM stdin;
0	1	bulbasaur	0	10	14	0	212	31	45	49	49	65	0	45	5	45	87.5	10	10	7
1	2	ivysaur	0	10	14	0	212	31	60	62	63	80	0	60	5	45	87.5	10	10	7
2	3	venusaur	0	10	14	0	212	31	80	82	83	100	0	80	5	45	87.5	10	10	7
3	4	charmander	0	7	0	2	212	178	39	52	43	50	0	65	5	45	87.5	10	10	3
4	5	charmeleon	0	7	0	2	212	178	58	64	58	65	0	80	5	45	87.5	10	10	3
5	6	charizard	0	7	8	2	212	178	78	84	78	85	0	100	5	45	87.5	10	10	3
6	7	squirtle	0	18	0	5	212	222	44	48	65	50	0	43	5	45	87.5	10	10	12
7	8	wartortle	0	18	0	5	212	222	59	63	80	65	0	58	5	45	87.5	10	10	12
8	9	blastoise	0	18	0	5	212	222	79	83	100	85	0	78	5	45	87.5	10	10	12
9	848	toxel	0	4	14	7	38	228	40	38	35	54	35	40	1	75	50.0	13	11	15
10	849	toxtricity	0	4	14	8	72	91	75	98	70	114	70	75	1	45	50.0	13	8	15
11	30	nidorina	0	14	0	9	10	59	70	62	67	55	0	56	5	120	0.0	10	11	15
12	31	nidoqueen	0	14	11	9	10	108	90	92	87	75	85	76	5	45	0.0	10	11	15
13	392	infernape	0	7	6	2	212	119	76	104	71	104	71	108	6	45	87.5	2	5	8
14	403	shinx	0	4	0	10	37	64	45	65	34	40	34	45	6	235	50.0	2	5	15
15	404	luxio	0	4	0	10	37	64	60	85	49	60	49	60	6	120	50.0	2	5	15
16	405	luxray	0	4	0	10	37	64	80	120	79	95	79	70	6	45	50.0	2	5	15
17	11	metapod	0	1	0	11	212	212	50	20	55	25	0	30	5	120	50.0	10	1	15
18	12	butterfree	0	1	8	12	212	214	60	45	50	90	80	70	5	45	50.0	10	1	15
19	679	honedge	0	17	9	13	212	212	45	80	100	35	37	28	4	180	50.0	15	9	15
20	680	doublade	0	17	9	13	212	212	59	110	150	45	49	35	4	90	50.0	15	9	15
21	15	beedrill	0	1	14	14	212	218	65	90	40	45	80	75	5	45	50.0	10	1	15
22	132	ditto	0	13	0	16	212	241	48	48	48	48	0	48	5	35	0.0	10	2	15
23	14	kakuna	0	1	14	11	212	212	45	25	50	25	0	35	5	120	50.0	10	1	15
24	13	weedle	0	1	14	17	212	35	40	35	30	20	0	50	5	255	50.0	10	1	15
25	10	caterpie	0	1	0	17	212	35	45	30	35	20	0	45	5	255	50.0	10	1	15
26	29	nidoran_f	0	14	0	9	10	59	55	47	52	40	0	41	5	235	0.0	10	10	5
27	390	chimchar	0	7	0	2	212	119	44	58	44	58	44	61	6	45	87.5	2	5	8
28	391	monferno	0	7	6	2	212	119	64	78	52	78	52	81	6	45	87.5	2	5	8
29	489	phione	2	18	0	18	212	212	80	80	80	80	80	80	6	30	0.0	2	12	4
30	490	manaphy	2	18	0	18	212	212	100	100	100	100	100	100	6	3	0.0	2	12	4
31	891	kubfu	3	6	0	19	212	212	60	90	60	53	50	72	1	3	87.5	13	11	15
32	892	urshifu	3	6	2	20	212	212	100	130	100	63	60	97	1	3	87.5	13	11	15
33	898	calyrex	1	15	10	21	212	212	100	80	80	80	80	80	1	3	0.0	13	11	15
34	151	mew	2	15	0	22	212	212	100	100	100	100	0	100	5	45	0.0	10	11	15
35	150	mewtwo	1	15	0	23	212	21	106	110	90	154	0	130	5	3	0.0	10	11	15
36	81	magnemite	0	4	17	26	60	242	25	35	70	95	0	45	5	190	0.0	10	9	15
37	100	voltorb	0	4	0	27	38	92	40	30	50	55	0	100	5	190	0.0	10	9	15
38	32	nidoran_m	0	14	0	9	10	59	46	57	40	40	0	50	5	235	100.0	10	10	5
39	33	nidorino	0	14	0	9	10	59	61	72	57	55	0	65	5	120	100.0	10	10	5
40	34	nidoking	0	14	11	9	10	108	81	102	77	85	75	85	5	45	100.0	10	10	5
41	173	cleffa	0	5	0	28	203	243	50	25	28	45	55	15	3	150	25.0	5	11	15
42	35	clefairy	0	5	0	28	213	243	70	45	48	60	0	35	5	150	25.0	10	4	15
43	36	clefable	0	5	0	28	213	103	95	70	73	95	90	60	5	25	25.0	10	4	15
44	37	vulpix	0	7	0	29	212	4	38	41	40	65	0	65	5	190	25.0	10	5	15
45	38	ninetales	0	7	0	29	212	4	73	76	75	100	0	100	5	75	25.0	10	5	15
46	174	igglybuff	0	13	5	28	174	243	90	30	15	40	20	15	3	170	25.0	5	11	15
47	39	jigglypuff	0	13	5	28	174	243	115	45	20	25	0	20	5	170	25.0	10	4	15
48	40	wigglytuff	0	13	5	28	174	114	140	70	45	85	50	45	5	50	25.0	10	4	15
49	41	zubat	0	14	8	19	212	230	40	45	35	40	0	55	5	255	50.0	10	6	15
50	42	golbat	0	14	8	19	212	230	75	80	70	75	0	95	5	90	50.0	10	6	15
51	169	crobat	0	14	8	19	212	230	85	90	80	70	80	130	3	90	50.0	5	6	15
52	43	oddish	0	10	14	31	212	35	45	50	55	75	0	30	5	255	50.0	10	7	15
53	44	gloom	0	10	14	31	212	93	60	65	70	85	0	40	5	120	50.0	10	7	15
54	45	vileplume	0	10	14	31	212	32	75	80	85	110	90	50	5	45	50.0	10	7	15
55	182	bellossom	0	10	0	31	212	105	75	80	95	90	100	50	3	45	50.0	5	7	15
56	46	paras	0	1	10	32	130	43	35	70	55	55	0	25	5	190	50.0	10	1	7
57	47	parasect	0	1	10	32	130	43	60	95	80	80	0	30	5	75	50.0	10	1	7
58	48	venonat	0	1	14	12	214	35	60	55	50	40	0	45	5	190	50.0	10	1	15
59	49	venomoth	0	1	14	17	214	109	70	65	60	90	0	90	5	75	50.0	10	1	15
60	50	diglett	0	11	0	33	215	124	10	55	25	45	0	95	5	255	50.0	10	5	15
61	51	dugtrio	0	11	0	33	215	124	35	100	50	50	70	120	5	50	50.0	10	5	15
62	16	pidgey	0	13	8	34	171	102	40	45	40	35	0	56	5	255	50.0	10	6	15
63	17	pidgeotto	0	13	8	34	171	102	63	60	55	50	0	71	5	120	50.0	10	6	15
64	18	pidgeot	0	13	8	34	171	102	83	80	75	70	70	101	5	45	50.0	10	6	15
65	19	rattata	0	13	0	35	64	59	30	56	35	25	0	72	5	255	50.0	10	5	15
66	20	raticate	0	13	0	35	64	59	55	81	60	50	0	97	5	127	50.0	10	5	15
67	21	spearow	0	13	8	34	212	218	40	60	30	31	0	70	5	255	50.0	10	6	15
68	22	fearow	0	13	8	34	212	218	65	90	65	61	0	100	5	90	50.0	10	6	15
69	23	ekans	0	14	0	37	11	21	35	60	44	40	0	55	5	255	50.0	10	5	3
70	24	arbok	0	14	0	37	11	21	60	95	69	65	79	80	5	90	50.0	10	5	3
71	172	pichu	0	4	0	38	212	47	20	40	15	35	35	60	3	190	50.0	5	11	15
72	25	pikachu	0	4	0	38	212	47	35	55	40	50	0	90	5	190	50.0	10	5	4
73	26	raichu	0	4	0	38	212	47	60	90	55	90	80	110	5	75	50.0	10	5	4
74	27	sandshrew	0	11	0	33	212	104	50	75	85	30	0	40	5	255	50.0	10	5	15
75	28	sandslash	0	11	0	33	212	104	75	100	110	55	0	65	5	90	50.0	10	5	15
76	52	meowth	0	13	0	40	91	21	40	45	35	40	0	90	5	255	50.0	10	5	15
77	863	perrserker	0	17	0	41	3	244	70	110	100	50	60	50	1	90	50.0	13	5	15
78	53	persian	0	13	0	16	91	21	65	70	60	65	0	115	5	90	50.0	10	5	15
79	54	psyduck	0	18	0	43	217	50	50	52	48	50	0	55	5	190	50.0	10	12	5
80	101	electrode	0	4	0	27	38	92	60	50	70	80	80	150	5	60	0.0	10	9	15
81	102	exeggcute	0	10	15	31	212	245	60	40	80	60	0	40	5	90	50.0	10	7	15
82	103	exeggutor	0	10	15	31	212	245	95	95	85	125	75	55	5	45	50.0	10	7	15
83	104	cubone	0	11	0	44	47	41	50	50	95	40	0	35	5	190	50.0	10	10	15
84	105	marowak	0	11	0	44	47	41	60	80	110	50	0	45	5	75	50.0	10	10	15
85	106	hitmonlee	0	6	0	16	107	227	50	120	53	35	0	87	5	45	100.0	10	8	15
86	107	hitmonchan	0	6	0	34	119	19	50	105	79	35	0	76	5	45	100.0	10	8	15
87	108	lickitung	0	13	0	45	52	217	90	55	75	60	0	30	5	45	50.0	10	10	15
88	109	koffing	0	14	0	46	212	212	40	65	95	60	0	35	5	190	50.0	10	0	15
89	110	weezing	0	14	0	46	212	212	65	90	120	85	0	60	5	60	50.0	10	0	15
90	111	rhyhorn	0	11	16	47	44	107	80	85	95	30	0	25	5	120	50.0	10	10	5
91	112	rhydon	0	11	16	47	44	107	105	130	120	45	0	40	5	60	50.0	10	10	5
92	113	chansey	0	13	0	48	63	105	250	5	5	105	0	50	5	30	0.0	10	4	15
93	114	tangela	0	10	0	31	96	181	65	55	115	100	0	60	5	45	50.0	10	7	15
94	115	kangaskhan	0	13	0	49	206	19	105	95	80	40	0	90	5	45	0.0	10	10	15
95	116	horsea	0	18	0	50	218	43	30	40	70	70	0	60	5	225	50.0	10	12	3
96	117	seadra	0	18	0	9	218	43	55	65	95	95	0	85	5	75	50.0	10	12	3
97	118	goldeen	0	18	0	50	76	47	45	67	60	50	0	63	5	225	50.0	10	13	15
98	119	seaking	0	18	0	50	76	47	80	92	65	80	0	68	5	60	50.0	10	13	15
99	120	staryu	0	18	0	51	48	242	30	45	55	70	0	85	5	225	0.0	10	14	15
100	121	starmie	0	18	15	51	48	242	60	75	85	100	0	115	5	60	0.0	10	14	15
101	122	mr._mime	0	15	5	27	188	91	40	45	65	100	0	90	5	45	50.0	10	8	15
102	123	scyther	0	1	8	14	91	24	70	110	80	55	0	105	5	45	50.0	10	1	15
103	124	jynx	0	12	15	52	101	130	65	50	35	95	0	95	5	45	0.0	10	8	15
104	125	electabuzz	0	4	0	38	212	67	65	83	57	85	0	105	5	45	75.0	10	8	15
105	126	magmar	0	7	0	53	212	67	65	95	57	85	0	93	5	45	75.0	10	8	15
106	127	pinsir	0	1	0	54	86	231	65	125	100	55	0	85	5	45	50.0	10	1	15
107	128	tauros	0	13	0	37	219	108	75	100	95	70	0	110	5	45	100.0	10	5	15
108	129	magikarp	0	18	0	50	212	7	20	10	55	20	0	80	5	255	50.0	10	13	3
109	130	gyarados	0	18	8	37	212	231	95	125	79	100	0	81	5	45	50.0	10	13	3
110	131	lapras	0	18	12	55	81	18	130	85	80	95	0	60	5	45	50.0	10	10	12
111	133	eevee	0	13	0	35	15	87	55	55	50	65	0	55	5	45	87.5	10	5	15
112	134	vaporeon	0	18	0	55	212	18	130	65	60	110	0	65	5	45	87.5	10	5	15
113	135	jolteon	0	4	0	56	212	221	65	65	60	110	0	130	5	45	87.5	10	5	15
114	136	flareon	0	7	0	29	212	64	65	130	60	110	0	65	5	45	87.5	10	5	15
115	137	porygon	0	13	0	57	125	242	65	60	70	75	0	40	5	45	0.0	10	9	15
116	138	omanyte	0	16	18	50	81	176	35	40	100	90	0	35	5	45	87.5	10	12	14
117	139	omastar	0	16	18	50	81	176	70	60	125	115	0	55	5	45	87.5	10	12	14
118	140	kabuto	0	16	18	50	41	176	30	80	90	45	0	55	5	45	87.5	10	12	14
119	141	kabutops	0	16	18	50	41	176	60	115	105	70	0	80	5	45	87.5	10	12	14
120	142	aerodactyl	0	16	8	44	23	21	80	105	65	60	0	130	5	45	87.5	10	6	15
121	143	snorlax	0	13	0	58	1	36	160	110	65	65	0	30	5	25	87.5	10	10	15
122	144	articuno	3	12	8	23	212	30	90	85	100	125	0	85	5	3	0.0	10	11	15
123	145	zapdos	3	4	8	23	212	38	90	90	85	125	0	100	5	3	0.0	10	11	15
124	146	moltres	3	7	8	23	212	53	90	100	90	125	0	90	5	3	0.0	10	11	15
125	147	dratini	0	3	0	11	212	78	41	64	45	50	0	50	5	45	50.0	10	12	3
126	148	dragonair	0	3	0	11	212	78	61	84	65	70	0	70	5	45	50.0	10	12	3
127	149	dragonite	0	3	8	19	212	246	91	134	95	100	0	80	5	45	50.0	10	12	3
128	152	chikorita	0	10	0	0	212	96	45	49	65	49	65	45	3	45	87.5	5	10	7
129	153	bayleef	0	10	0	0	212	96	60	62	80	63	80	60	3	45	87.5	5	10	7
130	154	meganium	0	10	0	0	212	96	80	82	100	83	100	80	3	45	87.5	5	10	7
131	155	cyndaquil	0	7	0	2	212	29	39	52	43	60	50	65	3	45	87.5	5	5	15
132	156	quilava	0	7	0	2	212	29	58	64	58	80	65	80	3	45	87.5	5	5	15
133	157	typhlosion	0	7	0	2	212	29	78	84	78	109	85	100	3	45	87.5	5	5	15
134	158	totodile	0	18	0	5	212	108	50	65	64	44	48	43	3	45	87.5	5	10	12
135	159	croconaw	0	18	0	5	212	108	65	80	80	59	63	58	3	45	87.5	5	10	12
136	160	feraligatr	0	18	0	5	212	108	85	105	100	79	83	78	3	45	87.5	5	10	12
137	161	sentret	0	13	0	35	34	114	35	46	34	35	45	20	3	255	50.0	5	5	15
138	162	furret	0	13	0	35	34	114	85	76	64	45	55	90	3	90	50.0	5	5	15
139	163	hoothoot	0	13	8	25	34	214	60	30	30	36	56	50	3	255	50.0	5	6	15
140	164	noctowl	0	13	8	25	34	214	100	50	50	86	96	70	3	90	50.0	5	6	15
141	165	ledyba	0	1	8	14	49	7	40	20	30	40	80	55	3	255	50.0	5	1	15
142	166	ledian	0	1	8	14	49	119	55	35	50	55	110	85	3	90	50.0	5	1	15
143	167	spinarak	0	1	14	14	25	218	40	60	40	40	40	30	3	255	50.0	5	1	15
144	168	ariados	0	1	14	14	25	218	70	90	70	60	70	40	3	90	50.0	5	1	15
145	170	chinchou	0	18	4	56	51	55	75	38	38	56	56	67	3	190	50.0	5	13	15
146	171	lanturn	0	18	4	56	51	55	125	58	58	76	76	67	3	75	50.0	5	13	15
147	175	togepi	0	5	0	59	63	220	35	20	65	40	65	20	3	190	87.5	5	11	15
148	176	togetic	0	5	8	59	63	220	55	40	85	80	105	40	3	75	87.5	5	6	4
149	177	natu	0	15	8	22	49	203	40	50	45	70	45	70	3	190	50.0	5	6	15
150	178	xatu	0	15	8	22	49	203	65	75	70	95	70	95	3	75	50.0	5	6	15
151	179	mareep	0	4	0	38	212	72	55	40	40	65	45	35	3	235	50.0	5	10	5
152	180	flaaffy	0	4	0	38	212	72	70	55	55	80	60	45	3	120	50.0	5	10	5
153	181	ampharos	0	4	0	38	212	72	90	75	85	115	90	55	3	45	50.0	5	10	5
154	183	marill	0	18	5	1	204	127	70	20	50	20	50	40	3	190	50.0	5	12	4
155	184	azumarill	0	18	5	1	204	127	100	50	80	60	80	50	3	75	50.0	5	12	4
156	185	sudowoodo	0	16	0	60	44	7	70	110	115	30	65	30	3	65	50.0	5	9	15
157	186	politoed	0	18	0	55	43	83	90	75	75	90	100	70	3	45	50.0	5	12	15
158	187	hoppip	0	10	8	31	96	230	35	35	40	35	55	50	3	255	50.0	5	4	7
159	188	skiploom	0	10	8	31	96	230	55	45	50	45	65	80	3	120	50.0	5	4	7
160	189	jumpluff	0	10	8	31	96	230	75	55	70	55	95	110	3	45	50.0	5	4	7
161	190	aipom	0	13	0	35	40	177	55	70	55	40	55	85	3	45	50.0	5	5	15
162	191	sunkern	0	10	0	31	178	49	30	30	30	30	30	30	3	235	50.0	5	7	15
163	192	sunflora	0	10	0	31	178	49	75	75	55	105	85	30	3	120	50.0	5	7	15
164	193	yanma	0	1	8	61	12	114	65	65	45	75	45	95	3	75	50.0	5	1	15
165	194	wooper	0	18	11	43	55	103	55	45	45	25	25	15	3	255	50.0	5	12	5
166	195	quagsire	0	18	11	43	55	103	95	85	85	65	65	35	3	90	50.0	5	12	5
167	196	espeon	0	15	0	22	212	203	65	65	60	130	95	110	3	45	87.5	5	5	15
168	197	umbreon	0	2	0	22	212	19	95	65	110	60	130	65	3	45	87.5	5	5	15
169	198	murkrow	0	2	8	25	220	106	60	85	42	85	42	91	3	30	50.0	5	6	15
170	199	slowking	0	18	15	52	45	181	95	75	80	100	110	30	3	70	50.0	5	10	12
171	200	misdreavus	0	9	0	46	212	212	60	60	60	85	85	85	3	45	50.0	5	0	15
172	201	unown	0	15	0	46	212	212	48	72	48	72	48	48	3	225	0.0	5	11	15
173	202	wobbuffet	0	15	0	62	212	118	190	33	58	33	58	33	3	45	50.0	5	0	15
174	203	girafarig	0	13	15	19	49	127	70	80	65	90	65	85	3	60	50.0	5	5	15
175	204	pineco	0	1	0	60	212	115	50	65	90	35	35	15	3	190	50.0	5	1	15
176	205	forretress	0	1	17	60	212	115	75	90	140	60	60	40	3	75	50.0	5	1	15
177	206	dunsparce	0	13	0	63	35	7	100	70	70	65	65	45	3	190	50.0	5	5	15
178	207	gligar	0	11	8	54	33	58	65	75	105	35	65	85	3	60	50.0	5	1	15
179	208	steelix	0	17	11	44	60	108	75	85	200	55	65	30	3	25	50.0	5	9	15
180	209	snubbull	0	5	0	37	35	7	60	80	50	40	40	30	3	190	25.0	5	5	4
181	210	granbull	0	5	0	37	221	7	90	120	75	60	60	45	3	75	25.0	5	5	4
182	211	qwilfish	0	18	14	9	50	37	65	95	85	55	55	85	3	45	50.0	5	13	15
183	212	scizor	0	1	17	14	91	182	70	130	100	55	80	65	3	25	50.0	5	1	15
184	213	shuckle	0	1	16	60	36	233	20	10	230	10	230	5	3	190	50.0	5	1	15
185	214	heracross	0	1	6	14	64	231	80	125	75	40	95	85	3	45	50.0	5	1	15
186	215	sneasel	0	2	12	19	34	247	55	95	55	35	75	115	3	60	50.0	5	5	15
187	216	teddiursa	0	13	0	40	221	88	60	80	50	50	50	40	3	120	50.0	5	5	15
188	217	ursaring	0	13	0	64	221	21	90	130	75	75	75	55	3	60	50.0	5	5	15
189	218	slugma	0	7	0	65	53	176	40	40	40	70	40	20	3	190	50.0	5	0	15
190	219	magcargo	0	7	16	65	53	176	60	50	120	90	80	30	3	75	50.0	5	0	15
191	220	swinub	0	12	11	52	30	1	50	50	40	30	30	50	3	225	50.0	5	5	15
192	221	piloswine	0	12	11	52	30	1	100	100	80	60	60	50	3	75	50.0	5	5	15
193	222	corsola	0	18	16	59	48	181	65	55	95	65	95	35	3	60	25.0	5	12	14
194	223	remoraid	0	18	0	59	218	248	35	65	35	65	35	65	3	190	50.0	5	12	13
195	224	octillery	0	18	0	66	218	248	75	105	75	105	75	45	3	75	50.0	5	12	13
196	225	delibird	0	12	8	67	212	25	45	55	45	65	45	75	3	45	50.0	5	12	5
197	226	mantine	0	18	8	50	55	76	85	40	70	80	140	70	3	25	50.0	5	12	15
198	227	skarmory	0	17	8	34	60	176	65	80	140	40	70	70	3	25	50.0	5	6	15
199	228	houndour	0	2	7	49	29	21	45	60	30	80	50	65	3	120	50.0	5	5	15
200	229	houndoom	0	2	7	49	29	21	75	90	50	110	80	95	3	45	50.0	5	5	15
201	230	kingdra	0	18	3	50	218	43	75	95	95	95	95	85	3	45	50.0	5	12	3
202	231	phanpy	0	11	0	40	212	33	90	60	60	40	40	40	3	120	50.0	5	5	15
203	232	donphan	0	11	0	60	212	33	90	120	120	60	60	50	3	60	50.0	5	5	15
204	233	porygon2	0	13	0	57	125	242	85	80	90	105	95	60	3	45	0.0	5	9	15
205	234	stantler	0	13	0	37	114	127	73	95	62	85	65	85	3	45	50.0	5	5	15
206	235	smeargle	0	13	0	45	91	248	55	20	35	20	45	75	3	45	50.0	5	5	15
207	236	tyrogue	0	6	0	64	24	67	35	35	35	35	35	35	3	75	100.0	5	11	15
208	237	hitmontop	0	6	0	37	91	24	50	95	95	35	110	70	3	45	100.0	5	8	15
209	238	smoochum	0	12	15	52	101	18	45	30	15	85	65	65	3	45	0.0	5	11	15
210	239	elekid	0	4	0	38	212	67	45	63	37	65	55	95	3	45	75.0	5	11	15
211	240	magby	0	7	0	53	212	67	45	75	37	70	55	83	3	45	75.0	5	11	15
212	241	miltank	0	13	0	1	206	127	95	80	105	40	70	100	3	45	0.0	5	5	15
213	242	blissey	0	13	0	48	63	105	255	10	10	75	135	55	3	30	0.0	5	4	15
214	243	raikou	3	4	0	23	212	212	90	85	75	115	100	115	3	3	0.0	5	11	15
215	244	entei	3	7	0	23	212	19	115	115	85	90	75	100	3	3	0.0	5	11	15
216	245	suicune	3	18	0	23	212	19	100	75	115	90	115	85	3	3	0.0	5	11	15
217	246	larvitar	0	16	11	64	212	33	50	64	50	45	50	41	3	45	50.0	5	10	15
218	247	pupitar	0	16	11	11	212	212	70	84	70	65	70	51	3	45	50.0	5	10	15
219	248	tyranitar	0	16	2	68	212	21	100	134	110	95	100	61	3	45	50.0	5	10	15
220	249	lugia	1	15	8	23	212	246	106	90	130	90	154	110	3	3	0.0	5	11	15
221	250	ho-oh	1	7	8	23	212	181	106	130	90	110	154	90	3	3	0.0	5	11	15
222	251	celebi	2	15	10	48	212	212	100	100	100	100	100	100	3	45	0.0	5	11	15
223	252	treecko	0	10	0	0	212	227	40	45	35	65	55	70	2	45	87.5	11	10	3
224	253	grovyle	0	10	0	0	212	227	50	65	45	85	65	95	2	45	87.5	11	10	3
225	254	sceptile	0	10	0	0	212	227	70	85	65	105	85	120	2	45	87.5	11	10	3
226	255	torchic	0	7	0	2	212	61	45	60	40	70	50	45	2	45	87.5	11	5	15
227	256	combusken	0	7	6	2	212	61	60	85	60	85	60	55	2	45	87.5	11	5	15
228	257	blaziken	0	7	6	2	212	61	80	120	70	110	70	80	2	45	87.5	11	5	15
229	258	mudkip	0	18	0	5	212	43	50	70	50	50	50	40	2	45	87.5	11	10	12
230	259	marshtomp	0	18	11	5	212	43	70	85	70	60	70	50	2	45	87.5	11	10	12
231	260	swampert	0	18	11	5	212	43	100	110	90	85	90	60	2	45	87.5	11	10	12
232	261	poochyena	0	2	0	35	221	7	35	55	35	30	30	35	2	255	50.0	11	5	15
233	262	mightyena	0	2	0	37	221	231	70	90	70	60	60	70	2	127	50.0	11	5	15
234	263	zigzagoon	0	13	0	40	36	221	38	30	41	30	41	60	2	255	50.0	11	5	15
235	264	linoone	0	13	0	40	36	221	78	70	61	50	61	100	2	90	50.0	11	5	15
236	265	wurmple	0	1	0	17	212	35	45	45	35	20	30	20	2	255	50.0	11	1	15
237	266	silcoon	0	1	0	11	212	212	50	35	55	25	25	15	2	120	50.0	11	1	15
238	267	beautifly	0	1	8	14	212	10	60	70	50	100	50	65	2	45	50.0	11	1	15
239	268	cascoon	0	1	0	11	212	212	50	35	55	25	25	15	2	120	50.0	11	1	15
240	269	dustox	0	1	14	17	212	12	60	50	70	50	90	65	2	45	50.0	11	1	15
241	270	lotad	0	18	10	50	222	45	40	30	30	40	50	30	2	255	50.0	11	12	7
242	271	lombre	0	18	10	50	222	45	60	50	50	60	70	50	2	120	50.0	11	12	7
243	272	ludicolo	0	18	10	50	222	45	80	70	70	90	100	70	2	45	50.0	11	12	7
244	273	seedot	0	10	0	31	49	247	40	40	50	30	30	30	2	255	50.0	11	5	7
245	274	nuzleaf	0	10	2	31	49	247	70	70	40	60	40	60	2	120	50.0	11	5	7
246	275	shiftry	0	10	2	31	49	247	90	100	60	90	60	80	2	45	50.0	11	4	7
247	276	taillow	0	13	8	64	212	206	40	55	30	30	30	85	2	200	50.0	11	6	15
248	277	swellow	0	13	8	64	212	206	60	85	60	75	50	125	2	45	50.0	11	6	15
249	278	wingull	0	18	8	34	18	222	40	30	30	55	30	85	2	190	50.0	11	12	6
250	279	pelipper	0	18	8	34	83	222	60	50	100	95	70	65	2	45	50.0	11	12	6
251	280	ralts	0	15	5	22	57	118	28	25	25	45	35	40	2	235	50.0	11	8	0
252	281	kirlia	0	15	5	22	57	118	38	35	35	65	55	50	2	120	50.0	11	8	0
253	282	gardevoir	0	15	5	22	57	118	68	65	65	125	115	80	2	45	50.0	11	8	0
254	283	surskit	0	1	18	50	212	222	40	30	32	50	52	65	2	200	50.0	11	12	1
255	284	masquerain	0	1	8	37	212	21	70	60	62	100	82	80	2	75	50.0	11	12	1
256	285	shroomish	0	10	0	32	223	221	60	40	60	40	60	35	2	255	50.0	11	4	7
257	286	breloom	0	10	6	32	223	91	60	130	80	60	60	70	2	90	50.0	11	4	7
258	287	slakoth	0	13	0	69	212	212	60	60	60	35	35	30	2	255	50.0	11	5	15
259	288	vigoroth	0	13	0	67	212	212	80	80	80	55	55	90	2	120	50.0	11	5	15
260	289	slaking	0	13	0	69	212	212	150	160	100	95	65	100	2	45	50.0	11	5	15
261	290	nincada	0	1	11	12	212	35	31	45	90	30	30	40	2	255	50.0	11	1	15
262	291	ninjask	0	1	8	61	212	230	61	90	45	50	50	160	2	120	50.0	11	1	15
263	292	shedinja	0	1	9	70	212	212	1	90	45	30	30	40	2	45	0.0	11	9	15
264	293	whismur	0	13	0	27	212	7	64	51	23	51	23	28	2	190	50.0	11	10	5
265	294	loudred	0	13	0	27	212	206	84	71	43	71	43	48	2	120	50.0	11	10	5
266	295	exploud	0	13	0	27	212	206	104	91	63	91	73	68	2	45	50.0	11	10	5
267	296	makuhita	0	6	0	1	64	108	72	60	30	20	30	25	2	180	75.0	11	8	15
268	297	hariyama	0	6	0	1	64	108	144	120	60	40	60	50	2	200	75.0	11	8	15
269	298	azurill	0	13	5	1	204	127	50	20	40	20	40	20	2	150	25.0	11	11	15
270	299	nosepass	0	16	0	60	26	124	30	45	135	45	90	30	2	255	50.0	11	9	15
271	300	skitty	0	13	0	28	224	109	50	45	45	35	35	50	2	255	25.0	11	5	4
272	301	delcatty	0	13	0	28	224	109	70	65	65	55	55	90	2	60	25.0	11	5	4
273	302	sableye	0	2	9	34	225	106	50	75	75	65	65	50	2	45	50.0	11	8	15
274	303	mawile	0	17	5	54	37	108	50	85	85	55	55	50	2	45	50.0	11	5	4
275	304	aron	0	17	16	60	44	240	50	70	100	40	40	30	2	180	50.0	11	10	15
276	305	lairon	0	17	16	60	44	240	60	90	140	50	50	40	2	90	50.0	11	10	15
277	306	aggron	0	17	16	60	44	240	70	110	180	60	60	50	2	45	50.0	11	10	15
278	307	meditite	0	6	15	71	212	118	30	40	55	40	55	60	2	180	50.0	11	8	15
279	308	medicham	0	6	15	71	212	118	60	60	75	60	75	80	2	90	50.0	11	8	15
280	309	electrike	0	4	0	38	47	73	40	45	40	65	40	65	2	120	50.0	11	5	15
281	310	manectric	0	4	0	38	47	73	70	75	60	105	60	105	2	45	50.0	11	5	15
282	311	plusle	0	4	0	72	212	47	60	50	40	85	75	95	2	200	50.0	11	4	15
283	312	minun	0	4	0	73	212	56	60	40	50	75	85	95	2	200	50.0	11	4	15
284	313	volbeat	0	1	0	51	14	106	65	73	75	47	85	85	2	150	100.0	11	1	8
285	314	illumise	0	1	0	52	214	106	65	47	75	73	85	85	2	150	0.0	11	1	8
286	315	roselia	0	10	14	48	9	96	50	60	45	100	80	65	2	150	50.0	11	4	7
287	316	gulpin	0	14	0	74	90	36	70	43	53	43	53	40	2	225	50.0	11	0	15
288	317	swalot	0	14	0	74	90	36	100	73	83	73	83	55	2	75	50.0	11	0	15
289	318	carvanha	0	18	2	75	212	61	45	90	20	65	20	65	2	225	50.0	11	13	15
290	319	sharpedo	0	18	2	75	212	61	70	120	40	95	40	95	2	60	50.0	11	13	15
291	320	wailmer	0	18	0	76	52	23	130	70	35	70	35	60	2	125	50.0	11	5	13
292	321	wailord	0	18	0	76	52	23	170	90	45	90	45	60	2	60	50.0	11	5	13
293	322	numel	0	7	11	52	85	45	60	60	40	65	45	35	2	255	50.0	11	5	15
294	323	camerupt	0	7	11	65	111	219	70	100	70	105	75	40	2	150	50.0	11	5	15
295	324	torkoal	0	7	0	77	4	81	70	85	140	85	70	20	2	90	50.0	11	5	15
296	325	spoink	0	15	0	1	45	36	60	25	35	70	80	60	2	255	50.0	11	5	15
297	326	grumpig	0	15	0	1	45	36	80	45	65	90	110	80	2	60	50.0	11	5	15
298	327	spinda	0	13	0	45	171	233	60	60	60	60	60	60	2	255	50.0	11	5	8
299	328	trapinch	0	11	0	54	215	108	45	100	45	45	45	10	2	255	50.0	11	1	3
300	329	vibrava	0	11	3	46	212	212	50	70	50	50	50	70	2	120	50.0	11	1	3
301	330	flygon	0	11	3	46	212	212	80	100	80	80	80	100	2	45	50.0	11	1	3
302	331	cacnea	0	10	0	33	212	55	50	85	40	85	40	35	2	190	50.0	11	7	8
303	332	cacturne	0	10	2	33	212	55	70	115	60	115	60	55	2	60	50.0	11	7	8
304	333	swablu	0	13	8	48	212	217	45	40	60	40	75	50	2	255	50.0	11	6	3
305	334	altaria	0	3	8	48	212	217	75	70	90	70	105	80	2	45	50.0	11	6	3
306	335	zangoose	0	13	0	58	212	249	73	115	60	60	60	90	2	90	50.0	11	5	15
307	336	seviper	0	14	0	11	212	230	73	100	60	100	60	65	2	90	50.0	11	5	3
308	337	lunatone	0	16	15	46	212	212	90	55	65	95	85	70	2	45	0.0	11	9	15
309	338	solrock	0	16	15	46	212	212	90	95	85	55	65	70	2	45	0.0	11	9	15
310	339	barboach	0	18	11	52	87	18	50	48	43	46	41	60	2	190	50.0	11	13	15
311	340	whiscash	0	18	11	52	87	18	110	78	73	76	71	60	2	75	50.0	11	13	15
312	341	corphish	0	18	0	54	81	15	43	80	65	50	35	35	2	205	50.0	11	12	14
313	342	crawdaunt	0	18	2	54	81	15	63	120	85	90	55	55	2	155	50.0	11	12	14
314	343	baltoy	0	11	15	46	212	212	40	40	55	40	70	55	2	255	0.0	11	9	15
315	344	claydol	0	11	15	46	212	212	60	70	105	70	120	75	2	90	0.0	11	9	15
316	345	lileep	0	16	10	66	212	226	66	41	77	61	87	23	2	45	87.5	11	14	15
317	346	cradily	0	16	10	66	212	226	86	81	97	81	107	43	2	45	87.5	11	14	15
318	347	anorith	0	16	1	41	212	50	45	95	50	40	50	75	2	45	87.5	11	14	15
319	348	armaldo	0	16	1	41	212	50	75	125	100	70	80	45	2	45	87.5	11	14	15
320	349	feebas	0	18	0	50	52	15	20	15	20	10	55	80	2	255	50.0	11	12	3
321	350	milotic	0	18	0	78	174	28	95	60	79	100	125	81	2	60	50.0	11	12	3
322	351	castform	0	13	0	79	212	212	70	70	70	70	70	70	2	45	50.0	11	4	0
323	352	kecleon	0	13	0	80	212	250	60	90	70	60	120	40	2	200	50.0	11	5	15
324	353	shuppet	0	9	0	25	114	170	44	75	35	63	33	45	2	225	50.0	11	0	15
325	354	banette	0	9	0	25	114	170	64	115	65	83	63	65	2	45	50.0	11	0	15
326	355	duskull	0	9	0	46	212	114	20	40	90	30	90	25	2	190	50.0	11	0	15
327	356	dusclops	0	9	0	23	212	114	40	70	130	60	130	25	2	90	50.0	11	0	15
328	357	tropius	0	10	8	31	178	245	99	68	83	72	87	51	2	200	50.0	11	10	7
329	358	chimecho	0	15	0	46	212	212	75	50	80	95	90	65	2	45	50.0	11	0	15
330	359	absol	0	2	0	23	220	121	65	130	60	75	60	75	2	30	50.0	11	5	15
331	360	wynaut	0	15	0	62	212	118	95	23	48	23	48	23	2	125	50.0	11	11	15
332	361	snorunt	0	12	0	19	116	248	50	50	50	50	50	50	2	190	50.0	11	4	9
333	362	glalie	0	12	0	19	116	248	80	80	80	80	80	80	2	75	50.0	11	4	9
334	363	spheal	0	12	18	1	116	52	70	40	50	55	50	25	2	255	50.0	11	12	5
335	364	sealeo	0	12	18	1	116	52	90	60	70	75	70	45	2	120	50.0	11	12	5
336	365	walrein	0	12	18	1	116	52	110	80	90	95	90	65	2	45	50.0	11	12	5
337	366	clamperl	0	18	0	81	212	7	35	64	85	74	55	32	2	255	50.0	11	12	15
338	367	huntail	0	18	0	50	212	76	55	104	105	94	75	52	2	60	50.0	11	12	15
339	368	gorebyss	0	18	0	50	212	18	55	84	105	114	75	52	2	60	50.0	11	12	15
340	369	relicanth	0	18	16	50	44	60	100	90	130	45	65	55	2	25	87.5	11	12	13
341	370	luvdisc	0	18	0	50	212	18	43	30	55	40	65	97	2	225	25.0	11	13	15
342	371	bagon	0	3	0	44	212	108	45	75	60	40	30	50	2	45	50.0	11	3	15
343	372	shelgon	0	3	0	44	212	115	65	95	100	60	50	50	2	45	50.0	11	3	15
344	373	salamence	0	3	8	37	212	231	95	135	80	110	80	100	2	45	50.0	11	3	15
345	374	beldum	0	17	15	82	212	182	40	55	80	35	60	30	2	3	100.0	11	9	15
346	375	metang	0	17	15	82	212	182	60	75	100	55	80	50	2	3	100.0	11	9	15
347	376	metagross	0	17	15	82	212	182	80	135	130	95	90	70	2	3	100.0	11	9	15
348	377	regirock	3	16	0	82	212	60	80	100	200	50	100	50	2	3	0.0	11	11	15
349	378	regice	3	12	0	82	212	116	80	50	100	100	200	50	2	3	0.0	11	11	15
350	379	registeel	3	17	0	82	212	182	80	75	150	75	150	50	2	3	0.0	11	11	15
351	380	latias	3	3	15	46	212	212	80	80	90	110	130	110	2	3	0.0	11	11	15
352	381	latios	3	3	15	46	212	212	80	90	80	130	110	110	2	3	100.0	11	11	15
353	382	kyogre	1	18	0	83	212	212	100	100	90	150	140	90	2	3	0.0	11	11	15
354	383	groudon	1	11	0	4	212	212	100	150	140	100	90	90	2	3	0.0	11	11	15
355	384	rayquaza	1	3	8	84	212	212	105	150	90	150	90	95	2	45	0.0	11	11	15
356	385	jirachi	2	17	15	63	212	212	100	100	100	100	100	100	2	3	0.0	11	11	15
357	386	deoxys	2	15	0	23	212	212	50	150	50	150	50	150	2	3	0.0	11	11	15
358	387	turtwig	0	10	0	0	212	81	55	68	64	45	55	31	6	45	87.5	2	10	7
359	388	grotle	0	10	0	0	212	81	75	89	85	55	65	36	6	45	87.5	2	10	7
360	389	torterra	0	10	11	0	212	81	95	109	105	75	85	56	6	45	87.5	2	10	7
361	393	piplup	0	18	0	5	212	120	53	51	53	61	56	40	6	45	87.5	2	12	5
362	394	prinplup	0	18	0	5	212	120	64	66	68	81	76	50	6	45	87.5	2	12	5
363	395	empoleon	0	18	17	5	212	120	84	86	88	111	101	60	6	45	87.5	2	12	5
364	396	starly	0	13	8	34	212	107	40	55	30	30	30	60	6	255	50.0	2	6	15
365	397	staravia	0	13	8	37	212	107	55	75	50	40	40	80	6	120	50.0	2	6	15
366	398	staraptor	0	13	8	37	212	107	85	120	70	50	60	100	6	45	50.0	2	6	15
367	399	bidoof	0	13	0	85	103	248	59	45	40	35	40	31	6	255	50.0	2	12	5
368	400	bibarel	0	13	18	85	103	248	79	85	60	55	60	71	6	127	50.0	2	12	5
369	401	kricketot	0	1	0	11	212	35	37	25	41	25	41	25	6	255	50.0	2	1	15
370	402	kricketune	0	1	0	14	212	91	77	85	51	55	51	65	6	45	50.0	2	1	15
371	406	budew	0	10	14	48	9	96	40	30	35	50	70	55	6	255	50.0	2	11	15
372	407	roserade	0	10	14	48	9	91	60	70	65	125	105	90	6	75	50.0	2	4	7
373	408	cranidos	0	16	0	86	212	108	67	125	40	30	30	58	6	45	87.5	2	10	15
374	409	rampardos	0	16	0	86	212	108	97	165	60	65	50	58	6	45	87.5	2	10	15
375	410	shieldon	0	16	17	60	212	27	30	42	118	42	88	30	6	45	87.5	2	10	15
376	411	bastiodon	0	16	17	60	212	27	60	52	168	47	138	30	6	45	87.5	2	10	15
377	412	burmy	0	1	0	11	212	115	40	29	45	29	45	36	6	120	50.0	2	1	15
378	413	wormadam	0	1	10	87	212	115	60	59	85	79	105	36	6	45	0.0	2	1	15
379	414	mothim	0	1	8	14	212	214	70	94	50	94	50	66	6	45	100.0	2	1	15
380	415	combee	0	1	8	88	212	59	30	30	42	30	42	70	6	120	87.5	2	1	15
381	416	vespiquen	0	1	8	23	212	21	70	80	102	80	102	40	6	45	0.0	2	1	15
382	417	pachirisu	0	4	0	35	40	56	60	45	70	45	90	95	6	200	50.0	2	5	4
383	418	buizel	0	18	0	50	212	76	55	65	35	60	30	85	6	190	50.0	2	12	5
384	419	floatzel	0	18	0	50	212	76	85	105	55	85	50	115	6	75	50.0	2	12	5
385	420	cherubi	0	10	0	31	212	212	45	35	45	62	53	35	6	190	50.0	2	4	7
386	421	cherrim	0	10	0	89	212	212	70	60	70	87	78	85	6	75	50.0	2	4	7
387	422	shellos	0	18	0	90	226	124	76	48	48	57	62	34	6	190	50.0	2	12	0
388	423	gastrodon	0	18	11	90	226	124	111	83	68	92	82	39	6	75	50.0	2	12	0
389	424	ambipom	0	13	0	91	40	177	75	100	66	60	66	115	6	45	50.0	2	5	15
390	425	drifloon	0	9	8	92	227	251	90	50	34	60	44	70	6	125	50.0	2	0	15
391	426	drifblim	0	9	8	92	227	251	150	80	44	90	54	80	6	60	50.0	2	0	15
392	427	buneary	0	13	0	35	228	16	55	66	44	44	56	85	6	190	50.0	2	5	8
393	428	lopunny	0	13	0	28	228	16	65	76	84	54	96	105	6	60	50.0	2	5	8
394	429	mismagius	0	9	0	46	212	212	60	60	60	105	105	105	6	45	50.0	2	0	15
395	430	honchkrow	0	2	8	25	220	231	100	125	52	105	52	71	6	30	50.0	2	6	15
396	431	glameow	0	13	0	16	45	34	49	55	42	42	37	85	6	190	25.0	2	5	15
397	432	purugly	0	13	0	1	45	120	71	82	64	64	59	112	6	75	25.0	2	5	15
398	433	chingling	0	15	0	46	212	212	45	30	50	65	50	45	6	120	50.0	2	11	15
399	434	stunky	0	14	2	93	92	34	63	63	47	41	41	74	6	225	50.0	2	5	15
400	435	skuntank	0	14	2	93	92	34	103	93	67	71	61	84	6	60	50.0	2	5	15
401	436	bronzor	0	17	15	46	229	240	57	24	86	24	86	23	6	255	0.0	2	9	15
402	437	bronzong	0	17	15	46	229	240	67	89	116	79	116	33	6	90	0.0	2	9	15
403	438	bonsly	0	16	0	60	44	7	50	80	95	10	45	10	6	255	50.0	2	11	15
404	439	mime_jr.	0	15	5	27	188	91	20	25	45	70	90	60	6	145	50.0	2	11	15
405	440	happiny	0	13	0	48	63	243	100	5	5	15	65	30	6	130	0.0	2	11	15
406	441	chatot	0	13	8	34	171	102	76	65	45	92	42	91	6	30	50.0	2	6	15
407	442	spiritomb	0	9	2	23	212	230	50	92	108	92	108	35	6	100	50.0	2	0	15
408	443	gible	0	3	11	33	212	75	58	70	45	40	45	42	6	45	50.0	2	10	3
409	444	gabite	0	3	11	33	212	75	68	90	65	50	55	82	6	45	50.0	2	10	3
410	445	garchomp	0	3	11	33	212	75	108	130	95	80	85	102	6	45	50.0	2	10	3
411	446	munchlax	0	13	0	40	1	36	135	85	40	40	85	5	6	50	87.5	2	11	15
412	447	riolu	0	6	0	24	19	106	40	70	40	35	40	60	6	75	87.5	2	11	15
413	448	lucario	0	6	17	24	19	121	70	110	70	115	70	90	6	45	87.5	2	5	8
414	449	hippopotas	0	11	0	68	212	124	68	72	78	38	42	32	6	140	50.0	2	5	15
415	450	hippowdon	0	11	0	68	212	124	108	112	118	68	72	47	6	60	50.0	2	5	15
416	451	skorupi	0	14	1	41	218	34	40	50	90	30	55	65	6	120	50.0	2	1	14
417	452	drapion	0	14	2	41	218	34	70	90	110	60	75	95	6	45	50.0	2	1	14
418	453	croagunk	0	14	6	87	130	169	48	61	40	61	40	50	6	140	50.0	2	8	15
419	454	toxicroak	0	14	6	87	130	169	83	106	65	86	65	85	6	75	50.0	2	8	15
420	455	carnivine	0	10	0	46	212	212	74	100	72	90	72	46	6	200	50.0	2	7	15
421	456	finneon	0	18	0	50	226	76	49	49	56	49	61	66	6	190	50.0	2	13	15
422	457	lumineon	0	18	0	50	226	76	69	69	76	69	86	91	6	75	50.0	2	13	15
423	458	mantyke	0	18	8	50	55	76	45	20	50	60	120	50	6	25	50.0	2	11	15
424	459	snover	0	10	12	94	212	27	60	62	50	62	60	40	6	120	50.0	2	10	7
425	460	abomasnow	0	10	12	94	212	27	90	92	75	92	85	60	6	60	50.0	2	10	7
426	461	weavile	0	2	12	23	212	247	70	120	65	45	85	125	6	45	50.0	2	5	15
427	462	magnezone	0	4	17	26	60	242	70	70	115	130	90	60	6	30	0.0	2	9	15
428	463	lickilicky	0	13	0	45	52	217	110	85	95	80	95	50	6	30	50.0	2	10	15
429	464	rhyperior	0	11	16	47	111	107	115	140	130	55	55	40	6	30	50.0	2	10	5
430	465	tangrowth	0	10	0	31	96	181	100	100	125	110	50	50	6	30	50.0	2	7	15
431	466	electivire	0	4	0	95	212	67	75	123	67	95	85	95	6	30	75.0	2	8	15
432	467	magmortar	0	7	0	53	212	67	75	95	67	125	95	83	6	30	75.0	2	8	15
433	468	togekiss	0	5	8	59	63	220	85	50	95	120	115	80	6	30	87.5	2	6	4
434	469	yanmega	0	1	8	61	214	114	86	76	86	116	56	95	6	30	50.0	2	1	15
435	470	leafeon	0	10	0	96	212	31	65	110	130	60	65	95	6	45	87.5	2	5	15
436	471	glaceon	0	12	0	30	212	116	65	60	110	130	95	65	6	45	87.5	2	5	15
437	472	gliscor	0	11	8	54	33	223	75	95	125	45	75	95	6	30	50.0	2	1	15
438	473	mamoswine	0	12	11	52	30	1	110	130	80	70	60	80	6	50	50.0	2	5	15
439	474	porygon-z	0	13	0	15	125	242	85	80	70	135	75	90	6	30	0.0	2	9	15
440	475	gallade	0	15	6	24	212	121	68	125	65	65	115	80	6	45	100.0	2	8	0
441	476	probopass	0	16	17	60	26	124	60	55	145	75	150	40	6	60	50.0	2	9	15
442	477	dusknoir	0	9	0	23	212	114	45	100	135	65	135	45	6	45	50.0	2	0	15
443	478	froslass	0	12	9	30	212	170	70	80	70	80	70	110	6	75	0.0	2	4	9
444	479	rotom	0	4	9	46	212	212	50	50	77	95	77	91	6	45	0.0	2	0	15
445	480	uxie	3	15	0	46	212	212	75	75	130	75	130	95	6	3	0.0	2	11	15
446	481	mesprit	3	15	0	46	212	212	80	105	105	105	105	80	6	3	0.0	2	11	15
447	482	azelf	3	15	0	46	212	212	75	125	70	125	70	115	6	3	0.0	2	11	15
448	483	dialga	1	17	3	23	212	118	100	120	120	150	100	90	6	3	0.0	2	11	15
449	484	palkia	1	18	3	23	212	118	90	120	100	150	120	100	6	3	0.0	2	11	15
450	485	heatran	3	7	17	29	212	53	91	90	106	130	106	77	6	3	50.0	2	11	15
451	486	regigigas	3	13	0	97	212	212	110	160	110	80	110	100	6	3	0.0	2	11	15
452	487	giratina	1	9	3	23	212	118	150	100	120	100	120	90	6	3	0.0	2	11	15
453	488	cresselia	3	15	0	46	212	212	120	70	120	75	130	85	6	3	0.0	2	11	15
454	491	darkrai	2	2	0	98	212	212	70	90	90	135	90	125	6	3	0.0	2	11	15
455	492	shaymin	2	10	0	48	212	212	100	100	100	100	100	100	6	45	0.0	2	11	15
456	493	arceus	2	13	0	99	212	212	120	120	120	120	120	120	6	3	0.0	2	11	15
457	494	victini	2	15	7	100	212	212	100	100	100	100	100	100	7	3	0.0	0	11	15
458	765	oranguru	0	13	15	19	118	252	90	60	80	90	110	60	0	45	50.0	12	5	15
459	495	snivy	0	10	0	0	212	233	45	45	55	45	55	63	7	45	87.5	0	5	7
460	496	servine	0	10	0	0	212	233	60	60	75	60	75	83	7	45	87.5	0	5	7
461	497	serperior	0	10	0	0	212	233	75	75	95	75	95	113	7	45	87.5	0	5	7
462	498	tepig	0	7	0	2	212	1	65	63	45	45	45	45	7	45	87.5	0	5	15
463	499	pignite	0	7	6	2	212	1	90	93	55	70	55	55	7	45	87.5	0	5	15
464	500	emboar	0	7	6	2	212	107	110	123	65	100	65	65	7	45	87.5	0	5	15
465	501	oshawott	0	18	0	5	212	81	55	55	45	63	45	45	7	45	87.5	0	5	15
466	502	dewott	0	18	0	5	212	81	75	75	60	83	60	60	7	45	87.5	0	5	15
467	503	samurott	0	18	0	5	212	81	95	100	85	108	70	70	7	45	87.5	0	5	15
468	504	patrat	0	13	0	35	34	242	45	55	39	35	39	42	7	255	50.0	0	5	15
469	505	watchog	0	13	0	51	34	242	60	85	69	60	69	77	7	255	50.0	0	5	15
470	506	lillipup	0	13	0	67	40	35	45	60	45	25	45	55	7	255	50.0	0	5	15
471	507	herdier	0	13	0	37	104	206	65	80	65	35	65	60	7	120	50.0	0	5	15
472	508	stoutland	0	13	0	37	104	206	85	110	90	45	90	80	7	45	50.0	0	5	15
473	509	purrloin	0	2	0	16	227	106	41	50	37	50	37	66	7	255	50.0	0	5	15
474	510	liepard	0	2	0	16	227	106	64	88	50	88	50	106	7	90	50.0	0	5	15
475	511	pansage	0	10	0	36	212	0	50	53	48	53	48	64	7	190	87.5	0	5	15
476	512	simisage	0	10	0	36	212	0	75	98	63	98	63	101	7	75	87.5	0	5	15
477	513	pansear	0	7	0	36	212	2	50	53	48	53	48	64	7	190	87.5	0	5	15
478	514	simisear	0	7	0	36	212	2	75	98	63	98	63	101	7	75	87.5	0	5	15
479	515	panpour	0	18	0	36	212	5	50	53	48	53	48	64	7	190	87.5	0	5	15
480	516	simipour	0	18	0	36	212	5	75	98	63	98	63	101	7	75	87.5	0	5	15
481	517	munna	0	15	0	101	22	118	76	25	45	67	55	24	7	190	50.0	0	5	15
482	518	musharna	0	15	0	101	22	118	116	55	85	107	95	29	7	75	50.0	0	5	15
483	519	pidove	0	13	8	102	220	10	50	55	50	36	30	43	7	255	50.0	0	6	15
484	520	tranquill	0	13	8	102	220	10	62	77	62	50	42	65	7	120	50.0	0	6	15
485	521	unfezant	0	13	8	102	220	10	80	115	80	65	55	93	7	45	50.0	0	6	15
486	522	blitzle	0	4	0	47	95	127	45	60	32	50	32	76	7	190	50.0	0	5	15
487	523	zebstrika	0	4	0	47	95	127	75	100	63	80	63	116	7	75	50.0	0	5	15
488	524	roggenrola	0	16	0	60	176	124	55	75	85	25	25	15	7	255	50.0	0	9	15
489	525	boldore	0	16	0	60	176	124	70	105	105	50	40	20	7	120	50.0	0	9	15
490	526	gigalith	0	16	0	60	68	124	85	135	130	60	80	25	7	45	50.0	0	9	15
491	527	woobat	0	15	8	103	228	85	65	45	43	55	43	72	7	190	50.0	0	5	6
492	528	swoobat	0	15	8	103	228	85	67	57	55	77	55	114	7	45	50.0	0	5	6
493	529	drilbur	0	11	0	104	124	86	60	85	40	30	45	68	7	120	50.0	0	5	15
494	530	excadrill	0	11	17	104	124	86	110	135	60	50	65	88	7	60	50.0	0	5	15
495	531	audino	0	13	0	105	181	228	103	60	86	60	86	50	7	255	50.0	0	4	15
496	532	timburr	0	6	0	64	108	119	75	80	55	25	35	35	7	180	75.0	0	8	15
497	533	gurdurr	0	6	0	64	108	119	85	105	85	40	50	40	7	90	75.0	0	8	15
498	534	conkeldurr	0	6	0	64	108	119	105	140	95	55	65	45	7	45	75.0	0	8	15
499	535	tympole	0	18	0	50	18	55	50	50	40	50	40	64	7	255	50.0	0	12	15
500	536	palpitoad	0	18	11	50	18	55	75	65	55	65	55	69	7	120	50.0	0	12	15
501	537	seismitoad	0	18	11	50	169	55	105	95	75	85	75	74	7	45	50.0	0	12	15
502	538	throh	0	6	0	64	19	86	120	100	85	30	85	45	7	45	100.0	0	8	15
503	539	sawk	0	6	0	60	19	86	75	125	75	30	75	85	7	45	100.0	0	8	15
504	540	sewaddle	0	1	10	14	31	115	45	53	70	40	60	42	7	255	50.0	0	1	15
505	541	swadloon	0	1	10	96	31	115	55	63	90	50	80	42	7	120	50.0	0	1	15
506	542	leavanny	0	1	10	14	31	115	75	103	80	70	80	92	7	45	50.0	0	1	15
507	543	venipede	0	1	14	9	14	61	30	45	59	30	39	57	7	255	50.0	0	1	15
508	544	whirlipede	0	1	14	9	14	61	40	55	99	40	79	47	7	120	50.0	0	1	15
509	545	scolipede	0	1	14	9	14	61	60	100	89	55	69	112	7	45	50.0	0	1	15
510	546	cottonee	0	10	5	106	230	31	40	27	60	37	50	66	7	190	50.0	0	7	4
511	547	whimsicott	0	10	5	106	230	31	60	67	85	77	75	116	7	75	50.0	0	7	4
512	548	petilil	0	10	0	31	45	96	45	35	50	70	50	30	7	190	0.0	0	7	15
513	549	lilligant	0	10	0	31	45	96	70	60	75	110	75	90	7	75	0.0	0	7	15
514	55	golduck	0	18	0	43	217	50	80	82	78	80	0	85	5	75	50.0	10	12	5
515	550	basculin	0	18	0	107	15	86	70	92	65	80	55	98	7	25	50.0	0	13	15
516	551	sandile	0	11	2	37	231	219	50	72	35	35	35	65	7	180	50.0	0	5	15
517	552	krokorok	0	11	2	37	231	219	60	82	45	45	45	74	7	90	50.0	0	5	15
518	553	krookodile	0	11	2	37	231	219	95	117	80	65	70	92	7	45	50.0	0	5	15
519	554	darumaka	0	7	0	59	212	19	70	90	45	15	45	50	7	120	50.0	0	5	15
520	555	darmanitan	0	7	0	108	212	201	105	140	55	30	55	95	7	60	50.0	0	5	15
521	556	maractus	0	10	0	55	31	226	75	86	67	106	67	60	7	255	50.0	0	7	15
522	557	dwebble	0	1	16	60	81	176	50	65	85	35	35	55	7	190	50.0	0	1	9
523	558	crustle	0	1	16	60	81	176	70	105	125	65	75	45	7	75	50.0	0	1	9
524	559	scraggy	0	2	6	11	231	37	50	75	70	35	70	48	7	180	50.0	0	5	3
525	56	mankey	0	6	0	67	219	120	40	80	35	35	0	70	5	190	50.0	10	5	15
526	560	scrafty	0	2	6	11	231	37	65	90	115	45	115	58	7	90	50.0	0	5	3
527	561	sigilyph	0	15	8	109	213	214	72	58	80	103	80	97	7	45	50.0	0	6	15
528	562	yamask	0	9	0	110	212	212	38	30	85	55	65	30	7	190	50.0	0	9	0
529	563	cofagrigus	0	9	0	110	212	212	58	50	145	95	105	30	7	90	50.0	0	9	0
530	564	tirtouga	0	18	16	111	60	50	54	78	103	53	45	22	7	45	87.5	0	12	14
531	565	carracosta	0	18	16	111	60	50	74	108	133	83	65	32	7	45	87.5	0	12	14
532	566	archen	0	16	8	112	212	212	55	112	45	74	45	70	7	45	87.5	0	6	14
533	567	archeops	0	16	8	112	212	212	75	140	65	112	65	110	7	45	87.5	0	6	14
534	568	trubbish	0	14	0	93	90	92	50	50	62	40	62	65	7	190	50.0	0	9	15
535	569	garbodor	0	14	0	93	176	92	80	95	82	60	82	75	7	60	50.0	0	9	15
536	57	primeape	0	6	0	67	219	120	65	105	60	60	0	95	5	75	50.0	10	5	15
537	570	zorua	0	2	0	113	212	212	40	65	40	80	40	65	7	75	87.5	0	5	15
538	571	zoroark	0	2	0	113	212	212	60	105	60	120	60	105	7	45	87.5	0	5	15
539	572	minccino	0	13	0	28	91	177	55	50	40	40	40	75	7	255	25.0	0	5	15
540	573	cinccino	0	13	0	28	91	177	75	95	60	65	60	115	7	60	25.0	0	5	15
541	574	gothita	0	15	0	114	174	62	45	30	50	55	65	45	7	200	25.0	0	8	15
542	575	gothorita	0	15	0	114	174	62	60	45	70	75	85	55	7	100	25.0	0	8	15
543	576	gothitelle	0	15	0	114	174	62	70	55	95	95	110	65	7	50	25.0	0	8	15
544	577	solosis	0	15	0	115	213	181	45	30	40	105	50	20	7	200	50.0	0	0	15
545	578	duosion	0	15	0	115	213	181	65	40	50	125	60	30	7	100	50.0	0	0	15
546	579	reuniclus	0	15	0	115	213	181	110	65	75	125	85	30	7	50	50.0	0	0	15
547	58	growlithe	0	7	0	37	29	121	55	70	45	50	0	60	5	190	75.0	10	5	15
548	580	ducklett	0	18	8	34	102	18	62	44	50	44	50	55	7	190	50.0	0	12	6
549	581	swanna	0	18	8	34	102	18	75	87	63	87	63	98	7	45	50.0	0	12	6
550	582	vanillite	0	12	0	116	30	176	36	50	50	65	60	44	7	255	50.0	0	9	15
551	583	vanillish	0	12	0	116	30	176	51	65	65	80	75	59	7	120	50.0	0	9	15
552	584	vanilluxe	0	12	0	116	94	176	71	95	85	110	95	79	7	45	50.0	0	9	15
553	585	deerling	0	13	10	31	127	63	60	60	50	40	50	75	7	190	50.0	0	5	15
554	586	sawsbuck	0	13	10	31	127	63	80	100	70	60	70	95	7	75	50.0	0	5	15
555	587	emolga	0	4	8	38	212	95	55	75	60	75	60	103	7	200	50.0	0	5	15
556	588	karrablast	0	1	0	14	11	13	50	75	45	40	45	60	7	200	50.0	0	1	15
557	589	escavalier	0	1	17	14	81	115	70	135	105	60	105	20	7	75	50.0	0	1	15
558	59	arcanine	0	7	0	37	29	121	90	110	80	80	0	95	5	75	75.0	10	5	15
559	590	foongus	0	10	14	32	212	181	69	55	45	55	55	15	7	190	50.0	0	7	15
560	591	amoonguss	0	10	14	32	212	181	114	85	70	85	80	30	7	75	50.0	0	7	15
561	592	frillish	0	18	9	55	170	43	55	40	50	65	85	40	7	190	50.0	0	0	15
562	593	jellicent	0	18	9	55	170	43	100	60	70	85	105	60	7	60	50.0	0	0	15
563	594	alomomola	0	18	0	105	18	181	165	75	80	40	45	65	7	75	50.0	0	12	13
564	595	joltik	0	1	4	12	21	14	50	47	50	57	50	65	7	190	50.0	0	1	15
565	596	galvantula	0	1	4	12	21	14	70	77	60	97	60	108	7	75	50.0	0	1	15
566	597	ferroseed	0	10	17	117	212	212	44	50	91	24	86	10	7	255	50.0	0	7	9
567	598	ferrothorn	0	10	17	117	212	87	74	94	131	54	116	20	7	90	50.0	0	7	9
568	599	klink	0	17	0	72	73	82	40	55	70	45	60	30	7	130	0.0	0	9	15
569	60	poliwag	0	18	0	55	43	50	40	50	40	40	0	90	5	255	50.0	10	12	15
570	600	klang	0	17	0	72	73	82	60	80	95	70	85	50	7	60	0.0	0	9	15
571	601	klinklang	0	17	0	72	73	82	60	100	115	70	85	90	7	30	0.0	0	9	15
572	602	tynamo	0	4	0	46	212	212	35	55	40	45	40	60	7	190	50.0	0	0	15
573	603	eelektrik	0	4	0	46	212	212	65	85	70	75	70	40	7	60	50.0	0	0	15
574	604	eelektross	0	4	0	46	212	212	85	115	80	105	80	50	7	30	50.0	0	0	15
575	605	elgyem	0	15	0	118	22	242	55	55	55	85	55	30	7	255	50.0	0	8	15
576	606	beheeyem	0	15	0	118	22	242	75	75	75	125	95	40	7	90	50.0	0	8	15
577	607	litwick	0	9	7	29	53	230	50	30	55	65	55	20	7	190	50.0	0	0	15
578	608	lampent	0	9	7	29	53	230	60	40	60	95	60	55	7	90	50.0	0	0	15
579	609	chandelure	0	9	7	29	53	230	60	55	90	145	90	80	7	45	50.0	0	0	15
580	61	poliwhirl	0	18	0	55	43	50	65	65	65	50	0	90	5	120	50.0	10	12	15
581	610	axew	0	3	0	10	86	21	46	87	60	30	40	57	7	75	50.0	0	10	3
582	611	fraxure	0	3	0	10	86	21	66	117	70	40	50	67	7	60	50.0	0	10	3
583	612	haxorus	0	3	0	10	86	21	76	147	90	60	70	97	7	45	50.0	0	10	3
584	613	cubchoo	0	12	0	30	232	7	55	70	40	60	40	40	7	120	50.0	0	5	15
585	614	beartic	0	12	0	30	232	50	95	130	80	70	80	50	7	60	50.0	0	5	15
586	615	cryogonal	0	12	0	46	212	212	80	50	50	95	135	105	7	25	0.0	0	9	15
587	616	shelmet	0	1	0	18	81	115	50	40	85	40	65	25	7	200	50.0	0	1	15
588	617	accelgor	0	1	0	18	90	227	80	70	40	100	60	145	7	75	50.0	0	1	15
589	618	stunfisk	0	11	4	38	16	33	109	66	84	81	99	32	7	75	50.0	0	12	0
590	619	mienfoo	0	6	0	19	181	107	45	85	50	55	50	65	7	180	50.0	0	5	8
591	62	poliwrath	0	18	6	55	43	50	90	95	95	70	90	70	5	45	50.0	10	12	15
592	620	mienshao	0	6	0	19	181	107	65	125	60	95	60	105	7	45	50.0	0	5	8
593	621	druddigon	0	3	0	75	108	86	77	120	90	60	90	48	7	45	50.0	0	3	10
594	622	golett	0	11	9	119	228	13	59	74	50	35	50	35	7	190	0.0	0	9	15
595	623	golurk	0	11	9	119	228	13	89	124	80	55	80	55	7	90	0.0	0	9	15
596	624	pawniard	0	2	17	120	19	23	45	85	70	40	40	60	7	120	50.0	0	8	15
597	625	bisharp	0	2	17	120	19	23	65	125	100	60	70	70	7	45	50.0	0	8	15
598	626	bouffalant	0	13	0	107	127	27	95	110	95	40	95	55	7	45	50.0	0	5	15
599	627	rufflet	0	13	8	34	108	59	70	83	50	37	50	60	7	190	100.0	0	6	15
600	628	braviary	0	13	8	34	108	120	100	123	75	57	75	80	7	60	100.0	0	6	15
601	629	vullaby	0	2	8	102	115	176	70	55	75	45	65	60	7	190	0.0	0	6	15
602	63	abra	0	15	0	22	19	213	25	20	15	105	0	90	5	200	75.0	10	8	15
603	630	mandibuzz	0	2	8	102	115	176	110	65	105	55	95	80	7	60	0.0	0	6	15
604	631	heatmor	0	7	0	36	29	77	85	97	66	105	66	65	7	90	50.0	0	5	15
605	632	durant	0	1	17	14	59	69	58	109	112	48	48	109	7	90	50.0	0	1	15
606	633	deino	0	2	3	59	212	212	52	65	50	45	50	38	7	45	50.0	0	3	15
607	634	zweilous	0	2	3	59	212	212	72	85	70	65	70	58	7	45	50.0	0	3	15
608	635	hydreigon	0	2	3	46	212	212	92	105	90	125	90	98	7	45	50.0	0	3	15
609	636	larvesta	0	1	7	53	212	14	55	85	55	50	55	60	7	45	50.0	0	1	15
610	637	volcarona	0	1	7	53	212	14	85	60	65	135	105	100	7	15	50.0	0	1	15
611	638	cobalion	3	17	6	121	212	212	91	90	129	90	72	108	7	3	0.0	0	11	15
612	639	terrakion	3	16	6	121	212	212	91	129	90	72	90	108	7	3	0.0	0	11	15
613	64	kadabra	0	15	0	22	19	213	40	35	30	120	0	105	5	100	75.0	10	8	15
614	640	virizion	3	10	6	121	212	212	91	90	72	90	129	108	7	3	0.0	0	11	15
615	641	tornadus	3	8	0	106	212	120	79	115	70	125	80	111	7	3	100.0	0	11	15
616	642	thundurus	3	4	8	106	212	120	79	115	70	125	80	111	7	3	100.0	0	11	15
617	643	reshiram	1	3	7	122	212	212	100	120	100	150	120	90	7	3	0.0	0	11	15
618	644	zekrom	1	3	4	123	212	212	100	150	120	120	100	90	7	3	0.0	0	11	15
619	645	landorus	3	11	8	124	212	108	89	125	90	115	80	101	7	3	100.0	0	11	15
620	646	kyurem	1	3	12	23	212	212	125	130	90	130	90	95	7	3	0.0	0	11	15
621	647	keldeo	2	18	6	121	212	212	91	72	90	129	90	108	7	3	0.0	0	11	15
622	648	meloetta	2	13	15	63	212	212	100	77	77	128	128	90	7	3	0.0	0	11	15
623	649	genesect	2	1	17	125	212	212	71	120	95	120	95	99	7	3	0.0	0	11	15
624	65	alakazam	0	15	0	22	19	213	55	50	45	135	95	120	5	50	75.0	10	8	15
625	650	chespin	0	10	0	0	212	158	56	61	65	48	45	38	4	45	87.5	15	5	15
626	651	quilladin	0	10	0	0	212	158	61	78	95	56	58	57	4	45	87.5	15	5	15
627	652	chesnaught	0	10	6	0	212	158	88	107	122	74	75	64	4	45	87.5	15	5	15
628	653	fennekin	0	7	0	2	212	137	40	45	40	62	60	60	4	45	87.5	15	5	15
629	654	braixen	0	7	0	2	212	137	59	59	58	90	70	73	4	45	87.5	15	5	15
630	655	delphox	0	7	15	2	212	137	75	69	72	114	100	104	4	45	87.5	15	5	15
631	656	froakie	0	18	0	5	212	250	41	56	40	62	44	71	4	45	87.5	15	12	15
632	657	frogadier	0	18	0	5	212	250	54	63	52	83	56	97	4	45	87.5	15	12	15
633	658	greninja	0	18	2	5	212	250	72	95	67	103	71	122	4	45	87.5	15	12	15
634	659	bunnelby	0	13	0	40	133	204	38	36	38	32	36	57	4	255	50.0	15	5	15
635	66	machop	0	6	0	64	13	24	70	80	50	35	0	35	5	180	75.0	10	8	15
636	660	diggersby	0	13	11	40	133	204	85	56	77	50	77	78	4	127	50.0	15	5	15
637	661	fletchling	0	13	8	102	212	253	45	50	43	40	38	62	4	255	50.0	15	6	15
638	662	fletchinder	0	7	8	53	212	253	62	73	55	56	52	84	4	120	50.0	15	6	15
639	663	talonflame	0	7	8	53	212	253	78	81	71	74	69	126	4	45	50.0	15	6	15
640	664	scatterbug	0	1	0	17	12	243	38	35	40	27	25	35	4	255	50.0	15	1	15
641	665	spewpa	0	1	0	11	212	243	45	22	60	27	30	29	4	120	50.0	15	1	15
642	666	vivillon	0	1	8	17	12	243	80	52	50	90	50	89	4	45	50.0	15	1	15
643	667	litleo	0	7	13	10	21	231	62	50	58	73	54	72	4	220	12.5	15	5	15
644	668	pyroar	0	7	13	10	21	231	86	68	72	109	66	106	4	65	12.5	15	5	15
645	669	flabébé	0	5	0	126	212	252	44	38	39	61	79	42	4	225	0.0	15	4	15
646	67	machoke	0	6	0	64	13	24	80	100	70	50	0	45	5	90	75.0	10	8	15
647	670	floette	0	5	0	126	212	252	54	45	47	75	98	52	4	120	0.0	15	4	15
648	671	florges	0	5	0	126	212	252	78	65	68	112	154	75	4	45	0.0	15	4	15
649	672	skiddo	0	10	0	127	212	254	66	65	48	62	57	52	4	200	50.0	15	5	15
650	673	gogoat	0	10	0	127	212	254	123	100	62	97	81	68	4	45	50.0	15	5	15
651	674	pancham	0	6	0	119	86	206	67	82	62	46	48	43	4	220	50.0	15	5	8
652	675	pangoro	0	6	2	119	86	206	95	124	78	69	71	58	4	65	50.0	15	5	8
653	676	furfrou	0	13	0	42	212	212	75	80	60	65	90	102	4	160	50.0	15	5	15
654	677	espurr	0	15	0	34	230	45	62	48	54	63	60	68	4	190	50.0	15	5	15
655	678	meowstic	0	15	0	34	230	106	74	48	76	83	81	104	4	75	100.0	15	5	15
656	68	machamp	0	6	0	64	13	24	90	130	80	65	0	55	5	45	75.0	10	8	15
657	681	aegislash	0	17	9	128	212	212	60	50	140	50	140	60	4	45	50.0	15	9	15
658	682	spritzee	0	5	0	105	212	255	78	52	60	63	65	23	4	200	50.0	15	4	15
659	683	aromatisse	0	5	0	105	212	255	101	72	72	99	89	29	4	140	50.0	15	4	15
660	684	swirlix	0	5	0	129	212	227	62	48	66	59	57	49	4	200	50.0	15	4	15
661	685	slurpuff	0	5	0	129	212	227	82	80	86	85	75	72	4	140	50.0	15	4	15
662	686	inkay	0	2	15	66	233	230	53	54	53	37	46	45	4	190	50.0	15	12	13
663	687	malamar	0	2	15	66	233	230	86	92	88	68	75	73	4	80	50.0	15	12	13
664	688	binacle	0	16	18	3	218	247	42	52	67	39	56	50	4	120	50.0	15	14	15
665	689	barbaracle	0	16	18	3	218	247	72	105	115	54	86	68	4	45	50.0	15	14	15
666	69	bellsprout	0	10	14	31	212	36	50	75	35	70	0	40	5	255	50.0	10	7	15
667	690	skrelp	0	14	18	9	169	15	50	60	60	60	60	30	4	225	50.0	15	12	3
668	691	dragalge	0	14	3	9	169	15	65	75	90	97	123	44	4	55	50.0	15	12	3
669	692	clauncher	0	18	0	6	212	212	50	53	62	58	63	44	4	225	50.0	15	12	14
670	693	clawitzer	0	18	0	6	212	212	71	73	88	120	89	59	4	55	50.0	15	12	14
671	694	helioptile	0	4	13	130	33	178	44	38	33	61	43	70	4	190	50.0	15	10	3
672	695	heliolisk	0	4	13	130	33	178	62	55	52	109	94	109	4	75	50.0	15	10	3
673	696	tyrunt	0	16	3	131	212	60	58	89	77	45	45	48	4	45	87.5	15	10	3
674	697	tyrantrum	0	16	3	131	212	44	82	121	119	69	59	71	4	45	87.5	15	10	3
675	698	amaura	0	16	12	132	212	94	77	59	50	67	63	46	4	45	87.5	15	10	15
676	699	aurorus	0	16	12	132	212	94	123	77	72	99	92	58	4	45	87.5	15	10	15
677	70	weepinbell	0	10	14	31	212	36	65	90	50	85	0	55	5	120	50.0	10	7	15
678	700	sylveon	0	5	0	28	212	189	95	65	65	110	130	60	4	45	87.5	15	5	15
679	701	hawlucha	0	6	8	16	227	86	78	92	75	74	63	118	4	100	50.0	15	6	8
680	702	dedenne	0	4	5	133	40	72	67	58	57	81	67	101	4	180	50.0	15	5	4
681	703	carbink	0	16	5	82	212	60	50	50	150	50	150	50	4	60	0.0	15	4	9
682	704	goomy	0	3	0	127	18	256	45	50	35	55	75	40	4	45	50.0	15	3	15
683	705	sliggoo	0	3	0	127	18	256	68	75	53	83	113	60	4	45	50.0	15	3	15
684	706	goodra	0	3	0	127	18	256	90	100	70	110	150	80	4	45	50.0	15	3	15
685	707	klefki	0	17	5	106	212	137	57	80	91	80	87	75	4	75	50.0	15	9	15
686	708	phantump	0	9	10	48	114	245	43	70	48	50	60	38	4	120	50.0	15	7	0
687	709	trevenant	0	9	10	48	114	245	85	110	76	65	82	56	4	60	50.0	15	7	0
688	71	victreebel	0	10	14	31	212	36	80	105	65	100	70	70	5	45	50.0	10	7	15
689	710	pumpkaboo	0	9	10	40	114	25	49	66	70	44	55	51	4	120	50.0	15	0	15
690	711	gourgeist	0	9	10	40	114	25	65	90	122	58	75	84	4	60	50.0	15	0	15
691	712	bergmite	0	12	0	45	116	60	55	69	85	32	35	28	4	190	50.0	15	10	9
692	713	avalugg	0	12	0	45	116	60	95	117	184	44	46	28	4	55	50.0	15	10	9
693	714	noibat	0	8	3	114	230	118	40	30	35	45	40	55	4	190	50.0	15	6	3
694	715	noivern	0	8	3	114	230	118	85	70	80	97	80	123	4	45	50.0	15	6	3
695	716	xerneas	1	5	0	134	212	212	126	131	95	131	98	99	4	45	0.0	15	11	15
696	717	yveltal	1	2	8	135	212	212	126	131	95	131	98	99	4	45	0.0	15	11	15
697	718	zygarde	1	3	11	136	205	212	108	100	121	81	95	95	4	3	0.0	15	11	15
698	719	diancie	2	16	5	82	212	212	50	100	150	100	150	50	4	3	0.0	15	11	15
699	72	tentacool	0	18	14	82	74	222	40	40	35	100	0	70	5	190	50.0	10	14	15
700	720	hoopa	2	15	9	137	212	212	80	110	60	150	130	70	4	3	0.0	15	11	15
701	721	volcanion	2	7	18	55	212	212	80	110	120	130	90	70	4	3	0.0	15	11	15
702	722	rowlet	0	10	8	0	212	257	68	55	55	50	50	40	0	45	87.5	12	6	15
703	723	dartrix	0	10	8	0	212	257	78	75	75	70	70	52	0	45	87.5	12	6	15
704	724	decidueye	0	10	9	0	212	257	78	107	75	100	100	70	0	45	87.5	12	6	15
705	725	litten	0	7	0	2	212	37	45	65	40	60	40	70	0	45	87.5	12	5	15
706	726	torracat	0	7	0	2	212	37	65	85	50	80	50	90	0	45	87.5	12	5	15
707	727	incineroar	0	7	2	2	212	37	95	115	90	80	90	60	0	45	87.5	12	5	15
708	728	popplio	0	18	0	5	212	258	50	54	54	66	56	40	0	45	87.5	12	12	5
709	729	brionne	0	18	0	5	212	258	60	69	69	91	81	50	0	45	87.5	12	12	5
710	73	tentacruel	0	18	14	82	74	222	80	70	65	120	0	100	5	60	50.0	10	14	15
711	730	primarina	0	18	5	5	212	258	80	74	74	126	116	60	0	45	87.5	12	12	5
712	731	pikipek	0	13	8	34	177	40	35	75	30	30	30	65	0	255	50.0	12	6	15
713	732	trumbeak	0	13	8	34	177	40	55	85	50	40	50	75	0	120	50.0	12	6	15
714	733	toucannon	0	13	8	34	177	108	80	120	75	75	75	60	0	45	50.0	12	6	15
715	734	yungoos	0	13	0	138	131	15	48	70	30	30	30	45	0	255	50.0	12	5	15
716	735	gumshoos	0	13	0	138	131	15	88	110	60	55	60	45	0	127	50.0	12	5	15
717	736	grubbin	0	1	0	14	212	212	47	62	45	55	45	46	0	255	50.0	12	1	15
718	737	charjabug	0	1	4	139	212	212	57	82	95	55	75	36	0	120	50.0	12	1	15
719	738	vikavolt	0	1	4	46	212	212	77	70	90	145	75	43	0	45	50.0	12	1	15
720	739	crabrawler	0	6	0	54	119	219	47	82	57	42	47	63	0	225	50.0	12	14	15
721	74	geodude	0	16	11	44	60	33	40	80	100	30	0	20	5	255	50.0	10	9	15
722	740	crabominable	0	6	12	54	119	219	97	132	77	62	67	43	0	60	50.0	12	14	15
723	741	oricorio	0	7	8	140	212	212	75	70	70	98	70	93	0	45	25.0	12	6	15
724	742	cutiefly	0	1	5	88	17	129	40	45	40	55	40	84	0	190	50.0	12	1	4
725	743	ribombee	0	1	5	88	17	129	60	55	60	96	70	124	0	75	50.0	12	1	4
726	744	rockruff	0	16	0	34	67	24	45	65	40	30	40	60	0	190	50.0	12	5	15
727	745	lycanroc	0	16	0	34	104	24	75	115	65	55	65	112	0	90	50.0	12	5	15
728	746	wishiwashi	0	18	0	141	212	212	45	20	20	25	25	40	0	60	50.0	12	13	15
729	747	mareanie	0	14	18	142	16	181	50	53	62	43	52	45	0	190	50.0	12	12	15
730	748	toxapex	0	14	18	142	16	181	50	63	152	53	142	35	0	75	50.0	12	12	15
731	749	mudbray	0	11	0	45	234	19	70	100	70	45	55	45	0	190	50.0	12	5	15
732	75	graveler	0	16	11	44	60	33	55	95	115	45	0	35	5	120	50.0	10	9	15
733	750	mudsdale	0	11	0	45	234	19	100	125	100	55	85	35	0	60	50.0	12	5	15
734	751	dewpider	0	18	1	143	212	55	38	40	52	40	72	27	0	200	50.0	12	12	1
735	752	araquanid	0	18	1	143	212	55	68	70	92	50	132	42	0	100	50.0	12	12	1
736	753	fomantis	0	10	0	96	212	233	40	55	35	50	35	35	0	190	50.0	12	7	15
737	754	lurantis	0	10	0	96	212	233	70	105	90	80	90	45	0	75	50.0	12	7	15
738	755	morelull	0	10	5	51	32	222	40	35	55	65	75	15	0	190	50.0	12	7	15
739	756	shiinotic	0	10	5	51	32	222	60	45	80	90	100	30	0	75	50.0	12	7	15
740	757	salandit	0	14	7	144	212	52	48	44	40	71	40	77	0	120	87.5	12	10	3
741	758	salazzle	0	14	7	144	212	52	68	64	60	111	60	117	0	45	0.0	12	10	3
742	759	stufful	0	13	6	145	228	28	70	75	50	45	50	50	0	140	50.0	12	5	15
743	76	golem	0	16	11	44	60	33	80	120	130	55	65	45	5	45	50.0	10	9	15
744	760	bewear	0	13	6	145	228	21	120	125	80	55	60	60	0	70	50.0	12	5	15
745	761	bounsweet	0	10	0	96	52	129	42	30	38	30	38	32	0	235	0.0	12	7	15
746	762	steenee	0	10	0	96	52	129	52	40	48	40	48	62	0	120	0.0	12	7	15
747	763	tsareena	0	10	0	96	235	129	72	120	98	50	98	72	0	45	0.0	12	7	15
748	764	comfey	0	5	0	126	236	48	51	52	90	82	110	100	0	60	25.0	12	7	15
749	766	passimian	0	6	0	146	212	120	100	120	90	40	60	80	0	45	50.0	12	5	15
750	767	wimpod	0	1	18	147	212	212	25	35	40	20	30	80	0	90	50.0	12	1	14
751	768	golisopod	0	1	18	148	212	212	75	125	140	60	90	40	0	45	50.0	12	1	14
752	769	sandygast	0	9	11	149	212	33	55	55	80	70	45	15	0	140	50.0	12	0	15
753	77	ponyta	0	7	0	35	29	53	50	85	55	65	0	90	5	190	50.0	10	5	15
754	770	palossand	0	9	11	149	212	33	85	75	110	100	75	35	0	60	50.0	12	0	15
755	771	pyukumuku	0	18	0	150	212	103	55	60	130	30	130	5	0	60	50.0	12	12	15
756	772	type_null	3	13	0	41	212	212	95	95	95	95	95	59	0	3	0.0	12	11	15
757	773	silvally	3	13	0	151	212	212	95	95	95	95	95	95	0	3	0.0	12	11	15
758	774	minior	0	16	8	152	212	212	60	60	100	60	100	60	0	30	0.0	12	9	15
759	775	komala	0	13	0	153	212	212	65	115	65	75	95	65	0	45	50.0	12	5	15
760	776	turtonator	0	7	3	81	212	212	60	78	135	91	85	36	0	70	50.0	12	10	3
761	777	togedemaru	0	4	17	117	47	60	65	98	63	40	73	96	0	180	50.0	12	5	4
762	778	mimikyu	0	9	5	154	212	212	55	90	80	50	105	96	0	45	50.0	12	0	15
763	779	bruxish	0	18	15	155	131	109	68	105	70	70	70	92	0	80	50.0	12	13	15
764	78	rapidash	0	7	0	35	29	53	65	100	70	80	0	105	5	60	50.0	10	5	15
765	780	drampa	0	13	3	156	127	217	78	60	85	135	91	36	0	70	50.0	12	10	3
766	781	dhelmise	0	9	10	157	212	212	70	131	100	86	90	40	0	25	0.0	12	9	15
767	782	jangmo-o	0	3	0	158	27	115	45	55	65	45	45	45	0	45	50.0	12	3	15
768	783	hakamo-o	0	3	6	158	27	115	55	75	90	65	70	65	0	45	50.0	12	3	15
769	784	kommo-o	0	3	6	158	27	115	75	110	125	100	105	85	0	45	50.0	12	3	15
770	785	tapu_koko	3	4	5	159	212	118	70	115	85	95	75	130	0	3	0.0	12	11	15
771	786	tapu_lele	3	15	5	160	212	118	70	85	75	130	115	95	0	3	0.0	12	11	15
772	787	tapu_bulu	3	10	5	161	212	118	70	130	115	85	95	75	0	3	0.0	12	11	15
773	788	tapu_fini	3	18	5	162	212	118	70	75	115	95	130	85	0	3	0.0	12	11	15
774	789	cosmog	1	15	0	103	212	212	43	29	31	29	31	37	0	45	0.0	12	11	15
775	79	slowpoke	0	18	15	52	45	181	90	65	65	40	0	15	5	190	50.0	10	10	12
776	790	cosmoem	1	15	0	60	212	212	43	29	131	29	131	37	0	45	0.0	12	11	15
777	791	solgaleo	1	15	17	163	212	212	137	137	107	113	89	97	0	45	0.0	12	11	15
778	792	lunala	1	15	9	164	212	212	137	113	89	137	107	97	0	45	0.0	12	11	15
779	793	nihilego	3	16	14	165	212	212	109	53	47	127	131	103	0	45	0.0	12	11	15
780	794	buzzwole	3	1	6	165	212	212	107	139	139	53	53	79	0	45	0.0	12	11	15
781	795	pheromosa	3	1	6	165	212	212	71	137	37	137	37	151	0	45	0.0	12	11	15
782	796	xurkitree	3	4	0	165	212	212	83	89	71	173	71	83	0	45	0.0	12	11	15
783	797	celesteela	3	17	8	165	212	212	97	101	103	107	101	61	0	45	0.0	12	11	15
784	798	kartana	3	10	17	165	212	212	59	181	131	59	31	109	0	45	0.0	12	11	15
785	799	guzzlord	3	2	3	165	212	212	223	101	53	97	53	43	0	45	0.0	12	11	15
786	80	slowbro	0	18	15	52	45	181	95	75	110	80	0	30	5	75	50.0	10	10	12
787	800	necrozma	1	15	0	166	212	212	97	107	101	127	89	79	0	255	0.0	12	11	15
788	801	magearna	2	17	5	167	212	212	80	95	115	130	115	65	0	3	0.0	12	11	15
789	802	marshadow	2	6	9	91	212	212	90	125	80	90	90	125	0	3	0.0	12	11	15
790	803	poipole	3	14	0	165	212	212	67	73	67	73	67	73	0	45	0.0	14	11	15
791	804	naganadel	3	14	3	165	212	212	73	73	73	127	73	121	0	45	0.0	14	11	15
792	805	stakataka	3	16	17	165	212	212	61	131	211	53	101	13	0	30	0.0	14	11	15
793	806	blacephalon	3	7	9	165	212	212	53	127	53	151	79	107	0	30	0.0	14	11	15
794	807	zeraora	2	4	0	56	212	212	88	112	75	102	80	143	0	3	0.0	14	11	15
795	808	meltan	2	17	0	26	212	212	46	65	65	55	35	34	0	3	0.0	7	11	15
796	809	melmetal	2	17	0	119	212	212	135	143	143	80	65	34	0	3	0.0	7	11	15
797	82	magneton	0	4	17	26	60	242	50	60	95	120	0	70	5	60	0.0	10	9	15
798	83	farfetch'd	0	13	8	34	19	120	52	90	55	58	62	60	5	45	50.0	10	6	5
799	84	doduo	0	13	8	35	49	171	35	85	45	35	0	75	5	190	50.0	10	6	15
800	85	dodrio	0	13	8	35	49	171	60	110	70	60	60	110	5	45	50.0	10	6	15
801	86	seel	0	18	0	1	18	116	65	45	55	70	0	45	5	190	50.0	10	12	5
802	87	dewgong	0	18	12	1	18	116	90	70	80	95	0	70	5	75	50.0	10	12	5
803	88	grimer	0	14	0	93	90	169	80	80	50	40	0	25	5	190	50.0	10	0	15
804	89	muk	0	14	0	93	90	169	105	105	75	65	0	50	5	75	50.0	10	0	15
805	90	shellder	0	18	0	81	177	115	30	65	100	45	0	40	5	190	50.0	10	14	15
806	91	cloyster	0	18	0	81	177	115	50	95	180	85	0	70	5	60	50.0	10	14	15
807	92	gastly	0	9	14	46	212	212	30	35	30	100	0	80	5	190	50.0	10	0	15
808	93	haunter	0	9	14	46	212	212	45	50	45	115	0	95	5	90	50.0	10	0	15
809	94	gengar	0	9	14	46	212	212	60	65	60	130	0	110	5	45	50.0	10	0	15
810	95	onix	0	16	11	44	60	176	35	45	160	30	0	70	5	45	50.0	10	9	15
811	96	drowzee	0	15	0	25	101	19	60	48	45	90	0	42	5	190	50.0	10	8	15
812	97	hypno	0	15	0	25	101	19	85	73	70	115	0	67	5	75	50.0	10	8	15
813	98	krabby	0	18	0	54	81	108	30	105	90	25	0	50	5	225	50.0	10	14	15
814	99	kingler	0	18	0	54	81	108	55	130	115	50	0	75	5	60	50.0	10	14	15
815	866	mr._rime	0	12	15	171	239	116	80	85	75	110	100	70	1	45	50.0	13	8	15
816	870	falinks	0	6	0	41	212	120	60	100	100	70	60	75	1	45	0.0	13	4	9
817	864	cursola	0	9	0	176	212	261	60	95	50	145	130	30	1	30	25.0	13	12	14
818	865	sirfetch'd	0	6	0	24	212	206	62	135	95	68	82	65	1	45	50.0	13	6	5
819	874	stonjourner	0	16	0	180	212	212	100	125	135	20	20	70	1	60	50.0	13	9	15
820	880	dracozolt	0	4	3	56	59	104	90	100	90	80	70	75	1	45	0.0	13	11	15
821	882	dracovish	0	18	3	55	131	104	90	90	100	70	80	75	1	45	0.0	13	11	15
822	881	arctozolt	0	4	12	56	38	232	90	100	90	90	80	55	1	45	0.0	13	11	15
823	883	arctovish	0	18	12	55	116	232	90	90	100	80	90	55	1	45	0.0	13	11	15
824	884	duraludon	0	17	3	182	240	262	70	95	115	120	50	85	1	45	50.0	13	9	3
825	871	pincurchin	0	4	0	47	212	159	48	101	95	91	85	15	1	75	50.0	13	12	0
826	877	morpeko	0	4	2	183	212	212	58	95	58	70	58	97	1	180	50.0	13	5	4
827	810	grookey	0	10	0	0	212	161	50	65	50	40	40	65	1	45	87.5	13	5	7
828	811	thwackey	0	10	0	0	212	161	70	85	70	55	60	80	1	45	87.5	13	5	7
829	812	rillaboom	0	10	0	0	212	161	100	125	90	60	70	85	1	45	87.5	13	5	7
830	813	scorbunny	0	7	0	2	212	263	50	71	40	40	40	69	1	45	87.5	13	5	8
831	814	raboot	0	7	0	2	212	263	65	86	50	55	60	94	1	45	87.5	13	5	8
832	815	cinderace	0	7	0	2	212	263	80	116	75	65	75	119	1	45	87.5	13	5	8
833	816	sobble	0	18	0	5	212	218	50	40	40	70	40	70	1	45	87.5	13	12	5
834	817	drizzile	0	18	0	5	212	218	65	60	55	95	55	90	1	45	87.5	13	12	5
835	818	inteleon	0	18	0	5	212	218	70	85	65	125	65	120	1	45	87.5	13	12	5
836	888	zacian	1	5	0	190	212	212	92	130	115	80	115	138	1	10	0.0	13	11	15
837	889	zamazenta	1	6	0	191	212	212	92	130	115	80	115	138	1	10	0.0	13	11	15
838	890	eternatus	1	14	3	23	212	212	140	85	95	145	95	130	1	255	0.0	13	11	15
839	819	skwovet	0	13	0	133	212	36	70	55	55	35	35	25	1	255	50.0	13	5	15
840	820	greedent	0	13	0	133	212	36	120	95	95	55	75	20	1	90	50.0	13	5	15
841	867	runerigus	0	11	9	192	212	212	58	95	145	50	105	30	1	90	50.0	13	9	0
842	862	obstagoon	0	2	13	107	64	120	93	90	101	60	81	95	1	45	50.0	13	5	15
843	821	rookidee	0	8	0	34	21	102	38	47	35	33	35	57	1	255	50.0	13	6	15
844	822	corvisquire	0	8	0	34	21	102	68	67	55	43	55	77	1	120	50.0	13	6	15
845	823	corviknight	0	8	17	23	21	264	98	87	105	53	85	67	1	45	50.0	13	6	15
846	885	dreepy	0	3	9	82	230	170	28	60	30	40	30	82	1	45	50.0	13	0	3
847	886	drakloak	0	3	9	82	230	170	68	80	50	60	50	102	1	45	50.0	13	0	3
848	887	dragapult	0	3	9	82	230	170	88	120	75	100	75	142	1	45	50.0	13	0	3
849	878	cufant	0	17	0	108	212	240	72	80	49	40	49	40	1	190	50.0	13	5	9
850	879	copperajah	0	17	0	108	212	240	122	130	69	80	69	30	1	90	50.0	13	5	9
851	876	indeedee	0	15	13	19	22	160	60	65	55	105	95	95	1	30	100.0	13	4	15
852	875	eiscue	0	12	0	193	212	212	75	80	110	65	90	50	1	60	50.0	13	12	5
853	872	snom	0	12	1	17	212	265	30	25	35	45	30	20	1	190	50.0	13	1	15
854	873	frosmoth	0	12	1	17	212	265	70	65	60	125	90	65	1	75	50.0	13	1	15
855	868	milcery	0	5	0	129	212	255	45	40	40	50	61	34	1	200	0.0	13	4	0
856	869	alcremie	0	5	0	129	212	255	65	60	75	110	121	64	1	100	0.0	13	4	0
857	824	blipbug	0	1	0	14	12	118	25	20	20	25	45	45	1	255	50.0	13	1	15
858	825	dottler	0	1	15	14	12	118	50	35	80	50	90	30	1	120	50.0	13	1	15
859	826	orbeetle	0	1	15	14	114	118	60	45	110	80	120	90	1	45	50.0	13	1	15
860	827	nickit	0	2	0	35	227	138	40	28	28	47	52	50	1	255	50.0	13	5	15
861	828	thievul	0	2	0	35	227	138	70	58	58	87	92	90	1	127	50.0	13	5	15
862	829	gossifleur	0	10	0	194	181	32	40	40	60	40	60	10	1	190	50.0	13	7	15
863	830	eldegoss	0	10	0	194	181	32	60	50	90	80	120	60	1	75	50.0	13	7	15
864	831	wooloo	0	13	0	145	35	158	42	40	55	40	45	48	1	255	50.0	13	5	15
865	832	dubwool	0	13	0	145	24	158	72	80	100	60	90	88	1	127	50.0	13	5	15
866	833	chewtle	0	18	0	131	81	50	50	64	50	38	38	44	1	255	50.0	13	10	12
867	834	drednaw	0	18	16	131	81	50	90	115	90	48	68	74	1	75	50.0	13	10	12
868	835	yamper	0	4	0	195	212	7	59	45	50	40	50	26	1	255	50.0	13	5	15
869	836	boltund	0	4	0	131	212	174	69	90	60	90	60	121	1	45	50.0	13	5	15
870	837	rolycolt	0	16	0	196	229	29	30	40	50	40	50	30	1	255	50.0	13	9	15
871	838	carkol	0	16	7	196	53	29	80	60	90	60	70	50	1	120	50.0	13	9	15
872	839	coalossal	0	16	7	196	53	29	110	80	120	80	90	30	1	45	50.0	13	9	15
873	840	applin	0	10	3	197	36	158	40	40	80	40	40	20	1	255	50.0	13	7	3
874	841	flapple	0	10	3	197	36	59	70	110	80	95	60	70	1	45	50.0	13	7	3
875	842	appletun	0	10	3	197	36	1	110	85	80	100	80	30	1	45	50.0	13	7	3
876	843	silicobra	0	11	0	198	11	33	52	57	75	35	50	46	1	255	50.0	13	5	3
877	844	sandaconda	0	11	0	198	11	33	72	107	125	65	70	71	1	120	50.0	13	5	3
878	845	cramorant	0	8	18	199	212	212	70	85	55	85	95	85	1	45	50.0	13	12	6
879	846	arrokunda	0	18	0	50	212	266	41	63	40	40	30	66	1	255	50.0	13	13	15
880	847	barraskewda	0	18	0	50	212	266	61	123	60	60	50	136	1	60	50.0	13	13	15
881	850	sizzlipede	0	7	1	29	77	53	50	65	45	50	50	45	1	190	50.0	13	1	15
882	851	centiskorch	0	7	1	29	77	53	100	115	65	90	90	65	1	75	50.0	13	1	15
883	852	clobbopus	0	6	0	16	212	91	50	68	60	50	50	32	1	180	50.0	13	12	8
884	853	grapploct	0	6	0	16	212	91	80	118	90	70	80	42	1	45	50.0	13	12	8
885	854	sinistea	0	9	0	176	212	170	40	45	45	74	54	50	1	120	0.0	13	9	0
886	855	polteageist	0	9	0	176	212	170	60	65	65	134	114	70	1	60	0.0	13	9	0
887	856	hatenna	0	15	0	105	87	203	42	30	45	56	53	39	1	235	0.0	13	4	15
888	857	hattrem	0	15	0	105	87	203	57	40	65	86	73	49	1	120	0.0	13	4	15
889	858	hatterene	0	15	5	105	87	203	57	90	95	136	103	29	1	45	0.0	13	4	15
890	859	impidimp	0	2	5	106	114	247	45	45	30	55	40	50	1	255	100.0	13	4	8
891	860	morgrem	0	2	5	106	114	247	65	60	45	75	55	70	1	120	100.0	13	4	8
892	861	grimmsnarl	0	2	5	106	114	247	95	120	65	95	75	60	1	45	100.0	13	4	8
893	893	zarude	2	2	10	96	212	212	105	120	105	70	95	105	1	3	0.0	13	11	15
894	894	regieleki	3	4	0	207	212	212	80	100	50	100	50	200	1	3	0.0	13	11	15
895	895	regidrago	3	3	0	208	212	212	200	100	50	100	50	80	1	3	0.0	13	11	15
896	896	glastrier	3	12	0	209	212	212	100	145	130	65	110	30	1	3	0.0	13	11	15
897	897	spectrier	3	9	0	210	212	212	100	65	60	145	80	130	1	3	0.0	13	11	15
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.regions (id, region) FROM stdin;
0	alola
1	galar
2	hoenn
3	johto
4	kalos
5	kanto
6	sinnoh
7	unova
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.types (id, pokemon_type) FROM stdin;
0	NULL
1	bug
2	dark
3	dragon
4	electric
5	fairy
6	fighting
7	fire
8	flying
9	ghost
10	grass
11	ground
12	ice
13	normal
14	poison
15	psychic
16	rock
17	steel
18	water
\.


--
-- Name: abilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.abilities_id_seq', 1, false);


--
-- Name: egg_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.egg_groups_id_seq', 1, false);


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.games_id_seq', 1, false);


--
-- Name: legendaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.legendaries_id_seq', 1, false);


--
-- Name: pokemon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pokemon_id_seq', 1, false);


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.regions_id_seq', 1, false);


--
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.types_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

