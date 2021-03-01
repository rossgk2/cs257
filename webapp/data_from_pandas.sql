--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-4)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-4)

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
0	adaptability	powers_up_moves_of_the_same_type_as_the_pokémon.
1	aerilate	normal-type_moves_become_flying-type_moves._the_power_of_those_moves_is_boosted_a_little.
2	aftermath	damages_the_attacker_if_it_contacts_the_pokémon_with_a_finishing_hit.
3	air_lock	eliminates_the_effects_of_weather.
4	anticipation	the_pokémon_can_sense_an_opposing_pokémon's_dangerous_moves.
5	as_one	this_ability_combines_the_effects_of_both_calyrex’s_unnerve_ability_and_glastrier’s/spectrier’s_chilling_neigh/grim_neigh_ability.
6	aura_break	the_effects_of_aura_abilities_are_reversed_to_lower_the_power_of_affected_moves.
7	bad_dreams	reduces_the_hp_of_sleeping_opposing_pokémon.
8	ball_fetch	if_the_pokémon_is_not_holding_an_item_it_will_fetch_the_poke_ball_from_the_first_failed_throw_of_the_battle.
9	battery	powers_up_ally_pokémon's_special_moves.
10	battle_armor	hard_armor_protects_the_pokémon_from_critical_hits.
11	battle_bond	defeating_an_opposing_pokémon_strengthens_the_pokémon's_bond_with_its_trainer_and_it_becomes_ash-greninja._water_shuriken_gets_more_powerful.
12	beast_boost	the_pokémon_boosts_its_most_proficient_stat_each_time_it_knocks_out_a_pokémon.
13	berserk	boosts_the_pokémon's_sp._atk_stat_when_it_takes_a_hit_that_causes_its_hp_to_become_half_or_less.
14	big_pecks	protects_the_pokémon_from_defense-lowering_effects.
15	blaze	powers_up_fire-type_moves_when_the_pokémon's_hp_is_low._
16	bulletproof	protects_the_pokémon_from_some_ball_and_bomb_moves.
17	cheek_pouch	restores_hp_as_well_when_the_pokémon_eats_a_berry.
18	chilling_neigh	when_the_pokémon_knocks_out_a_target_it_utters_a_chilling_neigh_which_boosts_its_attack_stat.
19	chlorophyll	boosts_the_pokémon's_speed_stat_in_harsh_sunlight._
20	clear_body	prevents_other_pokémon's_moves_or_abilities_from_lowering_the_pokémon's_stats.
21	color_change	the_pokémon's_type_becomes_the_type_of_the_move_used_on_it.
22	comatose	it's_always_drowsing_and_will_never_wake_up._it_can_attack_without_waking_up.
23	competitive	boosts_the_sp._atk_stat_sharply_when_a_stat_is_lowered.
24	compound_eyes	the_pokémon's_compound_eyes_boost_its_accuracy.
25	corrosion	the_pokémon_can_poison_the_target_even_if_it's_a_steel_or_poison_type.
26	cotton_down	when_the_pokémon_is_hit_by_an_attack_it_scatters_cotton_fluff_around_and_lowers_the_speed_stat_of_all_pokémon_except_itself.
27	curious_medicine	when_the_pokémon_is_brought_into_battle_any_stat_alterations_of_allies_are_removed.
28	cursed_body	may_disable_a_move_used_on_the_pokémon.
29	cute_charm	contact_with_the_pokémon_may_cause_infatuation.
30	damp	prevents_the_use_of_explosive_moves_such_as_self-destruct_by_dampening_its_surroundings.
31	dancer	when_another_pokémon_uses_a_dance_move_it_can_use_a_dance_move_following_it_regardless_of_its_speed.
32	dark_aura	powers_up_each_pokémon's_dark-type_moves.
33	dauntless_shield	boosts_the_pokémon's_defense_stat_when_the_pokémon_enters_a_battle.
34	dazzling	surprises_the_opposing_pokémon_making_it_unable_to_attack_using_priority_moves.
35	defeatist	halves_the_pokémon's_attack_and_sp._atk_stats_when_its_hp_becomes_half_or_less.
36	defiant	boosts_the_pokémon's_attack_stat_sharply_when_its_stats_are_lowered.
37	delta_stream	the_pokémon_changes_the_weather_to_eliminate_all_of_the_flying_type's_weaknesses.
38	desolate_land	the_pokémon_changes_the_weather_to_nullify_water-type_attacks.
39	disguise	once_per_battle_the_shroud_that_covers_the_pokémon_can_protect_it_from_an_attack.
40	download	compares_an_opposing_pokémon's_defense_and_sp._def_stats_before_raising_its_own_attack_or_sp._atk_stat—whichever_will_be_more_effective.
41	dragon's_maw	powers_up_dragon-type_moves.
42	drizzle	the_pokémon_makes_it_rain_when_it_enters_a_battle.
43	drought	turns_the_sunlight_harsh_when_the_pokémon_enters_a_battle.
44	dry_skin	restores_hp_in_rain_or_when_hit_by_water-type_moves._reduces_hp_in_harsh_sunlight_and_increases_the_damage_received_from_fire-type_moves.
45	early_bird	the_pokémon_awakens_from_sleep_twice_as_fast_as_other_pokémon.
46	effect_spore	contact_with_the_pokémon_may_inflict_poison_sleep_or_paralysis_on_its_attacker.
47	electric_surge	turns_the_ground_into_electric_terrain_when_the_pokémon_enters_a_battle.
48	emergency_exit	the_pokémon_sensing_danger_switches_out_when_its_hp_becomes_half_or_less.
49	fairy_aura	powers_up_each_pokémon's_fairy-type_moves.
50	filter	reduces_the_power_of_supereffective_attacks_taken.
51	flame_body	contact_with_the_pokémon_may_burn_the_attacker.
52	flash_fire	powers_up_the_pokémon's_fire-type_moves_if_it's_hit_by_one.
53	flower_gift	boosts_the_attack_and_sp._def_stats_of_itself_and_allies_in_harsh_sunlight.
54	flower_veil	ally_grass-type_pokémon_are_protected_from_status_conditions_and_the_lowering_of_their_stats.
55	fluffy	halves_the_damage_taken_from_moves_that_make_direct_contact_but_doubles_that_of_fire-type_moves.
56	forecast	the_pokémon_transforms_with_the_weather_to_change_its_type_to_water_fire_or_ice.
57	forewarn	when_it_enters_a_battle_the_pokémon_can_tell_one_of_the_moves_an_opposing_pokémon_has.
58	frisk	when_it_enters_a_battle_the_pokémon_can_check_an_opposing_pokémon's_held_item.
59	full_metal_body	prevents_other_pokémon's_moves_or_abilities_from_lowering_the_pokémon's_stats.
60	fur_coat	halves_the_damage_from_physical_moves.
61	gluttony	makes_the_pokémon_eat_a_held_berry_when_its_hp_drops_to_half_or_less_which_is_sooner_than_usual.
62	gorilla_tactics	boosts_the_pokémon's_attack_stat_but_only_allows_the_use_of_the_first_selected_move.
63	grassy_surge	turns_the_ground_into_grassy_terrain_when_the_pokémon_enters_a_battle.
64	grim_neigh	when_the_pokémon_knocks_out_a_target_it_utters_a_terrifying_neigh_which_boosts_its_special_attack_stat.
65	gulp_missile	when_the_pokémon_uses_surf_or_dive_it_will_come_back_with_prey._when_it_takes_damage_it_will_spit_out_the_prey_to_attack.
66	guts	it's_so_gutsy_that_having_a_status_condition_boosts_the_pokémon's_attack_stat.
67	healer	sometimes_heals_an_ally's_status_condition.
68	honey_gather	the_pokémon_may_gather_honey_after_a_battle.
69	huge_power	doubles_the_pokémon's_attack_stat.
70	hunger_switch	the_pokémon_changes_its_form_alternating_between_its_full_belly_mode_and_hangry_mode_after_the_end_of_each_turn.
71	hustle	boosts_the_attack_stat_but_lowers_accuracy.
72	hydration	heals_status_conditions_if_it's_raining.
73	hyper_cutter	the_pokémon's_proud_of_its_powerful_pincers._they_prevent_other_pokémon_from_lowering_its_attack_stat.
74	ice_body	the_pokémon_gradually_regains_hp_in_a_hailstorm.
75	ice_face	the_pokémon's_ice_head_can_take_a_physical_attack_as_a_substitute_but_the_attack_also_changes_the_pokémon's_appearance._the_ice_will_be_restored_when_it_hails.
76	illuminate	raises_the_likelihood_of_meeting_wild_pokémon_by_illuminating_the_surroundings.
77	illusion	comes_out_disguised_as_the_pokémon_in_the_party's_last_spot.
78	immunity	the_immune_system_of_the_pokémon_prevents_it_from_getting_poisoned.
79	innards_out	damages_the_attacker_landing_the_finishing_hit_by_the_amount_equal_to_its_last_hp.
80	inner_focus	the_pokémon's_intensely_focused_and_that_protects_the_pokémon_from_flinching.
81	insomnia	the_pokémon_is_suffering_from_insomnia_and_cannot_fall_asleep.
82	intimidate	the_pokémon_intimidates_opposing_pokémon_upon_entering_battle_lowering_their_attack_stat.
83	intrepid_sword	boosts_the_pokémon's_attack_stat_when_the_pokémon_enters_a_battle.
84	iron_barbs	inflicts_damage_on_the_attacker_upon_contact_with_iron_barbs.
85	iron_fist	powers_up_punching_moves.
86	justified	being_hit_by_a_dark-type_move_boosts_the_attack_stat_of_the_pokémon_for_justice.
87	keen_eye	keen_eyes_prevent_other_pokémon_from_lowering_this_pokémon's_accuracy.
88	leaf_guard	prevents_status_conditions_in_harsh_sunlight.
89	levitate	by_floating_in_the_air_the_pokémon_receives_full_immunity_to_all_ground-type_moves.
90	light_metal	halves_the_pokémon's_weight.
91	lightning_rod	the_pokémon_draws_in_all_electric-type_moves._instead_of_being_hit_by_electric-type_moves_it_boosts_its_sp._atk.
92	limber	its_limber_body_protects_the_pokémon_from_paralysis.
93	liquid_ooze	the_oozed_liquid_has_a_strong_stench_which_damages_attackers_using_any_draining_move.
94	magic_bounce	reflects_status_moves_instead_of_getting_hit_by_them.
95	magician	the_pokémon_steals_the_held_item_of_a_pokémon_it_hits_with_a_move.
96	magma_armor	the_pokémon_is_covered_with_hot_magma_which_prevents_the_pokémon_from_becoming_frozen.
97	magnet_pull	prevents_steel-type_pokémon_from_escaping_using_its_magnetic_force.
98	marvel_scale	the_pokémon's_marvelous_scales_boost_the_defense_stat_if_it_has_a_status_condition.
99	mega_launcher	powers_up_aura_and_pulse_moves._
100	merciless	the_pokémon's_attacks_become_critical_hits_if_the_target_is_poisoned.
101	mimicry	changes_the_pokémon's_type_depending_on_the_terrain.
102	minus	boosts_the_sp._atk_stat_of_the_pokémon_if_an_ally_with_the_plus_or_minus_ability_is_also_in_battle.
103	misty_surge	turns_the_ground_into_misty_terrain_when_the_pokémon_enters_a_battle.
104	mold_breaker	moves_can_be_used_on_the_target_regardless_of_its_abilities.
105	motor_drive	boosts_its_speed_stat_if_hit_by_an_electric-type_move_instead_of_taking_damage.
106	multitype	changes_the_pokémon's_type_to_match_the_plate_or_z-crystal_it_holds.
107	mummy	contact_with_the_pokémon_changes_the_attacker's_ability_to_mummy.
108	natural_cure	all_status_conditions_heal_when_the_pokémon_switches_out.
109	neuroforce	powers_up_moves_that_are_super_effective.
110	no_guard	the_pokémon_employs_no-guard_tactics_to_ensure_incoming_and_outgoing_attacks_always_land.
111	oblivious	the_pokémon_is_oblivious_and_that_keeps_it_from_being_infatuated_or_falling_for_taunts.
112	overcoat	protects_the_pokémon_from_things_like_sand_hail_and_powder.
113	overgrow	powers_up_grass-type_moves_when_the_pokémon's_hp_is_low.
114	own_tempo	this_pokémon_has_its_own_tempo_and_that_prevents_it_from_becoming_confused.
115	parental_bond	parent_and_child_each_attacks.
116	pickup	the_pokémon_may_pick_up_the_item_an_opposing_pokémon_used_during_a_battle._it_may_pick_up_items_outside_of_battle_too.
117	pixilate	normal-type_moves_become_fairy-type_moves._the_power_of_those_moves_is_boosted_a_little.
118	plus	boosts_the_sp._atk_stat_of_the_pokémon_if_an_ally_with_the_plus_or_minus_ability_is_also_in_battle.
119	poison_point	contact_with_the_pokémon_may_poison_the_attacker.
120	poison_touch	may_poison_a_target_when_the_pokémon_makes_contact.
121	power_construct	other_cells_gather_to_aid_when_its_hp_becomes_half_or_less._then_the_pokémon_changes_its_form_to_complete_forme.
122	power_spot	just_being_next_to_the_pokémon_powers_up_moves.
123	prankster	gives_priority_to_a_status_move.
124	pressure	by_putting_pressure_on_the_opposing_pokémon_it_raises_their_pp_usage.
125	primordial_sea	the_pokémon_changes_the_weather_to_nullify_fire-type_attacks.
126	prism_armor	reduces_the_power_of_supereffective_attacks_taken.
127	psychic_surge	turns_the_ground_into_psychic_terrain_when_the_pokémon_enters_a_battle.
128	punk_rock	boosts_the_power_of_sound-based_moves._the_pokémon_also_takes_half_the_damage_from_these_kinds_of_moves.
129	pure_power	using_its_pure_power_the_pokémon_doubles_its_attack_stat.
130	quick_draw	enables_the_pokémon_to_move_first_occasionally.
131	rattled	dark-_ghost-_and_bug-type_moves_scare_the_pokémon_and_boost_its_speed_stat.
132	receiver	the_pokémon_copies_the_ability_of_a_defeated_ally.
133	reckless	powers_up_moves_that_have_recoil_damage.
134	refrigerate	normal-type_moves_become_ice-type_moves._the_power_of_those_moves_is_boosted_a_little.
135	regenerator	restores_a_little_hp_when_withdrawn_from_battle.
136	ripen	ripens_berries_and_doubles_their_effect.
137	rivalry	becomes_competitive_and_deals_more_damage_to_pokémon_of_the_same_gender_but_deals_less_to_pokémon_of_the_opposite_gender.
138	rks_system	changes_the_pokémon's_type_to_match_the_memory_disc_it_holds.
139	rock_head	protects_the_pokémon_from_recoil_damage.
140	rough_skin	this_pokémon_inflicts_damage_with_its_rough_skin_to_the_attacker_on_contact.
141	run_away	enables_a_sure_getaway_from_wild_pokémon.
142	sand_force	boosts_the_power_of_rock-_ground-_and_steel-type_moves_in_a_sandstorm.
143	sand_rush	boosts_the_pokémon's_speed_stat_in_a_sandstorm.
144	sand_spit	the_pokémon_creates_a_sandstorm_when_it's_hit_by_an_attack.
145	sand_stream	the_pokémon_summons_a_sandstorm_when_it_enters_a_battle.
146	sand_veil	boosts_the_pokémon's_evasiveness_in_a_sandstorm.
147	sap_sipper	boosts_the_attack_stat_if_hit_by_a_grass-type_move_instead_of_taking_damage.
148	schooling	when_it_has_a_lot_of_hp_the_pokémon_forms_a_powerful_school._it_stops_schooling_when_its_hp_is_low.__doesn't_work_until_level_20.
149	scrappy	the_pokémon_can_hit_ghost-type_pokémon_with_normal-_and_fighting-type_moves.
150	serene_grace	boosts_the_likelihood_of_additional_effects_occurring_when_attacking.
151	shadow_shield	reduces_the_amount_of_damage_the_pokémon_takes_while_its_hp_is_full.
152	shadow_tag	this_pokémon_steps_on_the_opposing_pokémon's_shadow_to_prevent_it_from_escaping.
153	shed_skin	the_pokémon_may_heal_its_own_status_conditions_by_shedding_its_skin.
154	sheer_force	removes_additional_effects_to_increase_the_power_of_moves_when_attacking.
155	shell_armor	a_hard_shell_protects_the_pokémon_from_critical_hits.
156	shield_dust	this_pokémon's_dust_blocks_the_additional_effects_of_attacks_taken.
157	shields_down	when_its_hp_becomes_half_or_less_the_pokémon's_shell_breaks_and_it_becomes_aggressive.
158	simple	the_stat_changes_the_pokémon_receives_are_doubled.
159	skill_link	maximizes_the_number_of_times_multistrike_moves_hit.
160	slow_start	for_five_turns_the_pokémon's_attack_and_speed_stats_are_halved.
161	snow_cloak	boosts_evasiveness_in_a_hailstorm.
162	snow_warning	the_pokémon_summons_a_hailstorm_when_it_enters_a_battle.
163	solar_power	boosts_the_sp._atk_stat_in_harsh_sunlight_but_hp_decreases_every_turn.
164	solid_rock	reduces_the_power_of_supereffective_attacks_taken.
165	soul-heart	boosts_its_sp._atk_stat_every_time_a_pokémon_faints.
166	soundproof	soundproofing_gives_the_pokémon_full_immunity_to_all_sound-based_moves.
167	speed_boost	its_speed_stat_is_boosted_every_turn.
168	stakeout	doubles_the_damage_dealt_to_the_target's_replacement_if_the_target_switches_out.
169	stance_change	the_pokémon_changes_its_form_to_blade_forme_when_it_uses_an_attack_move_and_changes_to_shield_forme_when_it_uses_king's_shield.
170	static	the_pokémon_is_charged_with_static_electricity_so_contact_with_it_may_cause_paralysis.
171	steadfast	the_pokémon's_determination_boosts_the_speed_stat_each_time_the_pokémon_flinches.
172	steam_engine	boosts_the_pokémon's_speed_stat_drastically_if_hit_by_a_fire-_or_water-type_move.
173	steelworker	powers_up_steel-type_moves.
174	stench	by_releasing_stench_when_attacking_this_pokémon_may_cause_the_target_to_flinch.
175	sticky_hold	items_held_by_the_pokémon_are_stuck_fast_and_cannot_be_removed_by_other_pokémon.
176	strong_jaw	the_pokémon's_strong_jaw_boosts_the_power_of_its_biting_moves.
177	sturdy	it_cannot_be_knocked_out_with_one_hit._one-hit_ko_moves_cannot_knock_it_out_either.
178	suction_cups	this_pokémon_uses_suction_cups_to_stay_in_one_spot_to_negate_all_moves_and_items_that_force_switching_out.
179	surge_surfer	doubles_the_pokémon's_speed_stat_on_electric_terrain.
180	swarm	powers_up_bug-type_moves_when_the_pokémon's_hp_is_low.
181	sweet_veil	prevents_itself_and_ally_pokémon_from_falling_asleep.
182	swift_swim	boosts_the_pokémon's_speed_stat_in_rain.
183	synchronize	the_attacker_will_receive_the_same_status_condition_if_it_inflicts_a_burn_poison_or_paralysis_to_the_pokémon.
184	tangled_feet	raises_evasiveness_if_the_pokémon_is_confused.
185	technician	powers_up_the_pokémon's_weaker_moves.
186	telepathy	anticipates_an_ally's_attack_and_dodges_it.
187	teravolt	moves_can_be_used_on_the_target_regardless_of_its_abilities.
188	thick_fat	the_pokémon_is_protected_by_a_layer_of_thick_fat_which_halves_the_damage_taken_from_fire-_and_ice-type_moves._
189	torrent	powers_up_water-type_moves_when_the_pokémon's_hp_is_low._
190	tough_claws	powers_up_moves_that_make_direct_contact._
191	trace	when_it_enters_a_battle_the_pokémon_copies_an_opposing_pokémon's_ability.
192	transistor	powers_up_electric-type_moves.
193	truant	the_pokémon_can't_use_a_move_if_it_had_used_a_move_on_the_previous_turn.
194	turboblaze	moves_can_be_used_on_the_target_regardless_of_its_abilities.
195	unaware	when_attacking_the_pokémon_ignores_the_target_pokémon's_stat_changes.
196	unnerve	unnerves_opposing_pokémon_and_makes_them_unable_to_eat_berries.
197	unseen_fist	the_pokémon_can_deal_damage_with_moves_that_make_physical_contact_even_if_the_target_is_protected.
198	victory_star	boosts_the_accuracy_of_its_allies_and_itself.
199	vital_spirit	the_pokémon_is_full_of_vitality_and_that_prevents_it_from_falling_asleep.
200	volt_absorb	restores_hp_if_hit_by_an_electric-type_move_instead_of_taking_damage.
201	wandering_spirit	the_pokémon_exchanges_abilities_with_a_pokémon_that_hits_it_with_a_move_that_makes_direct_contact.
202	water_absorb	restores_hp_if_hit_by_a_water-type_move_instead_of_taking_damage.
203	water_bubble	lowers_the_power_of_fire-type_moves_done_to_the_pokémon_and_prevents_the_pokémon_from_getting_a_burn.
204	water_compaction	boosts_the_pokémon's_defense_stat_sharply_when_hit_by_a_water-type_move.
205	water_veil	the_pokémon_is_covered_with_a_water_veil_which_prevents_the_pokémon_from_getting_a_burn.
206	weak_armor	physical_attacks_to_the_pokémon_lower_its_defense_stat_but_sharply_raise_its_speed_stat.
207	white_smoke	the_pokémon_is_protected_by_its_white_smoke_which_prevents_other_pokémon_from_lowering_its_stats.
208	wimp_out	the_pokémon_cowardly_switches_out_when_its_hp_becomes_half_or_less.
209	wonder_guard	its_mysterious_power_only_lets_supereffective_moves_hit_the_pokémon.
210	wonder_skin	makes_status_moves_more_likely_to_miss.
211	zen_mode	changes_the_pokémon's_shape_when_hp_is_half_or_less.
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
-- Data for Name: pokemon; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pokemon (id, pokedex_number, pokemon_name, is_legendary, type1_id, type2_id, ability1_id, ability2_id, hidden_ability, health, attack, defense, special_attack, special_defense, speed, region_id, catch_rate, male_percent, game_id, egg_group1_id, egg_group2_id) FROM stdin;
0	1	bulbasaur	0	9	13	113	\N	19	45	49	49	65	0	45	5	45	87.5	10	10	7
1	2	ivysaur	0	9	13	113	\N	19	60	62	63	80	0	60	5	45	87.5	10	10	7
2	3	venusaur	0	9	13	113	\N	19	80	82	83	100	0	80	5	45	87.5	10	10	7
3	3	venusaur	0	9	13	188	\N	\N	80	100	123	122	120	80	4	45	87.5	15	10	7
4	4	charmander	0	6	\N	15	\N	163	39	52	43	50	0	65	5	45	87.5	10	10	3
5	5	charmeleon	0	6	\N	15	\N	163	58	64	58	65	0	80	5	45	87.5	10	10	3
6	6	charizard	0	6	7	15	\N	163	78	84	78	85	0	100	5	45	87.5	10	10	3
7	6	charizard	0	6	2	190	\N	\N	78	130	111	130	85	100	4	45	87.5	15	10	3
8	6	charizard	0	6	7	43	\N	\N	78	104	78	159	115	100	4	45	87.5	15	10	3
9	7	squirtle	0	17	\N	189	\N	\N	44	48	65	50	0	43	5	45	87.5	10	10	12
10	8	wartortle	0	17	\N	189	\N	\N	59	63	80	65	0	58	5	45	87.5	10	10	12
11	9	blastoise	0	17	\N	189	\N	\N	79	83	100	85	0	78	5	45	87.5	10	10	12
12	9	blastoise	0	17	\N	99	\N	\N	79	103	120	135	115	78	4	45	87.5	15	10	12
13	848	toxel	0	3	13	131	170	\N	40	38	35	54	35	40	1	75	50.0	13	11	\N
14	849	toxtricity	0	3	13	128	118	185	75	98	70	114	70	75	1	45	50.0	13	8	\N
15	849	toxtricity	0	3	13	128	102	185	75	98	70	114	70	75	1	45	50.0	13	8	\N
16	30	nidorina	0	13	\N	119	137	71	70	62	67	55	0	56	5	120	0.0	10	11	\N
17	31	nidoqueen	0	13	10	119	137	154	90	92	87	75	85	76	5	45	0.0	10	11	\N
18	392	infernape	0	6	5	15	\N	85	76	104	71	104	71	108	6	45	87.5	2	5	8
19	403	shinx	0	3	\N	137	82	66	45	65	34	40	34	45	6	235	50.0	2	5	\N
20	404	luxio	0	3	\N	137	82	66	60	85	49	60	49	60	6	120	50.0	2	5	\N
21	405	luxray	0	3	\N	137	82	66	80	120	79	95	79	70	6	45	50.0	2	5	\N
22	11	metapod	0	0	\N	153	\N	\N	50	20	55	25	0	30	5	120	50.0	10	1	\N
23	12	butterfree	0	0	7	24	\N	\N	60	45	50	90	80	70	5	45	50.0	10	1	\N
24	679	honedge	0	16	8	110	\N	\N	45	80	100	35	37	28	4	180	50.0	15	9	\N
25	680	doublade	0	16	8	110	\N	\N	59	110	150	45	49	35	4	90	50.0	15	9	\N
26	15	beedrill	0	0	13	180	\N	\N	65	90	40	45	80	75	5	45	50.0	10	1	\N
27	15	beedrill	0	0	13	0	\N	\N	65	150	40	15	80	145	4	45	50.0	8	1	\N
28	132	ditto	0	12	\N	92	\N	\N	48	48	48	48	0	48	5	35	0.0	10	2	\N
29	14	kakuna	0	0	13	153	\N	\N	45	25	50	25	0	35	5	120	50.0	10	1	\N
30	13	weedle	0	0	13	156	\N	141	40	35	30	20	0	50	5	255	50.0	10	1	\N
31	10	caterpie	0	0	\N	156	\N	141	45	30	35	20	0	45	5	255	50.0	10	1	\N
32	29	nidoran_f	0	13	\N	119	137	71	55	47	52	40	0	41	5	235	0.0	10	10	5
33	390	chimchar	0	6	\N	15	\N	85	44	58	44	58	44	61	6	45	87.5	2	5	8
34	391	monferno	0	6	5	15	\N	85	64	78	52	78	52	81	6	45	87.5	2	5	8
35	489	phione	2	17	\N	72	\N	\N	80	80	80	80	80	80	6	30	0.0	2	12	4
36	490	manaphy	2	17	\N	72	\N	\N	100	100	100	100	100	100	6	3	0.0	2	12	4
37	891	kubfu	3	5	\N	80	\N	\N	60	90	60	53	50	72	1	3	87.5	13	11	\N
38	892	urshifu	3	5	1	197	\N	\N	100	130	100	63	60	97	1	3	87.5	13	11	\N
39	892	urshifu	3	5	17	197	\N	\N	100	130	100	63	60	97	1	3	87.5	13	11	\N
40	898	calyrex	1	14	9	196	\N	\N	100	80	80	80	80	80	1	3	0.0	13	11	\N
41	151	mew	2	14	\N	183	\N	\N	100	100	100	100	0	100	5	45	0.0	10	11	\N
42	150	mewtwo	1	14	\N	124	\N	196	106	110	90	154	0	130	5	3	0.0	10	11	\N
43	150	mewtwo	1	14	\N	171	\N	\N	106	190	100	154	100	130	4	3	0.0	15	11	\N
44	150	mewtwo	1	14	\N	81	\N	\N	106	150	70	194	120	140	4	3	0.0	15	11	\N
45	81	magnemite	0	3	16	97	177	\N	25	35	70	95	0	45	5	190	0.0	10	9	\N
46	100	voltorb	0	3	\N	166	170	2	40	30	50	55	0	100	5	190	0.0	10	9	\N
47	32	nidoran_m	0	13	\N	119	137	71	46	57	40	40	0	50	5	235	100.0	10	10	5
48	33	nidorino	0	13	\N	119	137	71	61	72	57	55	0	65	5	120	100.0	10	10	5
49	34	nidoking	0	13	10	119	137	154	81	102	77	85	75	85	5	45	100.0	10	10	5
50	173	cleffa	0	4	\N	29	94	\N	50	25	28	45	55	15	3	150	25.0	5	11	\N
51	35	clefairy	0	4	\N	29	\N	\N	70	45	48	60	0	35	5	150	25.0	10	4	\N
52	36	clefable	0	4	\N	29	\N	195	95	70	73	95	90	60	5	25	25.0	10	4	\N
53	37	vulpix	0	6	\N	52	\N	43	38	41	40	65	0	65	5	190	25.0	10	5	\N
54	37	vulpix	0	11	\N	161	\N	162	38	41	40	50	65	65	0	190	25.0	12	5	\N
55	38	ninetales	0	6	\N	52	\N	43	73	76	75	100	0	100	5	75	25.0	10	5	\N
56	38	ninetales	0	11	4	161	\N	162	73	67	75	81	100	109	0	75	25.0	12	5	\N
57	174	igglybuff	0	12	4	29	23	\N	90	30	15	40	20	15	3	170	25.0	5	11	\N
58	39	jigglypuff	0	12	4	29	23	\N	115	45	20	25	0	20	5	170	25.0	10	4	\N
59	40	wigglytuff	0	12	4	29	23	58	140	70	45	85	50	45	5	50	25.0	10	4	\N
60	41	zubat	0	13	7	80	\N	\N	40	45	35	40	0	55	5	255	50.0	10	6	\N
61	42	golbat	0	13	7	80	\N	\N	75	80	70	75	0	95	5	90	50.0	10	6	\N
62	169	crobat	0	13	7	80	\N	\N	85	90	80	70	80	130	3	90	50.0	5	6	\N
63	43	oddish	0	9	13	19	\N	141	45	50	55	75	0	30	5	255	50.0	10	7	\N
64	44	gloom	0	9	13	19	\N	174	60	65	70	85	0	40	5	120	50.0	10	7	\N
65	45	vileplume	0	9	13	19	\N	46	75	80	85	110	90	50	5	45	50.0	10	7	\N
66	182	bellossom	0	9	\N	19	\N	67	75	80	95	90	100	50	3	45	50.0	5	7	\N
67	46	paras	0	0	9	46	44	30	35	70	55	55	0	25	5	190	50.0	10	1	7
68	47	parasect	0	0	9	46	44	30	60	95	80	80	0	30	5	75	50.0	10	1	7
69	48	venonat	0	0	13	24	\N	141	60	55	50	40	0	45	5	190	50.0	10	1	\N
70	49	venomoth	0	0	13	156	\N	210	70	65	60	90	0	90	5	75	50.0	10	1	\N
71	50	diglett	0	10	\N	146	\N	142	10	55	25	45	0	95	5	255	50.0	10	5	\N
72	51	dugtrio	0	10	\N	146	\N	142	35	100	50	50	70	120	5	50	50.0	10	5	\N
73	50	diglett	0	10	16	146	\N	142	10	55	30	35	45	90	0	255	50.0	12	5	\N
74	51	dugtrio	0	10	16	146	\N	142	35	100	60	50	70	110	0	50	50.0	12	5	\N
75	16	pidgey	0	12	7	87	184	14	40	45	40	35	0	56	5	255	50.0	10	6	\N
76	17	pidgeotto	0	12	7	87	184	14	63	60	55	50	0	71	5	120	50.0	10	6	\N
77	18	pidgeot	0	12	7	87	184	14	83	80	75	70	70	101	5	45	50.0	10	6	\N
78	18	pidgeot	0	12	7	110	\N	\N	83	80	80	135	80	121	4	45	50.0	8	6	\N
79	19	rattata	0	12	\N	141	66	71	30	56	35	25	0	72	5	255	50.0	10	5	\N
80	19	rattata	0	1	12	61	71	188	30	56	35	25	35	72	0	255	50.0	12	5	\N
81	20	raticate	0	12	\N	141	66	71	55	81	60	50	0	97	5	127	50.0	10	5	\N
82	20	raticate	0	1	12	61	71	188	75	71	70	40	80	77	0	127	50.0	12	5	\N
83	21	spearow	0	12	7	87	\N	\N	40	60	30	31	0	70	5	255	50.0	10	6	\N
84	22	fearow	0	12	7	87	\N	\N	65	90	65	61	0	100	5	90	50.0	10	6	\N
85	23	ekans	0	13	\N	82	153	196	35	60	44	40	0	55	5	255	50.0	10	5	3
86	24	arbok	0	13	\N	82	153	196	60	95	69	65	79	80	5	90	50.0	10	5	3
87	172	pichu	0	3	\N	170	\N	91	20	40	15	35	35	60	3	190	50.0	5	11	\N
88	25	pikachu	0	3	\N	170	\N	91	35	55	40	50	0	90	5	190	50.0	10	5	4
89	26	raichu	0	3	\N	170	\N	91	60	90	55	90	80	110	5	75	50.0	10	5	4
90	26	raichu	0	3	14	179	\N	\N	60	85	50	95	85	110	0	75	50.0	12	5	4
91	27	sandshrew	0	10	\N	146	\N	143	50	75	85	30	0	40	5	255	50.0	10	5	\N
92	27	sandshrew	0	11	16	161	\N	\N	50	75	90	10	35	40	0	255	50.0	12	5	\N
93	28	sandslash	0	10	\N	146	\N	143	75	100	110	55	0	65	5	90	50.0	10	5	\N
94	28	sandslash	0	11	16	161	\N	\N	75	100	120	25	65	65	0	90	50.0	12	5	\N
95	52	meowth	0	12	\N	116	185	196	40	45	35	40	0	90	5	255	50.0	10	5	\N
96	52	meowth	0	1	\N	116	185	131	40	35	35	50	40	90	0	255	50.0	12	5	\N
97	52	meowth	0	16	\N	116	190	196	50	65	55	40	40	40	1	255	50.0	13	5	\N
98	863	perrserker	0	16	\N	10	190	\N	70	110	100	50	60	50	1	90	50.0	13	5	\N
99	53	persian	0	12	\N	92	185	196	65	70	60	65	0	115	5	90	50.0	10	5	\N
100	53	persian	0	1	\N	60	185	131	65	60	60	75	65	115	0	90	50.0	12	5	\N
101	54	psyduck	0	17	\N	30	\N	182	50	52	48	50	0	55	5	190	50.0	10	12	5
102	101	electrode	0	3	\N	166	170	2	60	50	70	80	80	150	5	60	0.0	10	9	\N
103	102	exeggcute	0	9	14	19	\N	\N	60	40	80	60	0	40	5	90	50.0	10	7	\N
104	103	exeggutor	0	9	14	19	\N	\N	95	95	85	125	75	55	5	45	50.0	10	7	\N
105	104	cubone	0	10	\N	139	91	10	50	50	95	40	0	35	5	190	50.0	10	10	\N
106	105	marowak	0	10	\N	139	91	10	60	80	110	50	0	45	5	75	50.0	10	10	\N
107	106	hitmonlee	0	5	\N	92	133	\N	50	120	53	35	0	87	5	45	100.0	10	8	\N
108	107	hitmonchan	0	5	\N	87	85	80	50	105	79	35	0	76	5	45	100.0	10	8	\N
109	108	lickitung	0	12	\N	114	111	\N	90	55	75	60	0	30	5	45	50.0	10	10	\N
110	109	koffing	0	13	\N	89	\N	\N	40	65	95	60	0	35	5	190	50.0	10	0	\N
111	110	weezing	0	13	\N	89	\N	\N	65	90	120	85	0	60	5	60	50.0	10	0	\N
112	111	rhyhorn	0	10	15	91	139	133	80	85	95	30	0	25	5	120	50.0	10	10	5
113	112	rhydon	0	10	15	91	139	133	105	130	120	45	0	40	5	60	50.0	10	10	5
114	113	chansey	0	12	\N	108	150	67	250	5	5	105	0	50	5	30	0.0	10	4	\N
115	114	tangela	0	9	\N	19	88	135	65	55	115	100	0	60	5	45	50.0	10	7	\N
116	115	kangaskhan	0	12	\N	45	149	80	105	95	80	40	0	90	5	45	0.0	10	10	\N
117	116	horsea	0	17	\N	182	\N	30	30	40	70	70	0	60	5	225	50.0	10	12	3
118	117	seadra	0	17	\N	119	\N	30	55	65	95	95	0	85	5	75	50.0	10	12	3
119	118	goldeen	0	17	\N	182	205	91	45	67	60	50	0	63	5	225	50.0	10	13	\N
120	119	seaking	0	17	\N	182	205	91	80	92	65	80	0	68	5	60	50.0	10	13	\N
121	120	staryu	0	17	\N	76	108	\N	30	45	55	70	0	85	5	225	0.0	10	14	\N
122	121	starmie	0	17	14	76	108	\N	60	75	85	100	0	115	5	60	0.0	10	14	\N
123	122	mr._mime	0	14	4	166	50	185	40	45	65	100	0	90	5	45	50.0	10	8	\N
124	123	scyther	0	0	7	180	185	171	70	110	80	55	0	105	5	45	50.0	10	1	\N
125	124	jynx	0	11	14	111	57	44	65	50	35	95	0	95	5	45	0.0	10	8	\N
126	125	electabuzz	0	3	\N	170	\N	199	65	83	57	85	0	105	5	45	75.0	10	8	\N
127	126	magmar	0	6	\N	51	\N	199	65	95	57	85	0	93	5	45	75.0	10	8	\N
128	127	pinsir	0	0	\N	73	104	\N	65	125	100	55	0	85	5	45	50.0	10	1	\N
129	128	tauros	0	12	\N	82	\N	154	75	100	95	70	0	110	5	45	100.0	10	5	\N
130	129	magikarp	0	17	\N	182	\N	131	20	10	55	20	0	80	5	255	50.0	10	13	3
131	130	gyarados	0	17	7	82	\N	\N	95	125	79	100	0	81	5	45	50.0	10	13	3
132	131	lapras	0	17	11	202	155	72	130	85	80	95	0	60	5	45	50.0	10	10	12
133	133	eevee	0	12	\N	141	0	4	55	55	50	65	0	55	5	45	87.5	10	5	\N
134	134	vaporeon	0	17	\N	202	\N	72	130	65	60	110	0	65	5	45	87.5	10	5	\N
135	135	jolteon	0	3	\N	200	\N	\N	65	65	60	110	0	130	5	45	87.5	10	5	\N
136	136	flareon	0	6	\N	52	\N	66	65	130	60	110	0	65	5	45	87.5	10	5	\N
137	137	porygon	0	12	\N	191	40	\N	65	60	70	75	0	40	5	45	0.0	10	9	\N
138	138	omanyte	0	15	17	182	155	206	35	40	100	90	0	35	5	45	87.5	10	12	14
139	139	omastar	0	15	17	182	155	206	70	60	125	115	0	55	5	45	87.5	10	12	14
140	140	kabuto	0	15	17	182	10	206	30	80	90	45	0	55	5	45	87.5	10	12	14
141	141	kabutops	0	15	17	182	10	206	60	115	105	70	0	80	5	45	87.5	10	12	14
142	142	aerodactyl	0	15	7	139	124	196	80	105	65	60	0	130	5	45	87.5	10	6	\N
143	143	snorlax	0	12	\N	78	188	61	160	110	65	65	0	30	5	25	87.5	10	10	\N
144	144	articuno	3	11	7	124	\N	161	90	85	100	125	0	85	5	3	0.0	10	11	\N
145	145	zapdos	3	3	7	124	\N	170	90	90	85	125	0	100	5	3	0.0	10	11	\N
146	146	moltres	3	6	7	124	\N	51	90	100	90	125	0	90	5	3	0.0	10	11	\N
147	147	dratini	0	2	\N	153	\N	98	41	64	45	50	0	50	5	45	50.0	10	12	3
148	148	dragonair	0	2	\N	153	\N	98	61	84	65	70	0	70	5	45	50.0	10	12	3
149	149	dragonite	0	2	7	80	\N	\N	91	134	95	100	0	80	5	45	50.0	10	12	3
150	152	chikorita	0	9	\N	113	\N	88	45	49	65	49	65	45	3	45	87.5	5	10	7
151	153	bayleef	0	9	\N	113	\N	88	60	62	80	63	80	60	3	45	87.5	5	10	7
152	154	meganium	0	9	\N	113	\N	88	80	82	100	83	100	80	3	45	87.5	5	10	7
153	155	cyndaquil	0	6	\N	15	\N	52	39	52	43	60	50	65	3	45	87.5	5	5	\N
154	156	quilava	0	6	\N	15	\N	52	58	64	58	80	65	80	3	45	87.5	5	5	\N
155	157	typhlosion	0	6	\N	15	\N	52	78	84	78	109	85	100	3	45	87.5	5	5	\N
156	158	totodile	0	17	\N	189	\N	154	50	65	64	44	48	43	3	45	87.5	5	10	12
157	159	croconaw	0	17	\N	189	\N	154	65	80	80	59	63	58	3	45	87.5	5	10	12
158	160	feraligatr	0	17	\N	189	\N	154	85	105	100	79	83	78	3	45	87.5	5	10	12
159	161	sentret	0	12	\N	141	87	58	35	46	34	35	45	20	3	255	50.0	5	5	\N
160	162	furret	0	12	\N	141	87	58	85	76	64	45	55	90	3	90	50.0	5	5	\N
161	163	hoothoot	0	12	7	81	87	\N	60	30	30	36	56	50	3	255	50.0	5	6	\N
162	164	noctowl	0	12	7	81	87	\N	100	50	50	86	96	70	3	90	50.0	5	6	\N
163	165	ledyba	0	0	7	180	45	131	40	20	30	40	80	55	3	255	50.0	5	1	\N
164	166	ledian	0	0	7	180	45	85	55	35	50	55	110	85	3	90	50.0	5	1	\N
165	167	spinarak	0	0	13	180	81	\N	40	60	40	40	40	30	3	255	50.0	5	1	\N
166	168	ariados	0	0	13	180	81	\N	70	90	70	60	70	40	3	90	50.0	5	1	\N
167	170	chinchou	0	17	3	200	76	202	75	38	38	56	56	67	3	190	50.0	5	13	\N
168	171	lanturn	0	17	3	200	76	202	125	58	58	76	76	67	3	75	50.0	5	13	\N
169	175	togepi	0	4	\N	71	150	\N	35	20	65	40	65	20	3	190	87.5	5	11	\N
170	176	togetic	0	4	7	71	150	\N	55	40	85	80	105	40	3	75	87.5	5	6	4
171	177	natu	0	14	7	183	45	94	40	50	45	70	45	70	3	190	50.0	5	6	\N
172	178	xatu	0	14	7	183	45	94	65	75	70	95	70	95	3	75	50.0	5	6	\N
173	179	mareep	0	3	\N	170	\N	118	55	40	40	65	45	35	3	235	50.0	5	10	5
174	180	flaaffy	0	3	\N	170	\N	118	70	55	55	80	60	45	3	120	50.0	5	10	5
175	181	ampharos	0	3	\N	170	\N	118	90	75	85	115	90	55	3	45	50.0	5	10	5
176	183	marill	0	17	4	188	69	147	70	20	50	20	50	40	3	190	50.0	5	12	4
177	184	azumarill	0	17	4	188	69	147	100	50	80	60	80	50	3	75	50.0	5	12	4
178	185	sudowoodo	0	15	\N	177	139	131	70	110	115	30	65	30	3	65	50.0	5	9	\N
179	186	politoed	0	17	\N	202	30	42	90	75	75	90	100	70	3	45	50.0	5	12	\N
180	187	hoppip	0	9	7	19	88	\N	35	35	40	35	55	50	3	255	50.0	5	4	7
181	188	skiploom	0	9	7	19	88	\N	55	45	50	45	65	80	3	120	50.0	5	4	7
182	189	jumpluff	0	9	7	19	88	\N	75	55	70	55	95	110	3	45	50.0	5	4	7
183	190	aipom	0	12	\N	141	116	159	55	70	55	40	55	85	3	45	50.0	5	5	\N
184	191	sunkern	0	9	\N	19	163	45	30	30	30	30	30	30	3	235	50.0	5	7	\N
185	192	sunflora	0	9	\N	19	163	45	75	75	55	105	85	30	3	120	50.0	5	7	\N
186	193	yanma	0	0	7	167	24	58	65	65	45	75	45	95	3	75	50.0	5	1	\N
187	194	wooper	0	17	10	30	202	195	55	45	45	25	25	15	3	255	50.0	5	12	5
188	195	quagsire	0	17	10	30	202	195	95	85	85	65	65	35	3	90	50.0	5	12	5
189	196	espeon	0	14	\N	183	\N	94	65	65	60	130	95	110	3	45	87.5	5	5	\N
190	197	umbreon	0	1	\N	183	\N	80	95	65	110	60	130	65	3	45	87.5	5	5	\N
191	198	murkrow	0	1	7	81	\N	123	60	85	42	85	42	91	3	30	50.0	5	6	\N
192	199	slowking	0	17	14	111	114	135	95	75	80	100	110	30	3	70	50.0	5	10	12
193	200	misdreavus	0	8	\N	89	\N	\N	60	60	60	85	85	85	3	45	50.0	5	0	\N
194	201	unown	0	14	\N	89	\N	\N	48	72	48	72	48	48	3	225	0.0	5	11	\N
195	202	wobbuffet	0	14	\N	152	\N	186	190	33	58	33	58	33	3	45	50.0	5	0	\N
196	203	girafarig	0	12	14	80	45	147	70	80	65	90	65	85	3	60	50.0	5	5	\N
197	204	pineco	0	0	\N	177	\N	112	50	65	90	35	35	15	3	190	50.0	5	1	\N
198	205	forretress	0	0	16	177	\N	112	75	90	140	60	60	40	3	75	50.0	5	1	\N
199	206	dunsparce	0	12	\N	150	141	131	100	70	70	65	65	45	3	190	50.0	5	5	\N
200	207	gligar	0	10	7	73	146	78	65	75	105	35	65	85	3	60	50.0	5	1	\N
201	208	steelix	0	16	10	139	177	154	75	85	200	55	65	30	3	25	50.0	5	9	\N
202	209	snubbull	0	4	\N	82	141	131	60	80	50	40	40	30	3	190	25.0	5	5	4
203	210	granbull	0	4	\N	82	\N	131	90	120	75	60	60	45	3	75	25.0	5	5	4
204	211	qwilfish	0	17	13	119	182	82	65	95	85	55	55	85	3	45	50.0	5	13	\N
205	212	scizor	0	0	16	180	185	90	70	130	100	55	80	65	3	25	50.0	5	1	\N
206	213	shuckle	0	0	15	177	61	\N	20	10	230	10	230	5	3	190	50.0	5	1	\N
207	214	heracross	0	0	5	180	66	\N	80	125	75	40	95	85	3	45	50.0	5	1	\N
208	215	sneasel	0	1	11	80	87	\N	55	95	55	35	75	115	3	60	50.0	5	5	\N
209	216	teddiursa	0	12	\N	116	\N	68	60	80	50	50	50	40	3	120	50.0	5	5	\N
210	217	ursaring	0	12	\N	66	\N	196	90	130	75	75	75	55	3	60	50.0	5	5	\N
211	218	slugma	0	6	\N	96	51	206	40	40	40	70	40	20	3	190	50.0	5	0	\N
212	219	magcargo	0	6	15	96	51	206	60	50	120	90	80	30	3	75	50.0	5	0	\N
213	220	swinub	0	11	10	111	161	188	50	50	40	30	30	50	3	225	50.0	5	5	\N
214	221	piloswine	0	11	10	111	161	188	100	100	80	60	60	50	3	75	50.0	5	5	\N
215	222	corsola	0	17	15	71	108	135	65	55	95	65	95	35	3	60	25.0	5	12	14
216	223	remoraid	0	17	\N	71	\N	\N	35	65	35	65	35	65	3	190	50.0	5	12	13
217	224	octillery	0	17	\N	178	\N	\N	75	105	75	105	75	45	3	75	50.0	5	12	13
218	225	delibird	0	11	7	199	\N	81	45	55	45	65	45	75	3	45	50.0	5	12	5
219	226	mantine	0	17	7	182	202	205	85	40	70	80	140	70	3	25	50.0	5	12	\N
220	227	skarmory	0	16	7	87	177	206	65	80	140	40	70	70	3	25	50.0	5	6	\N
221	228	houndour	0	1	6	45	52	196	45	60	30	80	50	65	3	120	50.0	5	5	\N
222	229	houndoom	0	1	6	45	52	196	75	90	50	110	80	95	3	45	50.0	5	5	\N
223	230	kingdra	0	17	2	182	\N	30	75	95	95	95	95	85	3	45	50.0	5	12	3
224	231	phanpy	0	10	\N	116	\N	146	90	60	60	40	40	40	3	120	50.0	5	5	\N
225	232	donphan	0	10	\N	177	\N	146	90	120	120	60	60	50	3	60	50.0	5	5	\N
226	233	porygon2	0	12	\N	191	40	\N	85	80	90	105	95	60	3	45	0.0	5	9	\N
227	234	stantler	0	12	\N	82	58	147	73	95	62	85	65	85	3	45	50.0	5	5	\N
228	235	smeargle	0	12	\N	114	185	\N	55	20	35	20	45	75	3	45	50.0	5	5	\N
229	236	tyrogue	0	5	\N	66	171	199	35	35	35	35	35	35	3	75	100.0	5	11	\N
230	237	hitmontop	0	5	\N	82	185	171	50	95	95	35	110	70	3	45	100.0	5	8	\N
231	238	smoochum	0	11	14	111	57	72	45	30	15	85	65	65	3	45	0.0	5	11	\N
232	239	elekid	0	3	\N	170	\N	199	45	63	37	65	55	95	3	45	75.0	5	11	\N
233	240	magby	0	6	\N	51	\N	199	45	75	37	70	55	83	3	45	75.0	5	11	\N
234	241	miltank	0	12	\N	188	149	147	95	80	105	40	70	100	3	45	0.0	5	5	\N
235	242	blissey	0	12	\N	108	150	67	255	10	10	75	135	55	3	30	0.0	5	4	\N
236	243	raikou	3	3	\N	124	\N	\N	90	85	75	115	100	115	3	3	0.0	5	11	\N
237	244	entei	3	6	\N	124	\N	80	115	115	85	90	75	100	3	3	0.0	5	11	\N
238	245	suicune	3	17	\N	124	\N	80	100	75	115	90	115	85	3	3	0.0	5	11	\N
239	246	larvitar	0	15	10	66	\N	146	50	64	50	45	50	41	3	45	50.0	5	10	\N
240	247	pupitar	0	15	10	153	\N	\N	70	84	70	65	70	51	3	45	50.0	5	10	\N
241	248	tyranitar	0	15	1	145	\N	196	100	134	110	95	100	61	3	45	50.0	5	10	\N
242	249	lugia	1	14	7	124	\N	\N	106	90	130	90	154	110	3	3	0.0	5	11	\N
243	250	ho-oh	1	6	7	124	\N	135	106	130	90	110	154	90	3	3	0.0	5	11	\N
244	251	celebi	2	14	9	108	\N	\N	100	100	100	100	100	100	3	45	0.0	5	11	\N
245	252	treecko	0	9	\N	113	\N	\N	40	45	35	65	55	70	2	45	87.5	11	10	3
246	253	grovyle	0	9	\N	113	\N	\N	50	65	45	85	65	95	2	45	87.5	11	10	3
247	254	sceptile	0	9	\N	113	\N	\N	70	85	65	105	85	120	2	45	87.5	11	10	3
248	255	torchic	0	6	\N	15	\N	167	45	60	40	70	50	45	2	45	87.5	11	5	\N
249	256	combusken	0	6	5	15	\N	167	60	85	60	85	60	55	2	45	87.5	11	5	\N
250	257	blaziken	0	6	5	15	\N	167	80	120	70	110	70	80	2	45	87.5	11	5	\N
251	258	mudkip	0	17	\N	189	\N	30	50	70	50	50	50	40	2	45	87.5	11	10	12
252	259	marshtomp	0	17	10	189	\N	30	70	85	70	60	70	50	2	45	87.5	11	10	12
253	260	swampert	0	17	10	189	\N	30	100	110	90	85	90	60	2	45	87.5	11	10	12
254	261	poochyena	0	1	\N	141	\N	131	35	55	35	30	30	35	2	255	50.0	11	5	\N
255	262	mightyena	0	1	\N	82	\N	\N	70	90	70	60	60	70	2	127	50.0	11	5	\N
256	263	zigzagoon	0	12	\N	116	61	\N	38	30	41	30	41	60	2	255	50.0	11	5	\N
257	264	linoone	0	12	\N	116	61	\N	78	70	61	50	61	100	2	90	50.0	11	5	\N
258	265	wurmple	0	0	\N	156	\N	141	45	45	35	20	30	20	2	255	50.0	11	1	\N
259	266	silcoon	0	0	\N	153	\N	\N	50	35	55	25	25	15	2	120	50.0	11	1	\N
260	267	beautifly	0	0	7	180	\N	137	60	70	50	100	50	65	2	45	50.0	11	1	\N
261	268	cascoon	0	0	\N	153	\N	\N	50	35	55	25	25	15	2	120	50.0	11	1	\N
262	269	dustox	0	0	13	156	\N	24	60	50	70	50	90	65	2	45	50.0	11	1	\N
263	270	lotad	0	17	9	182	\N	114	40	30	30	40	50	30	2	255	50.0	11	12	7
264	271	lombre	0	17	9	182	\N	114	60	50	50	60	70	50	2	120	50.0	11	12	7
265	272	ludicolo	0	17	9	182	\N	114	80	70	70	90	100	70	2	45	50.0	11	12	7
266	273	seedot	0	9	\N	19	45	\N	40	40	50	30	30	30	2	255	50.0	11	5	7
267	274	nuzleaf	0	9	1	19	45	\N	70	70	40	60	40	60	2	120	50.0	11	5	7
268	275	shiftry	0	9	1	19	45	\N	90	100	60	90	60	80	2	45	50.0	11	4	7
269	276	taillow	0	12	7	66	\N	149	40	55	30	30	30	85	2	200	50.0	11	6	\N
270	277	swellow	0	12	7	66	\N	149	60	85	60	75	50	125	2	45	50.0	11	6	\N
271	278	wingull	0	17	7	87	72	\N	40	30	30	55	30	85	2	190	50.0	11	12	6
272	279	pelipper	0	17	7	87	42	\N	60	50	100	95	70	65	2	45	50.0	11	12	6
273	280	ralts	0	14	4	183	191	186	28	25	25	45	35	40	2	235	50.0	11	8	0
274	281	kirlia	0	14	4	183	191	186	38	35	35	65	55	50	2	120	50.0	11	8	0
275	282	gardevoir	0	14	4	183	191	186	68	65	65	125	115	80	2	45	50.0	11	8	0
276	283	surskit	0	0	17	182	\N	\N	40	30	32	50	52	65	2	200	50.0	11	12	1
277	284	masquerain	0	0	7	82	\N	196	70	60	62	100	82	80	2	75	50.0	11	12	1
278	285	shroomish	0	9	\N	46	\N	\N	60	40	60	40	60	35	2	255	50.0	11	4	7
279	286	breloom	0	9	5	46	\N	185	60	130	80	60	60	70	2	90	50.0	11	4	7
280	287	slakoth	0	12	\N	193	\N	\N	60	60	60	35	35	30	2	255	50.0	11	5	\N
281	288	vigoroth	0	12	\N	199	\N	\N	80	80	80	55	55	90	2	120	50.0	11	5	\N
282	289	slaking	0	12	\N	193	\N	\N	150	160	100	95	65	100	2	45	50.0	11	5	\N
283	290	nincada	0	0	10	24	\N	141	31	45	90	30	30	40	2	255	50.0	11	1	\N
284	291	ninjask	0	0	7	167	\N	\N	61	90	45	50	50	160	2	120	50.0	11	1	\N
285	292	shedinja	0	0	8	209	\N	\N	1	90	45	30	30	40	2	45	0.0	11	9	\N
286	293	whismur	0	12	\N	166	\N	131	64	51	23	51	23	28	2	190	50.0	11	10	5
287	294	loudred	0	12	\N	166	\N	149	84	71	43	71	43	48	2	120	50.0	11	10	5
288	295	exploud	0	12	\N	166	\N	149	104	91	63	91	73	68	2	45	50.0	11	10	5
289	296	makuhita	0	5	\N	188	66	154	72	60	30	20	30	25	2	180	75.0	11	8	\N
290	297	hariyama	0	5	\N	188	66	154	144	120	60	40	60	50	2	200	75.0	11	8	\N
291	298	azurill	0	12	4	188	69	147	50	20	40	20	40	20	2	150	25.0	11	11	\N
292	299	nosepass	0	15	\N	177	97	142	30	45	135	45	90	30	2	255	50.0	11	9	\N
293	300	skitty	0	12	\N	29	\N	210	50	45	45	35	35	50	2	255	25.0	11	5	4
294	301	delcatty	0	12	\N	29	\N	210	70	65	65	55	55	90	2	60	25.0	11	5	4
295	302	sableye	0	1	8	87	\N	123	50	75	75	65	65	50	2	45	50.0	11	8	\N
296	303	mawile	0	16	4	73	82	154	50	85	85	55	55	50	2	45	50.0	11	5	4
297	304	aron	0	16	15	177	139	\N	50	70	100	40	40	30	2	180	50.0	11	10	\N
298	305	lairon	0	16	15	177	139	\N	60	90	140	50	50	40	2	90	50.0	11	10	\N
299	306	aggron	0	16	15	177	139	\N	70	110	180	60	60	50	2	45	50.0	11	10	\N
300	307	meditite	0	5	14	129	\N	186	30	40	55	40	55	60	2	180	50.0	11	8	\N
301	308	medicham	0	5	14	129	\N	186	60	60	75	60	75	80	2	90	50.0	11	8	\N
302	309	electrike	0	3	\N	170	91	102	40	45	40	65	40	65	2	120	50.0	11	5	\N
303	310	manectric	0	3	\N	170	91	102	70	75	60	105	60	105	2	45	50.0	11	5	\N
304	311	plusle	0	3	\N	118	\N	91	60	50	40	85	75	95	2	200	50.0	11	4	\N
305	312	minun	0	3	\N	102	\N	200	60	40	50	75	85	95	2	200	50.0	11	4	\N
306	313	volbeat	0	0	\N	76	180	123	65	73	75	47	85	85	2	150	100.0	11	1	8
307	314	illumise	0	0	\N	111	\N	123	65	47	75	73	85	85	2	150	0.0	11	1	8
308	315	roselia	0	9	13	108	119	88	50	60	45	100	80	65	2	150	50.0	11	4	7
309	316	gulpin	0	13	\N	93	175	61	70	43	53	43	53	40	2	225	50.0	11	0	\N
310	317	swalot	0	13	\N	93	175	61	100	73	83	73	83	55	2	75	50.0	11	0	\N
311	318	carvanha	0	17	1	140	\N	167	45	90	20	65	20	65	2	225	50.0	11	13	\N
312	319	sharpedo	0	17	1	140	\N	167	70	120	40	95	40	95	2	60	50.0	11	13	\N
313	320	wailmer	0	17	\N	205	111	124	130	70	35	70	35	60	2	125	50.0	11	5	13
314	321	wailord	0	17	\N	205	111	124	170	90	45	90	45	60	2	60	50.0	11	5	13
315	322	numel	0	6	10	111	158	114	60	60	40	65	45	35	2	255	50.0	11	5	\N
316	323	camerupt	0	6	10	96	164	\N	70	100	70	105	75	40	2	150	50.0	11	5	\N
317	324	torkoal	0	6	\N	207	43	155	70	85	140	85	70	20	2	90	50.0	11	5	\N
318	325	spoink	0	14	\N	188	114	61	60	25	35	70	80	60	2	255	50.0	11	5	\N
319	326	grumpig	0	14	\N	188	114	61	80	45	65	90	110	80	2	60	50.0	11	5	\N
320	327	spinda	0	12	\N	114	184	\N	60	60	60	60	60	60	2	255	50.0	11	5	8
321	328	trapinch	0	10	\N	73	\N	154	45	100	45	45	45	10	2	255	50.0	11	1	3
322	329	vibrava	0	10	2	89	\N	\N	50	70	50	50	50	70	2	120	50.0	11	1	3
323	330	flygon	0	10	2	89	\N	\N	80	100	80	80	80	100	2	45	50.0	11	1	3
324	331	cacnea	0	9	\N	146	\N	202	50	85	40	85	40	35	2	190	50.0	11	7	8
325	332	cacturne	0	9	1	146	\N	202	70	115	60	115	60	55	2	60	50.0	11	7	8
326	333	swablu	0	12	7	108	\N	\N	45	40	60	40	75	50	2	255	50.0	11	6	3
327	334	altaria	0	2	7	108	\N	\N	75	70	90	70	105	80	2	45	50.0	11	6	3
328	335	zangoose	0	12	\N	78	\N	\N	73	115	60	60	60	90	2	90	50.0	11	5	\N
329	336	seviper	0	13	\N	153	\N	\N	73	100	60	100	60	65	2	90	50.0	11	5	3
330	337	lunatone	0	15	14	89	\N	\N	90	55	65	95	85	70	2	45	0.0	11	9	\N
331	338	solrock	0	15	14	89	\N	\N	90	95	85	55	65	70	2	45	0.0	11	9	\N
332	339	barboach	0	17	10	111	4	72	50	48	43	46	41	60	2	190	50.0	11	13	\N
333	340	whiscash	0	17	10	111	4	72	110	78	73	76	71	60	2	75	50.0	11	13	\N
334	341	corphish	0	17	\N	73	155	0	43	80	65	50	35	35	2	205	50.0	11	12	14
335	342	crawdaunt	0	17	1	73	155	0	63	120	85	90	55	55	2	155	50.0	11	12	14
336	343	baltoy	0	10	14	89	\N	\N	40	40	55	40	70	55	2	255	0.0	11	9	\N
337	344	claydol	0	10	14	89	\N	\N	60	70	105	70	120	75	2	90	0.0	11	9	\N
338	345	lileep	0	15	9	178	\N	\N	66	41	77	61	87	23	2	45	87.5	11	14	\N
339	346	cradily	0	15	9	178	\N	\N	86	81	97	81	107	43	2	45	87.5	11	14	\N
340	347	anorith	0	15	0	10	\N	182	45	95	50	40	50	75	2	45	87.5	11	14	\N
341	348	armaldo	0	15	0	10	\N	182	75	125	100	70	80	45	2	45	87.5	11	14	\N
342	349	feebas	0	17	\N	182	111	0	20	15	20	10	55	80	2	255	50.0	11	12	3
343	350	milotic	0	17	\N	98	23	29	95	60	79	100	125	81	2	60	50.0	11	12	3
344	351	castform	0	12	\N	56	\N	\N	70	70	70	70	70	70	2	45	50.0	11	4	0
345	352	kecleon	0	12	\N	21	\N	\N	60	90	70	60	120	40	2	200	50.0	11	5	\N
346	353	shuppet	0	8	\N	81	58	28	44	75	35	63	33	45	2	225	50.0	11	0	\N
347	354	banette	0	8	\N	81	58	28	64	115	65	83	63	65	2	45	50.0	11	0	\N
348	355	duskull	0	8	\N	89	\N	58	20	40	90	30	90	25	2	190	50.0	11	0	\N
349	356	dusclops	0	8	\N	124	\N	58	40	70	130	60	130	25	2	90	50.0	11	0	\N
350	357	tropius	0	9	7	19	163	\N	99	68	83	72	87	51	2	200	50.0	11	10	7
351	358	chimecho	0	14	\N	89	\N	\N	75	50	80	95	90	65	2	45	50.0	11	0	\N
352	359	absol	0	1	\N	124	\N	86	65	130	60	75	60	75	2	30	50.0	11	5	\N
353	360	wynaut	0	14	\N	152	\N	186	95	23	48	23	48	23	2	125	50.0	11	11	\N
354	361	snorunt	0	11	\N	80	74	\N	50	50	50	50	50	50	2	190	50.0	11	4	9
355	362	glalie	0	11	\N	80	74	\N	80	80	80	80	80	80	2	75	50.0	11	4	9
356	363	spheal	0	11	17	188	74	111	70	40	50	55	50	25	2	255	50.0	11	12	5
357	364	sealeo	0	11	17	188	74	111	90	60	70	75	70	45	2	120	50.0	11	12	5
358	365	walrein	0	11	17	188	74	111	110	80	90	95	90	65	2	45	50.0	11	12	5
359	366	clamperl	0	17	\N	155	\N	131	35	64	85	74	55	32	2	255	50.0	11	12	\N
360	367	huntail	0	17	\N	182	\N	205	55	104	105	94	75	52	2	60	50.0	11	12	\N
361	368	gorebyss	0	17	\N	182	\N	72	55	84	105	114	75	52	2	60	50.0	11	12	\N
362	369	relicanth	0	17	15	182	139	177	100	90	130	45	65	55	2	25	87.5	11	12	13
363	370	luvdisc	0	17	\N	182	\N	72	43	30	55	40	65	97	2	225	25.0	11	13	\N
364	371	bagon	0	2	\N	139	\N	154	45	75	60	40	30	50	2	45	50.0	11	3	\N
365	372	shelgon	0	2	\N	139	\N	112	65	95	100	60	50	50	2	45	50.0	11	3	\N
366	373	salamence	0	2	7	82	\N	\N	95	135	80	110	80	100	2	45	50.0	11	3	\N
367	374	beldum	0	16	14	20	\N	90	40	55	80	35	60	30	2	3	100.0	11	9	\N
368	375	metang	0	16	14	20	\N	90	60	75	100	55	80	50	2	3	100.0	11	9	\N
369	376	metagross	0	16	14	20	\N	90	80	135	130	95	90	70	2	3	100.0	11	9	\N
370	377	regirock	3	15	\N	20	\N	177	80	100	200	50	100	50	2	3	0.0	11	11	\N
371	378	regice	3	11	\N	20	\N	74	80	50	100	100	200	50	2	3	0.0	11	11	\N
372	379	registeel	3	16	\N	20	\N	90	80	75	150	75	150	50	2	3	0.0	11	11	\N
373	380	latias	3	2	14	89	\N	\N	80	80	90	110	130	110	2	3	0.0	11	11	\N
374	381	latios	3	2	14	89	\N	\N	80	90	80	130	110	110	2	3	100.0	11	11	\N
375	382	kyogre	1	17	\N	42	\N	\N	100	100	90	150	140	90	2	3	0.0	11	11	\N
376	383	groudon	1	10	\N	43	\N	\N	100	150	140	100	90	90	2	3	0.0	11	11	\N
377	384	rayquaza	1	2	7	3	\N	\N	105	150	90	150	90	95	2	45	0.0	11	11	\N
378	385	jirachi	2	16	14	150	\N	\N	100	100	100	100	100	100	2	3	0.0	11	11	\N
379	386	deoxys	2	14	\N	124	\N	\N	50	150	50	150	50	150	2	3	0.0	11	11	\N
380	387	turtwig	0	9	\N	113	\N	155	55	68	64	45	55	31	6	45	87.5	2	10	7
381	388	grotle	0	9	\N	113	\N	155	75	89	85	55	65	36	6	45	87.5	2	10	7
382	389	torterra	0	9	10	113	\N	155	95	109	105	75	85	56	6	45	87.5	2	10	7
383	393	piplup	0	17	\N	189	\N	36	53	51	53	61	56	40	6	45	87.5	2	12	5
384	394	prinplup	0	17	\N	189	\N	36	64	66	68	81	76	50	6	45	87.5	2	12	5
385	395	empoleon	0	17	16	189	\N	36	84	86	88	111	101	60	6	45	87.5	2	12	5
386	396	starly	0	12	7	87	\N	133	40	55	30	30	30	60	6	255	50.0	2	6	\N
387	397	staravia	0	12	7	82	\N	133	55	75	50	40	40	80	6	120	50.0	2	6	\N
388	398	staraptor	0	12	7	82	\N	133	85	120	70	50	60	100	6	45	50.0	2	6	\N
389	399	bidoof	0	12	\N	158	195	\N	59	45	40	35	40	31	6	255	50.0	2	12	5
390	400	bibarel	0	12	17	158	195	\N	79	85	60	55	60	71	6	127	50.0	2	12	5
391	401	kricketot	0	0	\N	153	\N	141	37	25	41	25	41	25	6	255	50.0	2	1	\N
392	402	kricketune	0	0	\N	180	\N	185	77	85	51	55	51	65	6	45	50.0	2	1	\N
393	406	budew	0	9	13	108	119	88	40	30	35	50	70	55	6	255	50.0	2	11	\N
394	407	roserade	0	9	13	108	119	185	60	70	65	125	105	90	6	75	50.0	2	4	7
395	408	cranidos	0	15	\N	104	\N	154	67	125	40	30	30	58	6	45	87.5	2	10	\N
396	409	rampardos	0	15	\N	104	\N	154	97	165	60	65	50	58	6	45	87.5	2	10	\N
397	410	shieldon	0	15	16	177	\N	166	30	42	118	42	88	30	6	45	87.5	2	10	\N
398	411	bastiodon	0	15	16	177	\N	166	60	52	168	47	138	30	6	45	87.5	2	10	\N
399	412	burmy	0	0	\N	153	\N	112	40	29	45	29	45	36	6	120	50.0	2	1	\N
400	413	wormadam	0	0	9	4	\N	112	60	59	85	79	105	36	6	45	0.0	2	1	\N
401	414	mothim	0	0	7	180	\N	\N	70	94	50	94	50	66	6	45	100.0	2	1	\N
402	415	combee	0	0	7	68	\N	71	30	30	42	30	42	70	6	120	87.5	2	1	\N
403	416	vespiquen	0	0	7	124	\N	196	70	80	102	80	102	40	6	45	0.0	2	1	\N
404	417	pachirisu	0	3	\N	141	116	200	60	45	70	45	90	95	6	200	50.0	2	5	4
405	418	buizel	0	17	\N	182	\N	205	55	65	35	60	30	85	6	190	50.0	2	12	5
406	419	floatzel	0	17	\N	182	\N	205	85	105	55	85	50	115	6	75	50.0	2	12	5
407	420	cherubi	0	9	\N	19	\N	\N	45	35	45	62	53	35	6	190	50.0	2	4	7
408	421	cherrim	0	9	\N	53	\N	\N	70	60	70	87	78	85	6	75	50.0	2	4	7
409	422	shellos	0	17	\N	175	\N	142	76	48	48	57	62	34	6	190	50.0	2	12	0
410	423	gastrodon	0	17	10	175	\N	142	111	83	68	92	82	39	6	75	50.0	2	12	0
411	424	ambipom	0	12	\N	185	116	159	75	100	66	60	66	115	6	45	50.0	2	5	\N
412	425	drifloon	0	8	7	2	\N	\N	90	50	34	60	44	70	6	125	50.0	2	0	\N
413	426	drifblim	0	8	7	2	\N	\N	150	80	44	90	54	80	6	60	50.0	2	0	\N
414	427	buneary	0	12	\N	141	\N	92	55	66	44	44	56	85	6	190	50.0	2	5	8
415	428	lopunny	0	12	\N	29	\N	92	65	76	84	54	96	105	6	60	50.0	2	5	8
416	429	mismagius	0	8	\N	89	\N	\N	60	60	60	105	105	105	6	45	50.0	2	0	\N
417	430	honchkrow	0	1	7	81	\N	\N	100	125	52	105	52	71	6	30	50.0	2	6	\N
418	431	glameow	0	12	\N	92	114	87	49	55	42	42	37	85	6	190	25.0	2	5	\N
419	432	purugly	0	12	\N	188	114	36	71	82	64	64	59	112	6	75	25.0	2	5	\N
420	433	chingling	0	14	\N	89	\N	\N	45	30	50	65	50	45	6	120	50.0	2	11	\N
421	434	stunky	0	13	1	174	2	87	63	63	47	41	41	74	6	225	50.0	2	5	\N
422	435	skuntank	0	13	1	174	2	87	103	93	67	71	61	84	6	60	50.0	2	5	\N
423	436	bronzor	0	16	14	89	\N	\N	57	24	86	24	86	23	6	255	0.0	2	9	\N
424	437	bronzong	0	16	14	89	\N	\N	67	89	116	79	116	33	6	90	0.0	2	9	\N
425	438	bonsly	0	15	\N	177	139	131	50	80	95	10	45	10	6	255	50.0	2	11	\N
426	439	mime_jr.	0	14	4	166	50	185	20	25	45	70	90	60	6	145	50.0	2	11	\N
427	440	happiny	0	12	\N	108	150	\N	100	5	5	15	65	30	6	130	0.0	2	11	\N
428	441	chatot	0	12	7	87	184	14	76	65	45	92	42	91	6	30	50.0	2	6	\N
429	442	spiritomb	0	8	1	124	\N	\N	50	92	108	92	108	35	6	100	50.0	2	0	\N
430	443	gible	0	2	10	146	\N	140	58	70	45	40	45	42	6	45	50.0	2	10	3
431	444	gabite	0	2	10	146	\N	140	68	90	65	50	55	82	6	45	50.0	2	10	3
432	445	garchomp	0	2	10	146	\N	140	108	130	95	80	85	102	6	45	50.0	2	10	3
433	446	munchlax	0	12	\N	116	188	61	135	85	40	40	85	5	6	50	87.5	2	11	\N
434	447	riolu	0	5	\N	171	80	123	40	70	40	35	40	60	6	75	87.5	2	11	\N
435	448	lucario	0	5	16	171	80	86	70	110	70	115	70	90	6	45	87.5	2	5	8
436	449	hippopotas	0	10	\N	145	\N	142	68	72	78	38	42	32	6	140	50.0	2	5	\N
437	450	hippowdon	0	10	\N	145	\N	142	108	112	118	68	72	47	6	60	50.0	2	5	\N
438	451	skorupi	0	13	0	10	\N	87	40	50	90	30	55	65	6	120	50.0	2	1	14
439	452	drapion	0	13	1	10	\N	87	70	90	110	60	75	95	6	45	50.0	2	1	14
440	453	croagunk	0	13	5	4	44	120	48	61	40	61	40	50	6	140	50.0	2	8	\N
441	454	toxicroak	0	13	5	4	44	120	83	106	65	86	65	85	6	75	50.0	2	8	\N
442	455	carnivine	0	9	\N	89	\N	\N	74	100	72	90	72	46	6	200	50.0	2	7	\N
443	456	finneon	0	17	\N	182	\N	205	49	49	56	49	61	66	6	190	50.0	2	13	\N
444	457	lumineon	0	17	\N	182	\N	205	69	69	76	69	86	91	6	75	50.0	2	13	\N
445	458	mantyke	0	17	7	182	202	205	45	20	50	60	120	50	6	25	50.0	2	11	\N
446	459	snover	0	9	11	162	\N	166	60	62	50	62	60	40	6	120	50.0	2	10	7
447	460	abomasnow	0	9	11	162	\N	166	90	92	75	92	85	60	6	60	50.0	2	10	7
448	461	weavile	0	1	11	124	\N	\N	70	120	65	45	85	125	6	45	50.0	2	5	\N
449	462	magnezone	0	3	16	97	177	\N	70	70	115	130	90	60	6	30	0.0	2	9	\N
450	463	lickilicky	0	12	\N	114	111	\N	110	85	95	80	95	50	6	30	50.0	2	10	\N
451	464	rhyperior	0	10	15	91	164	133	115	140	130	55	55	40	6	30	50.0	2	10	5
452	465	tangrowth	0	9	\N	19	88	135	100	100	125	110	50	50	6	30	50.0	2	7	\N
453	466	electivire	0	3	\N	105	\N	199	75	123	67	95	85	95	6	30	75.0	2	8	\N
454	467	magmortar	0	6	\N	51	\N	199	75	95	67	125	95	83	6	30	75.0	2	8	\N
455	468	togekiss	0	4	7	71	150	\N	85	50	95	120	115	80	6	30	87.5	2	6	4
456	469	yanmega	0	0	7	167	\N	58	86	76	86	116	56	95	6	30	50.0	2	1	\N
457	470	leafeon	0	9	\N	88	\N	19	65	110	130	60	65	95	6	45	87.5	2	5	\N
458	471	glaceon	0	11	\N	161	\N	74	65	60	110	130	95	65	6	45	87.5	2	5	\N
459	472	gliscor	0	10	7	73	146	\N	75	95	125	45	75	95	6	30	50.0	2	1	\N
460	473	mamoswine	0	11	10	111	161	188	110	130	80	70	60	80	6	50	50.0	2	5	\N
461	474	porygon-z	0	12	\N	0	40	\N	85	80	70	135	75	90	6	30	0.0	2	9	\N
462	475	gallade	0	14	5	171	\N	86	68	125	65	65	115	80	6	45	100.0	2	8	0
463	476	probopass	0	15	16	177	97	142	60	55	145	75	150	40	6	60	50.0	2	9	\N
464	477	dusknoir	0	8	\N	124	\N	58	45	100	135	65	135	45	6	45	50.0	2	0	\N
465	478	froslass	0	11	8	161	\N	28	70	80	70	80	70	110	6	75	0.0	2	4	9
466	479	rotom	0	3	8	89	\N	\N	50	50	77	95	77	91	6	45	0.0	2	0	\N
467	480	uxie	3	14	\N	89	\N	\N	75	75	130	75	130	95	6	3	0.0	2	11	\N
468	481	mesprit	3	14	\N	89	\N	\N	80	105	105	105	105	80	6	3	0.0	2	11	\N
469	482	azelf	3	14	\N	89	\N	\N	75	125	70	125	70	115	6	3	0.0	2	11	\N
470	483	dialga	1	16	2	124	\N	186	100	120	120	150	100	90	6	3	0.0	2	11	\N
471	484	palkia	1	17	2	124	\N	186	90	120	100	150	120	100	6	3	0.0	2	11	\N
472	485	heatran	3	6	16	52	\N	51	91	90	106	130	106	77	6	3	50.0	2	11	\N
473	486	regigigas	3	12	\N	160	\N	\N	110	160	110	80	110	100	6	3	0.0	2	11	\N
474	487	giratina	1	8	2	124	\N	186	150	100	120	100	120	90	6	3	0.0	2	11	\N
475	488	cresselia	3	14	\N	89	\N	\N	120	70	120	75	130	85	6	3	0.0	2	11	\N
476	491	darkrai	2	1	\N	7	\N	\N	70	90	90	135	90	125	6	3	0.0	2	11	\N
477	492	shaymin	2	9	\N	108	\N	\N	100	100	100	100	100	100	6	45	0.0	2	11	\N
478	493	arceus	2	12	\N	106	\N	\N	120	120	120	120	120	120	6	3	0.0	2	11	\N
479	494	victini	2	14	6	198	\N	\N	100	100	100	100	100	100	7	3	0.0	0	11	\N
480	765	oranguru	0	12	14	80	186	\N	90	60	80	90	110	60	0	45	50.0	12	5	\N
481	495	snivy	0	9	\N	113	\N	\N	45	45	55	45	55	63	7	45	87.5	0	5	7
482	496	servine	0	9	\N	113	\N	\N	60	60	75	60	75	83	7	45	87.5	0	5	7
483	497	serperior	0	9	\N	113	\N	\N	75	75	95	75	95	113	7	45	87.5	0	5	7
484	498	tepig	0	6	\N	15	\N	188	65	63	45	45	45	45	7	45	87.5	0	5	\N
485	499	pignite	0	6	5	15	\N	188	90	93	55	70	55	55	7	45	87.5	0	5	\N
486	500	emboar	0	6	5	15	\N	133	110	123	65	100	65	65	7	45	87.5	0	5	\N
487	501	oshawott	0	17	\N	189	\N	155	55	55	45	63	45	45	7	45	87.5	0	5	\N
488	502	dewott	0	17	\N	189	\N	155	75	75	60	83	60	60	7	45	87.5	0	5	\N
489	503	samurott	0	17	\N	189	\N	155	95	100	85	108	70	70	7	45	87.5	0	5	\N
490	504	patrat	0	12	\N	141	87	\N	45	55	39	35	39	42	7	255	50.0	0	5	\N
491	505	watchog	0	12	\N	76	87	\N	60	85	69	60	69	77	7	255	50.0	0	5	\N
492	506	lillipup	0	12	\N	199	116	141	45	60	45	25	45	55	7	255	50.0	0	5	\N
493	507	herdier	0	12	\N	82	143	149	65	80	65	35	65	60	7	120	50.0	0	5	\N
494	508	stoutland	0	12	\N	82	143	149	85	110	90	45	90	80	7	45	50.0	0	5	\N
495	509	purrloin	0	1	\N	92	\N	123	41	50	37	50	37	66	7	255	50.0	0	5	\N
496	510	liepard	0	1	\N	92	\N	123	64	88	50	88	50	106	7	90	50.0	0	5	\N
497	511	pansage	0	9	\N	61	\N	113	50	53	48	53	48	64	7	190	87.5	0	5	\N
498	512	simisage	0	9	\N	61	\N	113	75	98	63	98	63	101	7	75	87.5	0	5	\N
499	513	pansear	0	6	\N	61	\N	15	50	53	48	53	48	64	7	190	87.5	0	5	\N
500	514	simisear	0	6	\N	61	\N	15	75	98	63	98	63	101	7	75	87.5	0	5	\N
501	515	panpour	0	17	\N	61	\N	189	50	53	48	53	48	64	7	190	87.5	0	5	\N
502	516	simipour	0	17	\N	61	\N	189	75	98	63	98	63	101	7	75	87.5	0	5	\N
503	517	munna	0	14	\N	57	183	186	76	25	45	67	55	24	7	190	50.0	0	5	\N
504	518	musharna	0	14	\N	57	183	186	116	55	85	107	95	29	7	75	50.0	0	5	\N
505	519	pidove	0	12	7	14	\N	137	50	55	50	36	30	43	7	255	50.0	0	6	\N
506	520	tranquill	0	12	7	14	\N	137	62	77	62	50	42	65	7	120	50.0	0	6	\N
507	521	unfezant	0	12	7	14	\N	137	80	115	80	65	55	93	7	45	50.0	0	6	\N
508	522	blitzle	0	3	\N	91	105	147	45	60	32	50	32	76	7	190	50.0	0	5	\N
509	523	zebstrika	0	3	\N	91	105	147	75	100	63	80	63	116	7	75	50.0	0	5	\N
510	524	roggenrola	0	15	\N	177	206	142	55	75	85	25	25	15	7	255	50.0	0	9	\N
511	525	boldore	0	15	\N	177	206	142	70	105	105	50	40	20	7	120	50.0	0	9	\N
512	526	gigalith	0	15	\N	177	145	142	85	135	130	60	80	25	7	45	50.0	0	9	\N
513	527	woobat	0	14	7	195	\N	158	65	45	43	55	43	72	7	190	50.0	0	5	6
514	528	swoobat	0	14	7	195	\N	158	67	57	55	77	55	114	7	45	50.0	0	5	6
515	529	drilbur	0	10	\N	143	142	104	60	85	40	30	45	68	7	120	50.0	0	5	\N
516	530	excadrill	0	10	16	143	142	104	110	135	60	50	65	88	7	60	50.0	0	5	\N
517	531	audino	0	12	\N	67	135	\N	103	60	86	60	86	50	7	255	50.0	0	4	\N
518	532	timburr	0	5	\N	66	154	85	75	80	55	25	35	35	7	180	75.0	0	8	\N
519	533	gurdurr	0	5	\N	66	154	85	85	105	85	40	50	40	7	90	75.0	0	8	\N
520	534	conkeldurr	0	5	\N	66	154	85	105	140	95	55	65	45	7	45	75.0	0	8	\N
521	535	tympole	0	17	\N	182	72	202	50	50	40	50	40	64	7	255	50.0	0	12	\N
522	536	palpitoad	0	17	10	182	72	202	75	65	55	65	55	69	7	120	50.0	0	12	\N
523	537	seismitoad	0	17	10	182	120	202	105	95	75	85	75	74	7	45	50.0	0	12	\N
524	538	throh	0	5	\N	66	80	104	120	100	85	30	85	45	7	45	100.0	0	8	\N
525	539	sawk	0	5	\N	177	80	104	75	125	75	30	75	85	7	45	100.0	0	8	\N
526	540	sewaddle	0	0	9	180	19	112	45	53	70	40	60	42	7	255	50.0	0	1	\N
527	541	swadloon	0	0	9	88	19	112	55	63	90	50	80	42	7	120	50.0	0	1	\N
528	542	leavanny	0	0	9	180	19	112	75	103	80	70	80	92	7	45	50.0	0	1	\N
529	543	venipede	0	0	13	119	180	167	30	45	59	30	39	57	7	255	50.0	0	1	\N
530	544	whirlipede	0	0	13	119	180	167	40	55	99	40	79	47	7	120	50.0	0	1	\N
531	545	scolipede	0	0	13	119	180	167	60	100	89	55	69	112	7	45	50.0	0	1	\N
532	546	cottonee	0	9	4	123	\N	19	40	27	60	37	50	66	7	190	50.0	0	7	4
533	547	whimsicott	0	9	4	123	\N	19	60	67	85	77	75	116	7	75	50.0	0	7	4
534	548	petilil	0	9	\N	19	114	88	45	35	50	70	50	30	7	190	0.0	0	7	\N
535	549	lilligant	0	9	\N	19	114	88	70	60	75	110	75	90	7	75	0.0	0	7	\N
536	55	golduck	0	17	\N	30	\N	182	80	82	78	80	0	85	5	75	50.0	10	12	5
537	550	basculin	0	17	\N	133	0	104	70	92	65	80	55	98	7	25	50.0	0	13	\N
538	551	sandile	0	10	1	82	\N	\N	50	72	35	35	35	65	7	180	50.0	0	5	\N
539	552	krokorok	0	10	1	82	\N	\N	60	82	45	45	45	74	7	90	50.0	0	5	\N
540	553	krookodile	0	10	1	82	\N	\N	95	117	80	65	70	92	7	45	50.0	0	5	\N
541	554	darumaka	0	6	\N	71	\N	80	70	90	45	15	45	50	7	120	50.0	0	5	\N
542	555	darmanitan	0	6	\N	154	\N	211	105	140	55	30	55	95	7	60	50.0	0	5	\N
543	556	maractus	0	9	\N	202	19	\N	75	86	67	106	67	60	7	255	50.0	0	7	\N
544	557	dwebble	0	0	15	177	155	206	50	65	85	35	35	55	7	190	50.0	0	1	9
545	558	crustle	0	0	15	177	155	206	70	105	125	65	75	45	7	75	50.0	0	1	9
546	559	scraggy	0	1	5	153	\N	82	50	75	70	35	70	48	7	180	50.0	0	5	3
547	56	mankey	0	5	\N	199	\N	36	40	80	35	35	0	70	5	190	50.0	10	5	\N
548	560	scrafty	0	1	5	153	\N	82	65	90	115	45	115	58	7	90	50.0	0	5	3
549	561	sigilyph	0	14	7	210	\N	\N	72	58	80	103	80	97	7	45	50.0	0	6	\N
550	562	yamask	0	8	\N	107	\N	\N	38	30	85	55	65	30	7	190	50.0	0	9	0
551	563	cofagrigus	0	8	\N	107	\N	\N	58	50	145	95	105	30	7	90	50.0	0	9	0
552	564	tirtouga	0	17	15	164	177	182	54	78	103	53	45	22	7	45	87.5	0	12	14
553	565	carracosta	0	17	15	164	177	182	74	108	133	83	65	32	7	45	87.5	0	12	14
554	566	archen	0	15	7	35	\N	\N	55	112	45	74	45	70	7	45	87.5	0	6	14
555	567	archeops	0	15	7	35	\N	\N	75	140	65	112	65	110	7	45	87.5	0	6	14
556	568	trubbish	0	13	\N	174	175	2	50	50	62	40	62	65	7	190	50.0	0	9	\N
557	569	garbodor	0	13	\N	174	206	2	80	95	82	60	82	75	7	60	50.0	0	9	\N
558	57	primeape	0	5	\N	199	\N	36	65	105	60	60	0	95	5	75	50.0	10	5	\N
559	570	zorua	0	1	\N	77	\N	\N	40	65	40	80	40	65	7	75	87.5	0	5	\N
560	571	zoroark	0	1	\N	77	\N	\N	60	105	60	120	60	105	7	45	87.5	0	5	\N
561	572	minccino	0	12	\N	29	185	159	55	50	40	40	40	75	7	255	25.0	0	5	\N
562	573	cinccino	0	12	\N	29	185	159	75	95	60	65	60	115	7	60	25.0	0	5	\N
563	574	gothita	0	14	\N	58	23	152	45	30	50	55	65	45	7	200	25.0	0	8	\N
564	575	gothorita	0	14	\N	58	23	152	60	45	70	75	85	55	7	100	25.0	0	8	\N
565	576	gothitelle	0	14	\N	58	23	152	70	55	95	95	110	65	7	50	25.0	0	8	\N
566	577	solosis	0	14	\N	112	\N	135	45	30	40	105	50	20	7	200	50.0	0	0	\N
567	578	duosion	0	14	\N	112	\N	135	65	40	50	125	60	30	7	100	50.0	0	0	\N
568	579	reuniclus	0	14	\N	112	\N	135	110	65	75	125	85	30	7	50	50.0	0	0	\N
569	58	growlithe	0	6	\N	82	52	86	55	70	45	50	0	60	5	190	75.0	10	5	\N
570	580	ducklett	0	17	7	87	14	72	62	44	50	44	50	55	7	190	50.0	0	12	6
571	581	swanna	0	17	7	87	14	72	75	87	63	87	63	98	7	45	50.0	0	12	6
572	582	vanillite	0	11	\N	74	161	206	36	50	50	65	60	44	7	255	50.0	0	9	\N
573	583	vanillish	0	11	\N	74	161	206	51	65	65	80	75	59	7	120	50.0	0	9	\N
574	584	vanilluxe	0	11	\N	74	162	206	71	95	85	110	95	79	7	45	50.0	0	9	\N
575	585	deerling	0	12	9	19	147	150	60	60	50	40	50	75	7	190	50.0	0	5	\N
576	586	sawsbuck	0	12	9	19	147	150	80	100	70	60	70	95	7	75	50.0	0	5	\N
577	587	emolga	0	3	7	170	\N	105	55	75	60	75	60	103	7	200	50.0	0	5	\N
578	588	karrablast	0	0	\N	180	153	110	50	75	45	40	45	60	7	200	50.0	0	1	\N
579	589	escavalier	0	0	16	180	155	112	70	135	105	60	105	20	7	75	50.0	0	1	\N
580	59	arcanine	0	6	\N	82	52	86	90	110	80	80	0	95	5	75	75.0	10	5	\N
581	590	foongus	0	9	13	46	\N	135	69	55	45	55	55	15	7	190	50.0	0	7	\N
582	591	amoonguss	0	9	13	46	\N	135	114	85	70	85	80	30	7	75	50.0	0	7	\N
583	592	frillish	0	17	8	202	28	30	55	40	50	65	85	40	7	190	50.0	0	0	\N
584	593	jellicent	0	17	8	202	28	30	100	60	70	85	105	60	7	60	50.0	0	0	\N
585	594	alomomola	0	17	\N	67	72	135	165	75	80	40	45	65	7	75	50.0	0	12	13
586	595	joltik	0	0	3	24	196	180	50	47	50	57	50	65	7	190	50.0	0	1	\N
587	596	galvantula	0	0	3	24	196	180	70	77	60	97	60	108	7	75	50.0	0	1	\N
588	597	ferroseed	0	9	16	84	\N	\N	44	50	91	24	86	10	7	255	50.0	0	7	9
589	598	ferrothorn	0	9	16	84	\N	4	74	94	131	54	116	20	7	90	50.0	0	7	9
590	599	klink	0	16	\N	118	102	20	40	55	70	45	60	30	7	130	0.0	0	9	\N
591	60	poliwag	0	17	\N	202	30	182	40	50	40	40	0	90	5	255	50.0	10	12	\N
592	600	klang	0	16	\N	118	102	20	60	80	95	70	85	50	7	60	0.0	0	9	\N
593	601	klinklang	0	16	\N	118	102	20	60	100	115	70	85	90	7	30	0.0	0	9	\N
594	602	tynamo	0	3	\N	89	\N	\N	35	55	40	45	40	60	7	190	50.0	0	0	\N
595	603	eelektrik	0	3	\N	89	\N	\N	65	85	70	75	70	40	7	60	50.0	0	0	\N
596	604	eelektross	0	3	\N	89	\N	\N	85	115	80	105	80	50	7	30	50.0	0	0	\N
597	605	elgyem	0	14	\N	186	183	\N	55	55	55	85	55	30	7	255	50.0	0	8	\N
598	606	beheeyem	0	14	\N	186	183	\N	75	75	75	125	95	40	7	90	50.0	0	8	\N
599	607	litwick	0	8	6	52	51	\N	50	30	55	65	55	20	7	190	50.0	0	0	\N
600	608	lampent	0	8	6	52	51	\N	60	40	60	95	60	55	7	90	50.0	0	0	\N
601	609	chandelure	0	8	6	52	51	\N	60	55	90	145	90	80	7	45	50.0	0	0	\N
602	61	poliwhirl	0	17	\N	202	30	182	65	65	65	50	0	90	5	120	50.0	10	12	\N
603	610	axew	0	2	\N	137	104	196	46	87	60	30	40	57	7	75	50.0	0	10	3
604	611	fraxure	0	2	\N	137	104	196	66	117	70	40	50	67	7	60	50.0	0	10	3
605	612	haxorus	0	2	\N	137	104	196	76	147	90	60	70	97	7	45	50.0	0	10	3
606	613	cubchoo	0	11	\N	161	\N	131	55	70	40	60	40	40	7	120	50.0	0	5	\N
607	614	beartic	0	11	\N	161	\N	182	95	130	80	70	80	50	7	60	50.0	0	5	\N
608	615	cryogonal	0	11	\N	89	\N	\N	80	50	50	95	135	105	7	25	0.0	0	9	\N
609	616	shelmet	0	0	\N	72	155	112	50	40	85	40	65	25	7	200	50.0	0	1	\N
610	617	accelgor	0	0	\N	72	175	\N	80	70	40	100	60	145	7	75	50.0	0	1	\N
611	618	stunfisk	0	10	3	170	92	146	109	66	84	81	99	32	7	75	50.0	0	12	0
612	619	mienfoo	0	5	\N	80	135	133	45	85	50	55	50	65	7	180	50.0	0	5	8
613	62	poliwrath	0	17	5	202	30	182	90	95	95	70	90	70	5	45	50.0	10	12	\N
614	620	mienshao	0	5	\N	80	135	133	65	125	60	95	60	105	7	45	50.0	0	5	8
615	621	druddigon	0	2	\N	140	154	104	77	120	90	60	90	48	7	45	50.0	0	3	10
616	622	golett	0	10	8	85	\N	110	59	74	50	35	50	35	7	190	0.0	0	9	\N
617	623	golurk	0	10	8	85	\N	110	89	124	80	55	80	55	7	90	0.0	0	9	\N
618	624	pawniard	0	1	16	36	80	124	45	85	70	40	40	60	7	120	50.0	0	8	\N
619	625	bisharp	0	1	16	36	80	124	65	125	100	60	70	70	7	45	50.0	0	8	\N
620	626	bouffalant	0	12	\N	133	147	166	95	110	95	40	95	55	7	45	50.0	0	5	\N
621	627	rufflet	0	12	7	87	154	71	70	83	50	37	50	60	7	190	100.0	0	6	\N
622	628	braviary	0	12	7	87	154	36	100	123	75	57	75	80	7	60	100.0	0	6	\N
623	629	vullaby	0	1	7	14	112	206	70	55	75	45	65	60	7	190	0.0	0	6	\N
624	63	abra	0	14	\N	183	80	\N	25	20	15	105	0	90	5	200	75.0	10	8	\N
625	630	mandibuzz	0	1	7	14	112	206	110	65	105	55	95	80	7	60	0.0	0	6	\N
626	631	heatmor	0	6	\N	61	52	207	85	97	66	105	66	65	7	90	50.0	0	5	\N
627	632	durant	0	0	16	180	71	193	58	109	112	48	48	109	7	90	50.0	0	1	\N
628	633	deino	0	1	2	71	\N	\N	52	65	50	45	50	38	7	45	50.0	0	3	\N
629	634	zweilous	0	1	2	71	\N	\N	72	85	70	65	70	58	7	45	50.0	0	3	\N
630	635	hydreigon	0	1	2	89	\N	\N	92	105	90	125	90	98	7	45	50.0	0	3	\N
631	636	larvesta	0	0	6	51	\N	180	55	85	55	50	55	60	7	45	50.0	0	1	\N
632	637	volcarona	0	0	6	51	\N	180	85	60	65	135	105	100	7	15	50.0	0	1	\N
633	638	cobalion	3	16	5	86	\N	\N	91	90	129	90	72	108	7	3	0.0	0	11	\N
634	639	terrakion	3	15	5	86	\N	\N	91	129	90	72	90	108	7	3	0.0	0	11	\N
635	64	kadabra	0	14	\N	183	80	\N	40	35	30	120	0	105	5	100	75.0	10	8	\N
636	640	virizion	3	9	5	86	\N	\N	91	90	72	90	129	108	7	3	0.0	0	11	\N
637	641	tornadus	3	7	\N	123	\N	36	79	115	70	125	80	111	7	3	100.0	0	11	\N
638	642	thundurus	3	3	7	123	\N	36	79	115	70	125	80	111	7	3	100.0	0	11	\N
639	643	reshiram	1	2	6	194	\N	\N	100	120	100	150	120	90	7	3	0.0	0	11	\N
640	644	zekrom	1	2	3	187	\N	\N	100	150	120	120	100	90	7	3	0.0	0	11	\N
641	645	landorus	3	10	7	142	\N	154	89	125	90	115	80	101	7	3	100.0	0	11	\N
642	646	kyurem	1	2	11	124	\N	\N	125	130	90	130	90	95	7	3	0.0	0	11	\N
643	647	keldeo	2	17	5	86	\N	\N	91	72	90	129	90	108	7	3	0.0	0	11	\N
644	648	meloetta	2	12	14	150	\N	\N	100	77	77	128	128	90	7	3	0.0	0	11	\N
645	649	genesect	2	0	16	40	\N	\N	71	120	95	120	95	99	7	3	0.0	0	11	\N
646	65	alakazam	0	14	\N	183	80	\N	55	50	45	135	95	120	5	50	75.0	10	8	\N
647	650	chespin	0	9	\N	113	\N	16	56	61	65	48	45	38	4	45	87.5	15	5	\N
648	651	quilladin	0	9	\N	113	\N	16	61	78	95	56	58	57	4	45	87.5	15	5	\N
649	652	chesnaught	0	9	5	113	\N	16	88	107	122	74	75	64	4	45	87.5	15	5	\N
650	653	fennekin	0	6	\N	15	\N	95	40	45	40	62	60	60	4	45	87.5	15	5	\N
651	654	braixen	0	6	\N	15	\N	95	59	59	58	90	70	73	4	45	87.5	15	5	\N
652	655	delphox	0	6	14	15	\N	95	75	69	72	114	100	104	4	45	87.5	15	5	\N
653	656	froakie	0	17	\N	189	\N	\N	41	56	40	62	44	71	4	45	87.5	15	12	\N
654	657	frogadier	0	17	\N	189	\N	\N	54	63	52	83	56	97	4	45	87.5	15	12	\N
655	658	greninja	0	17	1	189	\N	\N	72	95	67	103	71	122	4	45	87.5	15	12	\N
656	659	bunnelby	0	12	\N	116	17	69	38	36	38	32	36	57	4	255	50.0	15	5	\N
657	66	machop	0	5	\N	66	110	171	70	80	50	35	0	35	5	180	75.0	10	8	\N
658	660	diggersby	0	12	10	116	17	69	85	56	77	50	77	78	4	127	50.0	15	5	\N
659	661	fletchling	0	12	7	14	\N	\N	45	50	43	40	38	62	4	255	50.0	15	6	\N
660	662	fletchinder	0	6	7	51	\N	\N	62	73	55	56	52	84	4	120	50.0	15	6	\N
661	663	talonflame	0	6	7	51	\N	\N	78	81	71	74	69	126	4	45	50.0	15	6	\N
662	664	scatterbug	0	0	\N	156	24	\N	38	35	40	27	25	35	4	255	50.0	15	1	\N
663	665	spewpa	0	0	\N	153	\N	\N	45	22	60	27	30	29	4	120	50.0	15	1	\N
664	666	vivillon	0	0	7	156	24	\N	80	52	50	90	50	89	4	45	50.0	15	1	\N
665	667	litleo	0	6	12	137	196	\N	62	50	58	73	54	72	4	220	12.5	15	5	\N
666	668	pyroar	0	6	12	137	196	\N	86	68	72	109	66	106	4	65	12.5	15	5	\N
667	669	flabébé	0	4	\N	54	\N	\N	44	38	39	61	79	42	4	225	0.0	15	4	\N
668	67	machoke	0	5	\N	66	110	171	80	100	70	50	0	45	5	90	75.0	10	8	\N
669	670	floette	0	4	\N	54	\N	\N	54	45	47	75	98	52	4	120	0.0	15	4	\N
670	671	florges	0	4	\N	54	\N	\N	78	65	68	112	154	75	4	45	0.0	15	4	\N
671	672	skiddo	0	9	\N	147	\N	\N	66	65	48	62	57	52	4	200	50.0	15	5	\N
672	673	gogoat	0	9	\N	147	\N	\N	123	100	62	97	81	68	4	45	50.0	15	5	\N
673	674	pancham	0	5	\N	85	104	149	67	82	62	46	48	43	4	220	50.0	15	5	8
674	675	pangoro	0	5	1	85	104	149	95	124	78	69	71	58	4	65	50.0	15	5	8
675	676	furfrou	0	12	\N	60	\N	\N	75	80	60	65	90	102	4	160	50.0	15	5	\N
676	677	espurr	0	14	\N	87	\N	114	62	48	54	63	60	68	4	190	50.0	15	5	\N
677	678	meowstic	0	14	\N	87	\N	123	74	48	76	83	81	104	4	75	100.0	15	5	\N
678	68	machamp	0	5	\N	66	110	171	90	130	80	65	0	55	5	45	75.0	10	8	\N
679	681	aegislash	0	16	8	169	\N	\N	60	50	140	50	140	60	4	45	50.0	15	9	\N
680	682	spritzee	0	4	\N	67	\N	\N	78	52	60	63	65	23	4	200	50.0	15	4	\N
681	683	aromatisse	0	4	\N	67	\N	\N	101	72	72	99	89	29	4	140	50.0	15	4	\N
682	684	swirlix	0	4	\N	181	\N	\N	62	48	66	59	57	49	4	200	50.0	15	4	\N
683	685	slurpuff	0	4	\N	181	\N	\N	82	80	86	85	75	72	4	140	50.0	15	4	\N
684	686	inkay	0	1	14	178	\N	\N	53	54	53	37	46	45	4	190	50.0	15	12	13
685	687	malamar	0	1	14	178	\N	\N	86	92	88	68	75	73	4	80	50.0	15	12	13
686	688	binacle	0	15	17	190	\N	\N	42	52	67	39	56	50	4	120	50.0	15	14	\N
687	689	barbaracle	0	15	17	190	\N	\N	72	105	115	54	86	68	4	45	50.0	15	14	\N
688	69	bellsprout	0	9	13	19	\N	61	50	75	35	70	0	40	5	255	50.0	10	7	\N
689	690	skrelp	0	13	17	119	120	0	50	60	60	60	60	30	4	225	50.0	15	12	3
690	691	dragalge	0	13	2	119	120	0	65	75	90	97	123	44	4	55	50.0	15	12	3
691	692	clauncher	0	17	\N	99	\N	\N	50	53	62	58	63	44	4	225	50.0	15	12	14
692	693	clawitzer	0	17	\N	99	\N	\N	71	73	88	120	89	59	4	55	50.0	15	12	14
693	694	helioptile	0	3	12	44	146	163	44	38	33	61	43	70	4	190	50.0	15	10	3
694	695	heliolisk	0	3	12	44	146	163	62	55	52	109	94	109	4	75	50.0	15	10	3
695	696	tyrunt	0	15	2	176	\N	177	58	89	77	45	45	48	4	45	87.5	15	10	3
696	697	tyrantrum	0	15	2	176	\N	139	82	121	119	69	59	71	4	45	87.5	15	10	3
697	698	amaura	0	15	11	134	\N	162	77	59	50	67	63	46	4	45	87.5	15	10	\N
698	699	aurorus	0	15	11	134	\N	162	123	77	72	99	92	58	4	45	87.5	15	10	\N
699	70	weepinbell	0	9	13	19	\N	61	65	90	50	85	0	55	5	120	50.0	10	7	\N
700	700	sylveon	0	4	\N	29	\N	117	95	65	65	110	130	60	4	45	87.5	15	5	\N
701	701	hawlucha	0	5	7	92	\N	104	78	92	75	74	63	118	4	100	50.0	15	6	8
702	702	dedenne	0	3	4	17	116	118	67	58	57	81	67	101	4	180	50.0	15	5	4
703	703	carbink	0	15	4	20	\N	177	50	50	150	50	150	50	4	60	0.0	15	4	9
704	704	goomy	0	2	\N	147	72	\N	45	50	35	55	75	40	4	45	50.0	15	3	\N
705	705	sliggoo	0	2	\N	147	72	\N	68	75	53	83	113	60	4	45	50.0	15	3	\N
706	706	goodra	0	2	\N	147	72	\N	90	100	70	110	150	80	4	45	50.0	15	3	\N
707	707	klefki	0	16	4	123	\N	95	57	80	91	80	87	75	4	75	50.0	15	9	\N
708	708	phantump	0	8	9	108	58	\N	43	70	48	50	60	38	4	120	50.0	15	7	0
709	709	trevenant	0	8	9	108	58	\N	85	110	76	65	82	56	4	60	50.0	15	7	0
710	71	victreebel	0	9	13	19	\N	61	80	105	65	100	70	70	5	45	50.0	10	7	\N
711	710	pumpkaboo	0	8	9	116	58	81	49	66	70	44	55	51	4	120	50.0	15	0	\N
712	711	gourgeist	0	8	9	116	58	81	65	90	122	58	75	84	4	60	50.0	15	0	\N
713	712	bergmite	0	11	\N	114	74	177	55	69	85	32	35	28	4	190	50.0	15	10	9
714	713	avalugg	0	11	\N	114	74	177	95	117	184	44	46	28	4	55	50.0	15	10	9
715	714	noibat	0	7	2	58	\N	186	40	30	35	45	40	55	4	190	50.0	15	6	3
716	715	noivern	0	7	2	58	\N	186	85	70	80	97	80	123	4	45	50.0	15	6	3
717	716	xerneas	1	4	\N	49	\N	\N	126	131	95	131	98	99	4	45	0.0	15	11	\N
718	717	yveltal	1	1	7	32	\N	\N	126	131	95	131	98	99	4	45	0.0	15	11	\N
719	718	zygarde	1	2	10	6	121	\N	108	100	121	81	95	95	4	3	0.0	15	11	\N
720	719	diancie	2	15	4	20	\N	\N	50	100	150	100	150	50	4	3	0.0	15	11	\N
721	72	tentacool	0	17	13	20	93	\N	40	40	35	100	0	70	5	190	50.0	10	14	\N
722	720	hoopa	2	14	8	95	\N	\N	80	110	60	150	130	70	4	3	0.0	15	11	\N
723	721	volcanion	2	6	17	202	\N	\N	80	110	120	130	90	70	4	3	0.0	15	11	\N
724	722	rowlet	0	9	7	113	\N	\N	68	55	55	50	50	40	0	45	87.5	12	6	\N
725	723	dartrix	0	9	7	113	\N	\N	78	75	75	70	70	52	0	45	87.5	12	6	\N
726	724	decidueye	0	9	8	113	\N	\N	78	107	75	100	100	70	0	45	87.5	12	6	\N
727	725	litten	0	6	\N	15	\N	82	45	65	40	60	40	70	0	45	87.5	12	5	\N
728	726	torracat	0	6	\N	15	\N	82	65	85	50	80	50	90	0	45	87.5	12	5	\N
729	727	incineroar	0	6	1	15	\N	82	95	115	90	80	90	60	0	45	87.5	12	5	\N
730	728	popplio	0	17	\N	189	\N	\N	50	54	54	66	56	40	0	45	87.5	12	12	5
731	729	brionne	0	17	\N	189	\N	\N	60	69	69	91	81	50	0	45	87.5	12	12	5
732	73	tentacruel	0	17	13	20	93	\N	80	70	65	120	0	100	5	60	50.0	10	14	\N
733	730	primarina	0	17	4	189	\N	\N	80	74	74	126	116	60	0	45	87.5	12	12	5
734	731	pikipek	0	12	7	87	159	116	35	75	30	30	30	65	0	255	50.0	12	6	\N
735	732	trumbeak	0	12	7	87	159	116	55	85	50	40	50	75	0	120	50.0	12	6	\N
736	733	toucannon	0	12	7	87	159	154	80	120	75	75	75	60	0	45	50.0	12	6	\N
737	734	yungoos	0	12	\N	168	176	0	48	70	30	30	30	45	0	255	50.0	12	5	\N
738	735	gumshoos	0	12	\N	168	176	0	88	110	60	55	60	45	0	127	50.0	12	5	\N
739	736	grubbin	0	0	\N	180	\N	\N	47	62	45	55	45	46	0	255	50.0	12	1	\N
740	737	charjabug	0	0	3	9	\N	\N	57	82	95	55	75	36	0	120	50.0	12	1	\N
741	738	vikavolt	0	0	3	89	\N	\N	77	70	90	145	75	43	0	45	50.0	12	1	\N
742	739	crabrawler	0	5	\N	73	85	\N	47	82	57	42	47	63	0	225	50.0	12	14	\N
743	74	geodude	0	15	10	139	177	146	40	80	100	30	0	20	5	255	50.0	10	9	\N
744	740	crabominable	0	5	11	73	85	\N	97	132	77	62	67	43	0	60	50.0	12	14	\N
745	741	oricorio	0	6	7	31	\N	\N	75	70	70	98	70	93	0	45	25.0	12	6	\N
746	742	cutiefly	0	0	4	68	156	181	40	45	40	55	40	84	0	190	50.0	12	1	4
747	743	ribombee	0	0	4	68	156	181	60	55	60	96	70	124	0	75	50.0	12	1	4
748	744	rockruff	0	15	\N	87	199	171	45	65	40	30	40	60	0	190	50.0	12	5	\N
749	745	lycanroc	0	15	\N	87	143	171	75	115	65	55	65	112	0	90	50.0	12	5	\N
750	746	wishiwashi	0	17	\N	148	\N	\N	45	20	20	25	25	40	0	60	50.0	12	13	\N
751	747	mareanie	0	13	17	100	92	135	50	53	62	43	52	45	0	190	50.0	12	12	\N
752	748	toxapex	0	13	17	100	92	135	50	63	152	53	142	35	0	75	50.0	12	12	\N
753	749	mudbray	0	10	\N	114	\N	80	70	100	70	45	55	45	0	190	50.0	12	5	\N
754	75	graveler	0	15	10	139	177	146	55	95	115	45	0	35	5	120	50.0	10	9	\N
755	750	mudsdale	0	10	\N	114	\N	80	100	125	100	55	85	35	0	60	50.0	12	5	\N
756	751	dewpider	0	17	0	203	\N	202	38	40	52	40	72	27	0	200	50.0	12	12	1
757	752	araquanid	0	17	0	203	\N	202	68	70	92	50	132	42	0	100	50.0	12	12	1
758	753	fomantis	0	9	\N	88	\N	\N	40	55	35	50	35	35	0	190	50.0	12	7	\N
759	754	lurantis	0	9	\N	88	\N	\N	70	105	90	80	90	45	0	75	50.0	12	7	\N
760	755	morelull	0	9	4	76	46	\N	40	35	55	65	75	15	0	190	50.0	12	7	\N
761	756	shiinotic	0	9	4	76	46	\N	60	45	80	90	100	30	0	75	50.0	12	7	\N
762	757	salandit	0	13	6	25	\N	111	48	44	40	71	40	77	0	120	87.5	12	10	3
763	758	salazzle	0	13	6	25	\N	111	68	64	60	111	60	117	0	45	0.0	12	10	3
764	759	stufful	0	12	5	55	\N	29	70	75	50	45	50	50	0	140	50.0	12	5	\N
765	76	golem	0	15	10	139	177	146	80	120	130	55	65	45	5	45	50.0	10	9	\N
766	760	bewear	0	12	5	55	\N	196	120	125	80	55	60	60	0	70	50.0	12	5	\N
767	761	bounsweet	0	9	\N	88	111	181	42	30	38	30	38	32	0	235	0.0	12	7	\N
768	762	steenee	0	9	\N	88	111	181	52	40	48	40	48	62	0	120	0.0	12	7	\N
769	763	tsareena	0	9	\N	88	\N	181	72	120	98	50	98	72	0	45	0.0	12	7	\N
770	764	comfey	0	4	\N	54	\N	108	51	52	90	82	110	100	0	60	25.0	12	7	\N
771	766	passimian	0	5	\N	132	\N	36	100	120	90	40	60	80	0	45	50.0	12	5	\N
772	767	wimpod	0	0	17	208	\N	\N	25	35	40	20	30	80	0	90	50.0	12	1	14
773	768	golisopod	0	0	17	48	\N	\N	75	125	140	60	90	40	0	45	50.0	12	1	14
774	769	sandygast	0	8	10	204	\N	146	55	55	80	70	45	15	0	140	50.0	12	0	\N
775	77	ponyta	0	6	\N	141	52	51	50	85	55	65	0	90	5	190	50.0	10	5	\N
776	770	palossand	0	8	10	204	\N	146	85	75	110	100	75	35	0	60	50.0	12	0	\N
777	771	pyukumuku	0	17	\N	79	\N	195	55	60	130	30	130	5	0	60	50.0	12	12	\N
778	772	type_null	3	12	\N	10	\N	\N	95	95	95	95	95	59	0	3	0.0	12	11	\N
779	773	silvally	3	12	\N	138	\N	\N	95	95	95	95	95	95	0	3	0.0	12	11	\N
780	774	minior	0	15	7	157	\N	\N	60	60	100	60	100	60	0	30	0.0	12	9	\N
781	775	komala	0	12	\N	22	\N	\N	65	115	65	75	95	65	0	45	50.0	12	5	\N
782	776	turtonator	0	6	2	155	\N	\N	60	78	135	91	85	36	0	70	50.0	12	10	3
783	777	togedemaru	0	3	16	84	91	177	65	98	63	40	73	96	0	180	50.0	12	5	4
784	778	mimikyu	0	8	4	39	\N	\N	55	90	80	50	105	96	0	45	50.0	12	0	\N
785	779	bruxish	0	17	14	34	176	210	68	105	70	70	70	92	0	80	50.0	12	13	\N
786	78	rapidash	0	6	\N	141	52	51	65	100	70	80	0	105	5	60	50.0	10	5	\N
787	780	drampa	0	12	2	13	147	\N	78	60	85	135	91	36	0	70	50.0	12	10	3
788	781	dhelmise	0	8	9	173	\N	\N	70	131	100	86	90	40	0	25	0.0	12	9	\N
789	782	jangmo-o	0	2	\N	16	166	112	45	55	65	45	45	45	0	45	50.0	12	3	\N
790	783	hakamo-o	0	2	5	16	166	112	55	75	90	65	70	65	0	45	50.0	12	3	\N
791	784	kommo-o	0	2	5	16	166	112	75	110	125	100	105	85	0	45	50.0	12	3	\N
792	785	tapu_koko	3	3	4	47	\N	186	70	115	85	95	75	130	0	3	0.0	12	11	\N
793	786	tapu_lele	3	14	4	127	\N	186	70	85	75	130	115	95	0	3	0.0	12	11	\N
794	787	tapu_bulu	3	9	4	63	\N	186	70	130	115	85	95	75	0	3	0.0	12	11	\N
795	788	tapu_fini	3	17	4	103	\N	186	70	75	115	95	130	85	0	3	0.0	12	11	\N
796	789	cosmog	1	14	\N	195	\N	\N	43	29	31	29	31	37	0	45	0.0	12	11	\N
797	79	slowpoke	0	17	14	111	114	135	90	65	65	40	0	15	5	190	50.0	10	10	12
798	790	cosmoem	1	14	\N	177	\N	\N	43	29	131	29	131	37	0	45	0.0	12	11	\N
799	791	solgaleo	1	14	16	59	\N	\N	137	137	107	113	89	97	0	45	0.0	12	11	\N
800	792	lunala	1	14	8	151	\N	\N	137	113	89	137	107	97	0	45	0.0	12	11	\N
801	793	nihilego	3	15	13	12	\N	\N	109	53	47	127	131	103	0	45	0.0	12	11	\N
802	794	buzzwole	3	0	5	12	\N	\N	107	139	139	53	53	79	0	45	0.0	12	11	\N
803	795	pheromosa	3	0	5	12	\N	\N	71	137	37	137	37	151	0	45	0.0	12	11	\N
804	796	xurkitree	3	3	\N	12	\N	\N	83	89	71	173	71	83	0	45	0.0	12	11	\N
805	797	celesteela	3	16	7	12	\N	\N	97	101	103	107	101	61	0	45	0.0	12	11	\N
806	798	kartana	3	9	16	12	\N	\N	59	181	131	59	31	109	0	45	0.0	12	11	\N
807	799	guzzlord	3	1	2	12	\N	\N	223	101	53	97	53	43	0	45	0.0	12	11	\N
808	80	slowbro	0	17	14	111	114	135	95	75	110	80	0	30	5	75	50.0	10	10	12
809	800	necrozma	1	14	\N	126	\N	\N	97	107	101	127	89	79	0	255	0.0	12	11	\N
810	801	magearna	2	16	4	165	\N	\N	80	95	115	130	115	65	0	3	0.0	12	11	\N
811	802	marshadow	2	5	8	185	\N	\N	90	125	80	90	90	125	0	3	0.0	12	11	\N
812	803	poipole	3	13	\N	12	\N	\N	67	73	67	73	67	73	0	45	0.0	14	11	\N
813	804	naganadel	3	13	2	12	\N	\N	73	73	73	127	73	121	0	45	0.0	14	11	\N
814	805	stakataka	3	15	16	12	\N	\N	61	131	211	53	101	13	0	30	0.0	14	11	\N
815	806	blacephalon	3	6	8	12	\N	\N	53	127	53	151	79	107	0	30	0.0	14	11	\N
816	807	zeraora	2	3	\N	200	\N	\N	88	112	75	102	80	143	0	3	0.0	14	11	\N
817	808	meltan	2	16	\N	97	\N	\N	46	65	65	55	35	34	0	3	0.0	7	11	\N
818	809	melmetal	2	16	\N	85	\N	\N	135	143	143	80	65	34	0	3	0.0	7	11	\N
819	82	magneton	0	3	16	97	177	\N	50	60	95	120	0	70	5	60	0.0	10	9	\N
820	83	farfetch'd	0	12	7	87	80	36	52	90	55	58	62	60	5	45	50.0	10	6	5
821	84	doduo	0	12	7	141	45	184	35	85	45	35	0	75	5	190	50.0	10	6	\N
822	85	dodrio	0	12	7	141	45	184	60	110	70	60	60	110	5	45	50.0	10	6	\N
823	86	seel	0	17	\N	188	72	74	65	45	55	70	0	45	5	190	50.0	10	12	5
824	87	dewgong	0	17	11	188	72	74	90	70	80	95	0	70	5	75	50.0	10	12	5
825	88	grimer	0	13	\N	174	175	120	80	80	50	40	0	25	5	190	50.0	10	0	\N
826	89	muk	0	13	\N	174	175	120	105	105	75	65	0	50	5	75	50.0	10	0	\N
827	90	shellder	0	17	\N	155	159	112	30	65	100	45	0	40	5	190	50.0	10	14	\N
828	91	cloyster	0	17	\N	155	159	112	50	95	180	85	0	70	5	60	50.0	10	14	\N
829	92	gastly	0	8	13	89	\N	\N	30	35	30	100	0	80	5	190	50.0	10	0	\N
830	93	haunter	0	8	13	89	\N	\N	45	50	45	115	0	95	5	90	50.0	10	0	\N
831	94	gengar	0	8	13	89	\N	\N	60	65	60	130	0	110	5	45	50.0	10	0	\N
832	95	onix	0	15	10	139	177	206	35	45	160	30	0	70	5	45	50.0	10	9	\N
833	96	drowzee	0	14	\N	81	57	80	60	48	45	90	0	42	5	190	50.0	10	8	\N
834	97	hypno	0	14	\N	81	57	80	85	73	70	115	0	67	5	75	50.0	10	8	\N
835	98	krabby	0	17	\N	73	155	154	30	105	90	25	0	50	5	225	50.0	10	14	\N
836	99	kingler	0	17	\N	73	155	154	55	130	115	50	0	75	5	60	50.0	10	14	\N
837	103	exeggutor	0	9	2	58	\N	\N	95	105	85	125	75	45	0	45	50.0	12	7	\N
838	65	alakazam	0	14	\N	191	\N	\N	55	50	65	175	105	150	4	50	75.0	15	8	\N
839	74	geodude	0	15	3	97	177	\N	40	80	100	30	30	20	0	255	50.0	12	9	\N
840	75	graveler	0	15	3	97	177	\N	55	95	115	45	45	35	0	120	50.0	12	9	\N
841	76	golem	0	15	3	97	177	\N	80	120	130	55	65	45	0	45	50.0	12	9	\N
842	77	ponyta	0	14	\N	141	\N	4	50	85	55	65	65	90	1	190	50.0	13	5	\N
843	78	rapidash	0	14	4	141	\N	4	65	100	70	80	80	105	1	60	50.0	13	5	\N
844	79	slowpoke	0	14	\N	61	114	135	90	65	65	40	40	15	1	190	50.0	13	10	12
845	80	slowbro	0	17	14	155	\N	\N	95	75	180	130	80	30	4	75	50.0	8	10	12
846	80	slowbro	0	13	14	130	114	135	95	100	95	100	70	30	1	75	50.0	13	10	12
847	83	farfetch'd	0	5	\N	171	\N	149	52	95	55	58	62	55	1	45	50.0	13	6	5
848	681	aegislash	0	16	8	169	\N	\N	60	140	50	140	50	60	4	45	50.0	15	9	\N
849	94	gengar	0	8	13	152	\N	\N	60	65	80	170	95	130	4	45	50.0	15	0	\N
850	88	grimer	0	13	1	120	61	\N	80	80	50	40	50	25	0	190	50.0	12	0	\N
851	89	muk	0	13	1	120	61	\N	105	105	75	65	100	50	0	75	50.0	12	0	\N
852	105	marowak	0	8	6	28	91	139	60	80	110	50	80	45	0	75	50.0	12	10	\N
853	110	weezing	0	13	4	89	\N	103	65	90	120	85	70	60	1	60	50.0	13	0	\N
854	866	mr._rime	0	11	14	184	\N	74	80	85	75	110	100	70	1	45	50.0	13	8	\N
855	122	mr._mime	0	11	14	199	\N	74	50	65	65	90	90	100	1	45	50.0	13	8	\N
856	870	falinks	0	5	\N	10	\N	36	60	100	100	70	60	75	1	45	0.0	13	4	9
857	115	kangaskhan	0	12	\N	115	\N	\N	105	125	100	60	100	100	4	45	0.0	15	10	\N
858	127	pinsir	0	0	7	1	\N	\N	65	155	120	65	90	105	4	45	50.0	15	1	\N
859	130	gyarados	0	17	1	104	\N	\N	95	155	109	70	130	81	4	45	50.0	15	13	3
860	142	aerodactyl	0	15	7	190	\N	\N	80	135	85	70	95	150	4	45	87.5	15	6	\N
861	208	steelix	0	16	10	142	\N	\N	75	125	230	55	95	30	4	25	50.0	8	9	\N
862	212	scizor	0	0	16	185	\N	\N	70	150	140	65	100	75	4	25	50.0	15	1	\N
863	144	articuno	3	14	7	23	\N	\N	90	85	85	125	100	95	1	3	0.0	13	11	\N
864	145	zapdos	3	5	7	36	\N	\N	90	125	90	85	90	100	1	3	0.0	13	11	\N
865	146	moltres	3	1	7	13	\N	\N	90	85	90	100	125	90	1	3	0.0	13	11	\N
866	199	slowking	0	13	14	27	114	135	95	65	80	110	110	30	1	70	50.0	13	10	12
867	222	corsola	0	8	\N	206	\N	28	60	55	100	65	100	30	1	60	25.0	13	12	14
868	864	cursola	0	8	\N	206	\N	\N	60	95	50	145	130	30	1	30	25.0	13	12	14
869	386	deoxys	2	14	\N	124	\N	\N	50	180	20	180	20	150	2	3	0.0	4	11	\N
870	386	deoxys	2	14	\N	124	\N	\N	50	70	160	70	160	90	2	3	0.0	6	11	\N
871	386	deoxys	2	14	\N	124	\N	\N	50	95	90	95	90	180	2	3	0.0	3	11	\N
872	181	ampharos	0	3	2	104	\N	\N	90	95	105	165	110	45	4	45	50.0	15	10	5
873	214	heracross	0	0	5	159	\N	\N	80	185	115	40	105	75	4	45	50.0	15	1	\N
874	229	houndoom	0	1	6	163	\N	\N	75	90	90	140	90	115	4	45	50.0	15	5	\N
875	248	tyranitar	0	15	1	145	\N	\N	100	164	150	95	120	71	4	45	50.0	15	10	\N
876	865	sirfetch'd	0	5	\N	171	\N	149	62	135	95	68	82	65	1	45	50.0	13	6	5
877	381	latios	0	2	14	89	\N	\N	80	130	100	160	120	110	4	3	100.0	8	11	\N
878	380	latias	0	2	14	89	\N	\N	80	100	120	140	150	110	4	3	0.0	8	11	\N
879	487	giratina	1	8	2	89	\N	\N	150	120	100	120	100	90	6	3	0.0	9	11	\N
880	745	lycanroc	0	15	\N	87	199	110	85	115	75	55	75	82	0	90	50.0	12	5	\N
881	745	lycanroc	0	15	\N	190	\N	\N	75	117	65	55	65	110	0	90	50.0	14	5	\N
882	800	necrozma	1	14	16	126	\N	\N	97	157	127	113	109	77	0	255	0.0	14	11	\N
883	800	necrozma	1	14	8	126	\N	\N	97	113	109	157	127	77	0	255	0.0	14	11	\N
884	800	necrozma	1	14	2	109	\N	\N	97	167	97	167	97	129	0	255	0.0	14	11	\N
885	492	shaymin	2	9	7	150	\N	\N	100	103	75	120	75	127	6	45	0.0	9	11	\N
886	479	rotom	0	3	6	89	\N	\N	50	65	107	105	107	86	6	45	0.0	9	0	\N
887	479	rotom	0	3	17	89	\N	\N	50	65	107	105	107	86	6	45	0.0	9	0	\N
888	479	rotom	0	3	11	89	\N	\N	50	65	107	105	107	86	6	45	0.0	9	0	\N
889	479	rotom	0	3	7	89	\N	\N	50	65	107	105	107	86	6	45	0.0	9	0	\N
890	874	stonjourner	0	15	\N	122	\N	\N	100	125	135	20	20	70	1	60	50.0	13	9	\N
891	479	rotom	0	3	9	89	\N	\N	50	65	107	105	107	86	6	45	0.0	9	0	\N
892	550	basculin	0	17	\N	139	0	104	70	92	65	80	55	98	7	25	50.0	0	13	\N
893	641	tornadus	3	7	\N	135	\N	\N	79	100	80	110	90	121	7	3	100.0	1	11	\N
894	642	thundurus	3	3	7	200	\N	\N	79	105	70	145	80	101	7	3	100.0	1	11	\N
895	645	landorus	3	10	7	82	\N	\N	89	145	90	105	80	91	7	3	100.0	1	11	\N
896	880	dracozolt	0	3	2	200	71	143	90	100	90	80	70	75	1	45	0.0	13	11	\N
897	882	dracovish	0	17	2	202	176	143	90	90	100	70	80	75	1	45	0.0	13	11	\N
898	881	arctozolt	0	3	11	200	170	\N	90	100	90	90	80	55	1	45	0.0	13	11	\N
899	646	kyurem	1	2	11	194	\N	\N	125	120	90	170	100	95	7	3	0.0	1	11	\N
900	883	arctovish	0	17	11	202	74	\N	90	90	100	80	90	55	1	45	0.0	13	11	\N
901	646	kyurem	1	2	11	187	\N	\N	125	170	100	120	90	95	7	3	0.0	1	11	\N
902	884	duraludon	0	16	2	90	\N	\N	70	95	115	120	50	85	1	45	50.0	13	9	3
903	871	pincurchin	0	3	\N	91	\N	47	48	101	95	91	85	15	1	75	50.0	13	12	0
904	877	morpeko	0	3	1	70	\N	\N	58	95	58	70	58	97	1	180	50.0	13	5	4
905	658	greninja	0	17	1	11	\N	\N	72	145	67	153	71	132	0	45	87.5	12	12	\N
906	254	sceptile	0	9	2	91	\N	\N	70	110	75	145	85	145	4	45	87.5	8	10	3
907	257	blaziken	0	6	5	167	\N	\N	80	160	80	130	80	100	4	45	87.5	15	5	\N
908	260	swampert	0	17	10	182	\N	\N	100	150	110	95	110	70	4	45	87.5	8	10	12
909	384	rayquaza	1	2	7	37	\N	\N	105	180	100	180	100	115	4	45	0.0	8	11	\N
910	382	kyogre	1	17	\N	125	\N	\N	100	150	90	180	160	90	4	3	0.0	8	11	\N
911	383	groudon	1	10	6	38	\N	\N	100	180	160	150	90	90	4	3	0.0	8	11	\N
912	306	aggron	0	16	\N	50	\N	\N	70	140	230	60	80	50	4	45	50.0	15	10	\N
913	282	gardevoir	0	14	4	117	\N	\N	68	85	65	165	135	100	4	45	50.0	15	0	\N
914	475	gallade	0	14	5	80	\N	\N	68	165	95	65	115	110	4	45	100.0	8	0	\N
915	310	manectric	0	3	\N	82	\N	\N	70	75	80	135	80	135	4	45	50.0	15	5	\N
916	445	garchomp	0	2	10	142	\N	\N	108	170	115	120	95	92	4	45	50.0	15	10	3
917	810	grookey	0	9	\N	113	\N	63	50	65	50	40	40	65	1	45	87.5	13	5	7
918	811	thwackey	0	9	\N	113	\N	63	70	85	70	55	60	80	1	45	87.5	13	5	7
919	812	rillaboom	0	9	\N	113	\N	63	100	125	90	60	70	85	1	45	87.5	13	5	7
920	813	scorbunny	0	6	\N	15	\N	\N	50	71	40	40	40	69	1	45	87.5	13	5	8
921	814	raboot	0	6	\N	15	\N	\N	65	86	50	55	60	94	1	45	87.5	13	5	8
922	815	cinderace	0	6	\N	15	\N	\N	80	116	75	65	75	119	1	45	87.5	13	5	8
923	816	sobble	0	17	\N	189	\N	\N	50	40	40	70	40	70	1	45	87.5	13	12	5
924	817	drizzile	0	17	\N	189	\N	\N	65	60	55	95	55	90	1	45	87.5	13	12	5
925	818	inteleon	0	17	\N	189	\N	\N	70	85	65	125	65	120	1	45	87.5	13	12	5
926	888	zacian	1	4	\N	83	\N	\N	92	130	115	80	115	138	1	10	0.0	13	11	\N
927	888	zacian	1	4	16	83	\N	\N	92	170	115	80	115	148	1	10	0.0	13	11	\N
928	889	zamazenta	1	5	\N	33	\N	\N	92	130	115	80	115	138	1	10	0.0	13	11	\N
929	889	zamazenta	1	5	16	33	\N	\N	92	130	145	80	145	128	1	10	0.0	13	11	\N
930	890	eternatus	1	13	2	124	\N	\N	140	85	95	145	95	130	1	255	0.0	13	11	\N
931	890	eternatus	1	13	2	124	\N	\N	255	115	250	125	250	130	1	255	0.0	13	11	\N
932	819	skwovet	0	12	\N	17	\N	61	70	55	55	35	35	25	1	255	50.0	13	5	\N
933	820	greedent	0	12	\N	17	\N	61	120	95	95	55	75	20	1	90	50.0	13	5	\N
934	562	yamask	0	10	8	201	\N	\N	38	55	85	30	65	30	1	190	50.0	13	9	0
935	867	runerigus	0	10	8	201	\N	\N	58	95	145	50	105	30	1	90	50.0	13	9	0
936	263	zigzagoon	0	1	12	116	61	\N	38	30	41	30	41	60	1	255	50.0	13	5	\N
937	264	linoone	0	1	12	116	61	\N	78	70	61	50	61	100	1	90	50.0	13	5	\N
938	862	obstagoon	0	1	12	133	66	36	93	90	101	60	81	95	1	45	50.0	13	5	\N
939	821	rookidee	0	7	\N	87	196	14	38	47	35	33	35	57	1	255	50.0	13	6	\N
940	822	corvisquire	0	7	\N	87	196	14	68	67	55	43	55	77	1	120	50.0	13	6	\N
941	823	corviknight	0	7	16	124	196	\N	98	87	105	53	85	67	1	45	50.0	13	6	\N
942	885	dreepy	0	2	8	20	\N	28	28	60	30	40	30	82	1	45	50.0	13	0	3
943	886	drakloak	0	2	8	20	\N	28	68	80	50	60	50	102	1	45	50.0	13	0	3
944	887	dragapult	0	2	8	20	\N	28	88	120	75	100	75	142	1	45	50.0	13	0	3
945	878	cufant	0	16	\N	154	\N	\N	72	80	49	40	49	40	1	190	50.0	13	5	9
946	879	copperajah	0	16	\N	154	\N	\N	122	130	69	80	69	30	1	90	50.0	13	5	9
947	876	indeedee	0	14	12	80	183	127	60	65	55	105	95	95	1	30	100.0	13	4	\N
948	876	indeedee	0	14	12	114	183	127	70	55	65	95	105	85	1	30	0.0	13	4	\N
949	875	eiscue	0	11	\N	75	\N	\N	75	80	110	65	90	50	1	60	50.0	13	12	5
950	875	eiscue	0	11	\N	75	\N	\N	75	80	70	65	50	130	1	60	50.0	13	12	5
951	872	snom	0	11	0	156	\N	\N	30	25	35	45	30	20	1	190	50.0	13	1	\N
952	873	frosmoth	0	11	0	156	\N	\N	70	65	60	125	90	65	1	75	50.0	13	1	\N
953	868	milcery	0	4	\N	181	\N	\N	45	40	40	50	61	34	1	200	0.0	13	4	0
954	869	alcremie	0	4	\N	181	\N	\N	65	60	75	110	121	64	1	100	0.0	13	4	0
955	824	blipbug	0	0	\N	180	24	186	25	20	20	25	45	45	1	255	50.0	13	1	\N
956	825	dottler	0	0	14	180	24	186	50	35	80	50	90	30	1	120	50.0	13	1	\N
957	826	orbeetle	0	0	14	180	58	186	60	45	110	80	120	90	1	45	50.0	13	1	\N
958	827	nickit	0	1	\N	141	\N	168	40	28	28	47	52	50	1	255	50.0	13	5	\N
959	828	thievul	0	1	\N	141	\N	168	70	58	58	87	92	90	1	127	50.0	13	5	\N
960	829	gossifleur	0	9	\N	26	135	46	40	40	60	40	60	10	1	190	50.0	13	7	\N
961	830	eldegoss	0	9	\N	26	135	46	60	50	90	80	120	60	1	75	50.0	13	7	\N
962	831	wooloo	0	12	\N	55	141	16	42	40	55	40	45	48	1	255	50.0	13	5	\N
963	832	dubwool	0	12	\N	55	171	16	72	80	100	60	90	88	1	127	50.0	13	5	\N
964	833	chewtle	0	17	\N	176	155	182	50	64	50	38	38	44	1	255	50.0	13	10	12
965	834	drednaw	0	17	15	176	155	182	90	115	90	48	68	74	1	75	50.0	13	10	12
966	835	yamper	0	3	\N	8	\N	131	59	45	50	40	50	26	1	255	50.0	13	5	\N
967	836	boltund	0	3	\N	176	\N	23	69	90	60	90	60	121	1	45	50.0	13	5	\N
968	837	rolycolt	0	15	\N	172	\N	52	30	40	50	40	50	30	1	255	50.0	13	9	\N
969	838	carkol	0	15	6	172	51	52	80	60	90	60	70	50	1	120	50.0	13	9	\N
970	839	coalossal	0	15	6	172	51	52	110	80	120	80	90	30	1	45	50.0	13	9	\N
971	840	applin	0	9	2	136	61	16	40	40	80	40	40	20	1	255	50.0	13	7	3
972	841	flapple	0	9	2	136	61	71	70	110	80	95	60	70	1	45	50.0	13	7	3
973	842	appletun	0	9	2	136	61	188	110	85	80	100	80	30	1	45	50.0	13	7	3
974	843	silicobra	0	10	\N	144	153	146	52	57	75	35	50	46	1	255	50.0	13	5	3
975	844	sandaconda	0	10	\N	144	153	146	72	107	125	65	70	71	1	120	50.0	13	5	3
976	845	cramorant	0	7	17	65	\N	\N	70	85	55	85	95	85	1	45	50.0	13	12	6
977	846	arrokunda	0	17	\N	182	\N	\N	41	63	40	40	30	66	1	255	50.0	13	13	\N
978	847	barraskewda	0	17	\N	182	\N	\N	61	123	60	60	50	136	1	60	50.0	13	13	\N
979	850	sizzlipede	0	6	0	52	207	51	50	65	45	50	50	45	1	190	50.0	13	1	\N
980	851	centiskorch	0	6	0	52	207	51	100	115	65	90	90	65	1	75	50.0	13	1	\N
981	852	clobbopus	0	5	\N	92	\N	185	50	68	60	50	50	32	1	180	50.0	13	12	8
982	853	grapploct	0	5	\N	92	\N	185	80	118	90	70	80	42	1	45	50.0	13	12	8
983	854	sinistea	0	8	\N	206	\N	28	40	45	45	74	54	50	1	120	0.0	13	9	0
984	855	polteageist	0	8	\N	206	\N	28	60	65	65	134	114	70	1	60	0.0	13	9	0
985	856	hatenna	0	14	\N	67	4	94	42	30	45	56	53	39	1	235	0.0	13	4	\N
986	857	hattrem	0	14	\N	67	4	94	57	40	65	86	73	49	1	120	0.0	13	4	\N
987	858	hatterene	0	14	4	67	4	94	57	90	95	136	103	29	1	45	0.0	13	4	\N
988	859	impidimp	0	1	4	123	58	\N	45	45	30	55	40	50	1	255	100.0	13	4	8
989	860	morgrem	0	1	4	123	58	\N	65	60	45	75	55	70	1	120	100.0	13	4	8
990	861	grimmsnarl	0	1	4	123	58	\N	95	120	65	95	75	60	1	45	100.0	13	4	8
991	12	butterfree	0	0	7	24	\N	\N	60	45	50	90	80	70	1	45	50.0	13	1	\N
992	6	charizard	0	6	7	15	\N	163	78	84	78	109	85	100	1	45	87.5	13	10	3
993	25	pikachu	0	3	\N	170	\N	91	35	55	40	50	50	90	1	190	50.0	13	5	4
994	52	meowth	0	12	\N	116	185	196	40	45	35	40	40	90	1	255	50.0	13	5	\N
995	9	blastoise	0	17	\N	189	\N	\N	79	83	100	85	105	78	1	45	87.5	13	10	12
996	3	venusaur	0	9	13	113	\N	19	80	82	83	100	100	80	1	45	87.5	13	10	7
997	818	inteleon	0	17	\N	189	\N	\N	70	85	65	125	65	120	1	45	87.5	13	12	5
998	815	cinderace	0	6	\N	15	\N	\N	80	116	75	65	75	119	1	45	87.5	13	5	8
999	812	rillaboom	0	9	\N	113	\N	63	100	125	90	60	70	85	1	45	87.5	13	5	7
1000	884	duraludon	0	16	2	90	\N	\N	70	95	115	120	50	85	1	45	50.0	13	9	3
1001	879	copperajah	0	16	\N	154	\N	\N	122	130	69	80	69	30	1	90	50.0	13	5	9
1002	869	alcremie	0	4	\N	181	\N	\N	65	60	75	110	121	64	1	100	0.0	13	4	0
1003	861	grimmsnarl	0	1	4	123	58	\N	95	120	65	95	75	60	1	45	100.0	13	4	8
1004	858	hatterene	0	14	4	67	4	94	57	90	95	136	103	29	1	45	0.0	13	4	\N
1005	851	centiskorch	0	6	0	52	207	51	100	115	65	90	90	65	1	75	50.0	13	1	\N
1006	849	toxtricity	0	3	13	128	118	185	75	98	70	114	70	75	1	45	50.0	13	8	\N
1007	849	toxtricity	0	3	13	128	102	185	75	98	70	114	70	75	1	45	50.0	13	8	\N
1008	844	sandaconda	0	10	\N	144	153	146	72	107	125	65	70	71	1	120	50.0	13	5	3
1009	842	appletun	0	9	2	136	61	188	110	85	80	100	80	30	1	45	50.0	13	7	3
1010	841	flapple	0	9	2	136	61	71	70	110	80	95	60	70	1	45	50.0	13	7	3
1011	839	coalossal	0	15	6	172	51	52	110	80	120	80	90	30	1	45	50.0	13	9	\N
1012	834	drednaw	0	17	15	176	155	182	90	115	90	48	68	74	1	75	50.0	13	10	12
1013	826	orbeetle	0	0	14	180	58	186	60	45	110	80	120	90	1	45	50.0	13	1	\N
1014	823	corviknight	0	7	16	124	196	\N	98	87	105	53	85	67	1	45	50.0	13	6	\N
1015	143	snorlax	0	12	\N	78	188	61	160	110	65	65	110	30	1	25	87.5	13	10	\N
1016	133	eevee	0	12	\N	141	0	4	55	55	50	45	65	55	1	45	87.5	13	5	\N
1017	131	lapras	0	17	11	202	155	72	130	85	80	85	95	60	1	45	50.0	13	10	12
1018	99	kingler	0	17	\N	73	155	154	55	130	115	50	50	75	1	60	50.0	13	14	\N
1019	94	gengar	0	8	13	28	\N	\N	60	65	60	130	75	110	1	45	50.0	13	0	\N
1020	68	machamp	0	5	\N	66	110	171	90	130	80	65	85	55	1	45	75.0	13	8	\N
1021	569	garbodor	0	13	\N	174	206	2	80	95	82	60	82	75	1	60	50.0	13	9	\N
1022	809	melmetal	2	16	\N	85	\N	\N	135	143	143	80	65	34	1	3	0.0	13	11	\N
1023	618	stunfisk	0	10	16	101	\N	\N	109	81	99	66	84	32	1	75	50.0	13	12	0
1024	555	darmanitan	0	6	14	211	\N	\N	105	30	105	140	105	55	7	60	50.0	0	5	\N
1025	555	darmanitan	0	11	\N	62	\N	211	105	140	55	30	55	95	1	60	50.0	13	5	\N
1026	555	darmanitan	0	11	6	211	\N	\N	105	160	55	30	55	135	1	60	50.0	13	5	\N
1027	554	darumaka	0	11	\N	71	\N	80	70	90	45	15	45	50	1	120	50.0	13	5	\N
1028	302	sableye	0	1	8	94	\N	\N	50	85	125	85	115	20	4	45	50.0	8	8	\N
1029	303	mawile	0	16	4	69	\N	\N	50	105	125	55	95	50	4	45	50.0	15	5	4
1030	362	glalie	0	11	\N	134	\N	\N	80	120	80	120	80	100	4	75	50.0	8	4	9
1031	448	lucario	0	5	16	0	\N	\N	70	145	88	140	70	112	4	45	87.5	15	5	8
1032	460	abomasnow	0	9	11	162	\N	\N	90	132	105	132	105	30	4	60	50.0	15	10	7
1033	531	audino	0	12	4	67	\N	\N	103	60	126	80	126	50	4	255	50.0	8	4	\N
1034	774	minior	0	15	7	157	\N	\N	60	100	60	100	60	120	0	30	0.0	12	9	\N
1035	351	castform	0	6	\N	56	\N	\N	70	70	70	70	70	70	2	45	50.0	11	4	0
1036	351	castform	0	17	\N	56	\N	\N	70	70	70	70	70	70	2	45	50.0	11	4	0
1037	351	castform	0	11	\N	56	\N	\N	70	70	70	70	70	70	2	45	50.0	11	4	0
1038	413	wormadam	0	0	10	4	\N	112	60	79	105	59	85	36	6	45	0.0	2	1	\N
1039	413	wormadam	0	0	16	4	\N	112	60	69	95	69	95	36	6	45	0.0	2	1	\N
1040	648	meloetta	2	12	5	150	\N	\N	100	128	90	77	77	128	7	3	0.0	0	11	\N
1041	710	pumpkaboo	0	8	9	116	58	81	44	66	70	44	55	56	4	120	50.0	15	0	\N
1042	710	pumpkaboo	0	8	9	116	58	81	54	66	70	44	55	46	4	120	50.0	15	0	\N
1043	710	pumpkaboo	0	8	9	116	58	81	59	66	70	44	55	41	4	120	50.0	15	0	\N
1044	711	gourgeist	0	8	9	116	58	81	55	85	122	58	75	99	4	60	50.0	15	0	\N
1045	711	gourgeist	0	8	9	116	58	81	75	95	122	58	75	69	4	60	50.0	15	0	\N
1046	711	gourgeist	0	8	9	116	58	81	85	100	122	58	75	54	4	60	50.0	15	0	\N
1047	718	zygarde	1	2	10	6	121	\N	54	100	71	61	85	115	0	3	0.0	12	11	\N
1048	718	zygarde	1	2	10	121	\N	\N	216	100	121	91	95	85	0	3	0.0	12	11	\N
1049	720	hoopa	2	14	1	95	\N	\N	80	160	60	170	130	80	4	3	0.0	8	11	\N
1050	678	meowstic	0	14	\N	87	\N	23	74	48	76	83	81	104	4	75	0.0	15	5	\N
1051	746	wishiwashi	0	17	\N	148	\N	\N	45	140	130	140	135	30	0	60	50.0	12	13	\N
1052	741	oricorio	0	3	7	31	\N	\N	75	70	70	98	70	93	0	45	25.0	12	6	\N
1053	741	oricorio	0	14	7	31	\N	\N	75	70	70	98	70	93	0	45	25.0	12	6	\N
1054	741	oricorio	0	8	7	31	\N	\N	75	70	70	98	70	93	0	45	25.0	12	6	\N
1055	376	metagross	0	16	14	190	\N	\N	80	145	150	105	110	110	4	3	100.0	8	9	\N
1056	373	salamence	0	2	7	1	\N	\N	95	145	130	120	90	120	4	45	50.0	8	3	\N
1057	319	sharpedo	0	17	1	176	\N	\N	70	140	70	110	65	105	4	60	50.0	8	13	\N
1058	323	camerupt	0	6	10	154	\N	\N	70	120	100	145	105	20	4	150	50.0	8	5	\N
1059	334	altaria	0	2	4	117	\N	\N	75	110	110	110	105	80	4	45	50.0	8	6	3
1060	308	medicham	0	5	14	129	\N	\N	60	100	85	80	85	100	4	90	50.0	15	8	\N
1061	359	absol	0	1	\N	94	\N	\N	65	150	60	115	60	115	4	30	50.0	15	5	\N
1062	354	banette	0	8	\N	123	\N	\N	64	165	75	93	83	75	4	45	50.0	15	0	\N
1063	428	lopunny	0	12	5	149	\N	\N	65	136	94	54	96	135	4	60	50.0	8	5	8
1064	719	diancie	2	15	4	94	\N	\N	50	160	110	160	110	110	4	3	0.0	8	11	\N
1065	25	pikachu	0	3	\N	170	\N	91	45	80	50	75	60	120	0	190	50.0	7	5	4
1066	133	eevee	0	12	\N	141	0	4	65	75	70	65	85	75	0	45	87.5	7	5	\N
1067	893	zarude	2	1	9	88	\N	\N	105	120	105	70	95	105	1	3	0.0	13	11	\N
1068	894	regieleki	3	3	\N	192	\N	\N	80	100	50	100	50	200	1	3	0.0	13	11	\N
1069	895	regidrago	3	2	\N	41	\N	\N	200	100	50	100	50	80	1	3	0.0	13	11	\N
1070	892	urshifu	3	5	1	197	\N	\N	100	130	100	63	60	97	1	3	87.5	13	11	\N
1071	892	urshifu	3	5	17	197	\N	\N	100	130	100	63	60	97	1	3	87.5	13	11	\N
1072	896	glastrier	3	11	\N	18	\N	\N	100	145	130	65	110	30	1	3	0.0	13	11	\N
1073	897	spectrier	3	8	\N	64	\N	\N	100	65	60	145	80	130	1	3	0.0	13	11	\N
1074	898	calyrex	1	14	11	5	\N	\N	100	165	150	85	130	50	1	3	0.0	13	11	\N
1075	898	calyrex	1	14	8	5	\N	\N	100	85	80	165	100	150	1	3	0.0	13	11	\N
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
0	bug
1	dark
2	dragon
3	electric
4	fairy
5	fighting
6	fire
7	flying
8	ghost
9	grass
10	ground
11	ice
12	normal
13	poison
14	psychic
15	rock
16	steel
17	water
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

