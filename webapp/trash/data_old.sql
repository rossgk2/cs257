--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)

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
-- Name: growth_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.growth_types (
    id integer NOT NULL,
    growth_type text
);


--
-- Name: growth_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.growth_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: growth_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.growth_types_id_seq OWNED BY public.growth_types.id;


--
-- Name: pokemon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pokemon (
    id integer NOT NULL,
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
-- Name: growth_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_types ALTER COLUMN id SET DEFAULT nextval('public.growth_types_id_seq'::regclass);


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
1	overgrow	powers up grass-type moves when the pokémon's hp is low.
2	null	null
3	chlorophyll	boosts the pokémon's speed stat in harsh sunlight. 
4	thick fat	the pokémon is protected by a layer of thick fat which halves the damage taken from fire- and ice-type moves. 
5	blaze	powers up fire-type moves when the pokémon's hp is low. 
6	solar power	boosts the sp. atk stat in harsh sunlight but hp decreases every turn.
7	tough claws	powers up moves that make direct contact. 
8	drought	turns the sunlight harsh when the pokémon enters a battle.
9	torrent	powers up water-type moves when the pokémon's hp is low. 
10	rain dish	the pokémon gradually regains hp in rain. 
11	mega launcher	powers up aura and pulse moves. 
12	rattled	dark- ghost- and bug-type moves scare the pokémon and boost its speed stat.
13	static	the pokémon is charged with static electricity so contact with it may cause paralysis.
14	klutz	the pokémon can't use any held items.
15	punk rock	boosts the power of sound-based moves. the pokémon also takes half the damage from these kinds of moves.
16	plus	boosts the sp. atk stat of the pokémon if an ally with the plus or minus ability is also in battle.
17	technician	powers up the pokémon's weaker moves.
18	minus	boosts the sp. atk stat of the pokémon if an ally with the plus or minus ability is also in battle.
19	poison point	contact with the pokémon may poison the attacker.
20	rivalry	becomes competitive and deals more damage to pokémon of the same gender but deals less to pokémon of the opposite gender.
21	hustle	boosts the attack stat but lowers accuracy.
22	sheer force	removes additional effects to increase the power of moves when attacking.
23	iron fist	powers up punching moves.
24	intimidate	the pokémon intimidates opposing pokémon upon entering battle lowering their attack stat.
25	guts	it's so gutsy that having a status condition boosts the pokémon's attack stat.
26	shed skin	the pokémon may heal its own status conditions by shedding its skin.
27	compound eyes	the pokémon's compound eyes boost its accuracy.
28	tinted lens	the pokémon can use not very effective moves to deal regular damage.
29	no guard	the pokémon employs no-guard tactics to ensure incoming and outgoing attacks always land.
30	swarm	powers up bug-type moves when the pokémon's hp is low.
31	sniper	powers up moves if they become critical hits when attacking.
32	adaptability	powers up moves of the same type as the pokémon.
33	limber	its limber body protects the pokémon from paralysis.
34	imposter	the pokémon transforms itself into the pokémon it's facing.
35	shield dust	this pokémon's dust blocks the additional effects of attacks taken.
36	run away	enables a sure getaway from wild pokémon.
37	hydration	heals status conditions if it's raining.
38	inner focus	the pokémon's intensely focused and that protects the pokémon from flinching.
39	unseen fist	the pokémon can deal damage with moves that make physical contact even if the target is protected.
40	unnerve	unnerves opposing pokémon and makes them unable to eat berries.
41	synchronize	the attacker will receive the same status condition if it inflicts a burn poison or paralysis to the pokémon.
42	pressure	by putting pressure on the opposing pokémon it raises their pp usage.
43	steadfast	the pokémon's determination boosts the speed stat each time the pokémon flinches.
44	insomnia	the pokémon is suffering from insomnia and cannot fall asleep.
45	magnet pull	prevents steel-type pokémon from escaping using its magnetic force.
46	sturdy	it cannot be knocked out with one hit. one-hit ko moves cannot knock it out either.
47	analytic	boosts move power when the pokémon moves last.
48	soundproof	soundproofing gives the pokémon full immunity to all sound-based moves.
49	aftermath	damages the attacker if it contacts the pokémon with a finishing hit.
50	cute charm	contact with the pokémon may cause infatuation.
51	magic bounce	reflects status moves instead of getting hit by them.
52	friend guard	reduces damage done to allies.
53	magic guard	the pokémon only takes damage from attacks.
54	unaware	when attacking the pokémon ignores the target pokémon's stat changes.
55	flash fire	powers up the pokémon's fire-type moves if it's hit by one.
56	snow cloak	boosts evasiveness in a hailstorm.
57	snow warning	the pokémon summons a hailstorm when it enters a battle.
58	competitive	boosts the sp. atk stat sharply when a stat is lowered.
59	frisk	when it enters a battle the pokémon can check an opposing pokémon's held item.
60	infiltrator	passes through the opposing pokémon's barrier substitute and the like and strikes.
61	stench	by releasing stench when attacking this pokémon may cause the target to flinch.
62	effect spore	contact with the pokémon may inflict poison sleep or paralysis on its attacker.
63	healer	sometimes heals an ally's status condition.
64	dry skin	restores hp in rain or when hit by water-type moves. reduces hp in harsh sunlight and increases the damage received from fire-type moves.
65	damp	prevents the use of explosive moves such as self-destruct by dampening its surroundings.
66	wonder skin	makes status moves more likely to miss.
67	sand veil	boosts the pokémon's evasiveness in a sandstorm.
68	arena trap	prevents opposing pokémon from fleeing.
69	sand force	boosts the power of rock- ground- and steel-type moves in a sandstorm.
70	tangling hair	contact with the pokémon lowers the attacker's speed stat.
71	keen eye	keen eyes prevent other pokémon from lowering this pokémon's accuracy.
72	tangled feet	raises evasiveness if the pokémon is confused.
73	big pecks	protects the pokémon from defense-lowering effects.
74	gluttony	makes the pokémon eat a held berry when its hp drops to half or less which is sooner than usual.
75	lightning rod	the pokémon draws in all electric-type moves. instead of being hit by electric-type moves it boosts its sp. atk.
76	surge surfer	doubles the pokémon's speed stat on electric terrain.
77	sand rush	boosts the pokémon's speed stat in a sandstorm.
78	slush rush	boosts the pokémon's speed stat in a hailstorm.
79	pickup	the pokémon may pick up the item an opposing pokémon used during a battle. it may pick up items outside of battle too.
80	battle armor	hard armor protects the pokémon from critical hits.
81	steely spirit	powers up ally pokémon's steel-type moves.
82	fur coat	halves the damage from physical moves.
83	cloud nine	eliminates the effects of weather.
84	swift swim	boosts the pokémon's speed stat in rain.
85	harvest	may create another berry after one is used.
86	rock head	protects the pokémon from recoil damage.
87	reckless	powers up moves that have recoil damage.
88	unburden	boosts the speed stat if the pokémon's held item is used or lost.
89	own tempo	this pokémon has its own tempo and that prevents it from becoming confused.
90	oblivious	the pokémon is oblivious and that keeps it from being infatuated or falling for taunts.
91	levitate	by floating in the air the pokémon receives full immunity to all ground-type moves.
92	natural cure	all status conditions heal when the pokémon switches out.
93	serene grace	boosts the likelihood of additional effects occurring when attacking.
94	leaf guard	prevents status conditions in harsh sunlight.
95	regenerator	restores a little hp when withdrawn from battle.
96	early bird	the pokémon awakens from sleep twice as fast as other pokémon.
97	scrappy	the pokémon can hit ghost-type pokémon with normal- and fighting-type moves.
98	water veil	the pokémon is covered with a water veil which prevents the pokémon from getting a burn.
99	illuminate	raises the likelihood of meeting wild pokémon by illuminating the surroundings.
100	filter	reduces the power of supereffective attacks taken.
101	forewarn	when it enters a battle the pokémon can tell one of the moves an opposing pokémon has.
102	vital spirit	the pokémon is full of vitality and that prevents it from falling asleep.
103	flame body	contact with the pokémon may burn the attacker.
104	hyper cutter	the pokémon's proud of its powerful pincers. they prevent other pokémon from lowering its attack stat.
105	mold breaker	moves can be used on the target regardless of its abilities.
106	moxie	the pokémon shows moxie and that boosts the attack stat after knocking out any pokémon.
107	anger point	the pokémon is angered when it takes a critical hit and that maxes its attack stat.
108	water absorb	restores hp if hit by a water-type move instead of taking damage.
109	shell armor	a hard shell protects the pokémon from critical hits.
110	anticipation	the pokémon can sense an opposing pokémon's dangerous moves.
111	volt absorb	restores hp if hit by an electric-type move instead of taking damage.
112	quick feet	boosts the speed stat if the pokémon has a status condition.
113	trace	when it enters a battle the pokémon copies an opposing pokémon's ability.
114	download	compares an opposing pokémon's defense and sp. def stats before raising its own attack or sp. atk stat—whichever will be more effective.
115	weak armor	physical attacks to the pokémon lower its defense stat but sharply raise its speed stat.
116	immunity	the immune system of the pokémon prevents it from getting poisoned.
117	marvel scale	the pokémon's marvelous scales boost the defense stat if it has a status condition.
118	multiscale	reduces the amount of damage the pokémon takes while its hp is full.
119	super luck	the pokémon is so lucky that the critical-hit ratios of its moves are boosted.
120	huge power	doubles the pokémon's attack stat.
121	sap sipper	boosts the attack stat if hit by a grass-type move instead of taking damage.
122	drizzle	the pokémon makes it rain when it enters a battle.
123	skill link	maximizes the number of times multistrike moves hit.
124	speed boost	its speed stat is boosted every turn.
125	prankster	gives priority to a status move.
126	shadow tag	this pokémon steps on the opposing pokémon's shadow to prevent it from escaping.
127	telepathy	anticipates an ally's attack and dodges it.
128	overcoat	protects the pokémon from things like sand hail and powder.
129	light metal	halves the pokémon's weight.
130	contrary	makes stat changes have an opposite effect.
131	pickpocket	steals an item from an attacker that made direct contact.
132	honey gather	the pokémon may gather honey after a battle.
133	magma armor	the pokémon is covered with hot magma which prevents the pokémon from becoming frozen.
134	moody	raises one stat sharply and lowers another every turn.
135	suction cups	this pokémon uses suction cups to stay in one spot to negate all moves and items that force switching out.
136	sand stream	the pokémon summons a sandstorm when it enters a battle.
137	poison heal	restores hp if the pokémon is poisoned instead of losing hp.
138	truant	the pokémon can't use a move if it had used a move on the previous turn.
139	wonder guard	its mysterious power only lets supereffective moves hit the pokémon.
140	normalize	all the pokémon's moves become normal type. the power of those moves is boosted a little.
141	stall	the pokémon moves after all other pokémon do.
142	heavy metal	doubles the pokémon's weight.
143	pure power	using its pure power the pokémon doubles its attack stat.
144	liquid ooze	the oozed liquid has a strong stench which damages attackers using any draining move.
145	sticky hold	items held by the pokémon are stuck fast and cannot be removed by other pokémon.
146	rough skin	this pokémon inflicts damage with its rough skin to the attacker on contact.
147	simple	the stat changes the pokémon receives are doubled.
148	solid rock	reduces the power of supereffective attacks taken.
149	white smoke	the pokémon is protected by its white smoke which prevents other pokémon from lowering its stats.
150	toxic boost	powers up physical attacks when the pokémon is poisoned.
151	storm drain	draws in all water-type moves. instead of being hit by water-type moves it boosts its sp. atk.
152	forecast	the pokémon transforms with the weather to change its type to water fire or ice.
153	color change	the pokémon's type becomes the type of the move used on it.
154	protean	changes the pokémon's type to the type of the move it's about to use.
155	cursed body	may disable a move used on the pokémon.
156	justified	being hit by a dark-type move boosts the attack stat of the pokémon for justice.
157	ice body	the pokémon gradually regains hp in a hailstorm.
158	clear body	prevents other pokémon's moves or abilities from lowering the pokémon's stats.
159	air lock	eliminates the effects of weather.
160	defiant	boosts the pokémon's attack stat sharply when its stats are lowered.
161	flower gift	boosts the attack and sp. def stats of itself and allies in harsh sunlight.
162	flare boost	powers up special attacks when the pokémon is burned.
163	heatproof	the heatproof body of the pokémon halves the damage from fire-type moves that hit it.
164	poison touch	may poison a target when the pokémon makes contact.
165	motor drive	boosts its speed stat if hit by an electric-type move instead of taking damage.
166	slow start	for five turns the pokémon's attack and speed stats are halved.
167	bad dreams	reduces the hp of sleeping opposing pokémon.
168	multitype	changes the pokémon's type to match the plate or z-crystal it holds.
169	victory star	boosts the accuracy of its allies and itself.
170	symbiosis	the pokémon passes its item to an ally that has used up an item.
171	zen mode	changes the pokémon's shape when hp is half or less.
172	mummy	contact with the pokémon changes the attacker's ability to mummy.
173	defeatist	halves the pokémon's attack and sp. atk stats when its hp becomes half or less.
174	illusion	comes out disguised as the pokémon in the party's last spot.
175	iron barbs	inflicts damage on the attacker upon contact with iron barbs.
176	turboblaze	moves can be used on the target regardless of its abilities.
177	teravolt	moves can be used on the target regardless of its abilities.
178	bulletproof	protects the pokémon from some ball and bomb moves.
179	magician	the pokémon steals the held item of a pokémon it hits with a move.
180	cheek pouch	restores hp as well when the pokémon eats a berry.
181	gale wings	gives priority to flying-type moves when the pokémon's hp is full.
182	flower veil	ally grass-type pokémon are protected from status conditions and the lowering of their stats.
183	grass pelt	boosts the pokémon's defense stat on grassy terrain.
184	stance change	the pokémon changes its form to blade forme when it uses an attack move and changes to shield forme when it uses king's shield.
185	aroma veil	protects itself and its allies from attacks that limit their move choices.
186	sweet veil	prevents itself and ally pokémon from falling asleep.
187	strong jaw	the pokémon's strong jaw boosts the power of its biting moves.
188	refrigerate	normal-type moves become ice-type moves. the power of those moves is boosted a little.
189	pixilate	normal-type moves become fairy-type moves. the power of those moves is boosted a little.
190	gooey	contact with the pokémon lowers the attacker's speed stat.
191	fairy aura	powers up each pokémon's fairy-type moves.
192	dark aura	powers up each pokémon's dark-type moves.
193	aura break	the effects of aura abilities are reversed to lower the power of affected moves.
194	power construct	other cells gather to aid when its hp becomes half or less. then the pokémon changes its form to complete forme.
195	long reach	the pokémon uses its moves without making contact with the target.
196	liquid voice	all sound-based moves become water-type moves.
197	stakeout	doubles the damage dealt to the target's replacement if the target switches out.
198	battery	powers up ally pokémon's special moves.
199	dancer	when another pokémon uses a dance move it can use a dance move following it regardless of its speed.
200	schooling	when it has a lot of hp the pokémon forms a powerful school. it stops schooling when its hp is low.  doesn't work until level 20.
201	merciless	the pokémon's attacks become critical hits if the target is poisoned.
202	stamina	boosts the defense stat when hit by an attack.
203	water bubble	lowers the power of fire-type moves done to the pokémon and prevents the pokémon from getting a burn.
204	corrosion	the pokémon can poison the target even if it's a steel or poison type.
205	fluffy	halves the damage taken from moves that make direct contact but doubles that of fire-type moves.
206	queenly majesty	its majesty pressures the opposing pokémon making it unable to attack using priority moves.
207	triage	gives priority to a healing move.
208	receiver	the pokémon copies the ability of a defeated ally.
209	wimp out	the pokémon cowardly switches out when its hp becomes half or less.
210	emergency exit	the pokémon sensing danger switches out when its hp becomes half or less.
211	water compaction	boosts the pokémon's defense stat sharply when hit by a water-type move.
212	innards out	damages the attacker landing the finishing hit by the amount equal to its last hp.
213	rks system	changes the pokémon's type to match the memory disc it holds.
214	shields down	when its hp becomes half or less the pokémon's shell breaks and it becomes aggressive.
215	comatose	it's always drowsing and will never wake up. it can attack without waking up.
216	disguise	once per battle the shroud that covers the pokémon can protect it from an attack.
217	dazzling	surprises the opposing pokémon making it unable to attack using priority moves.
218	berserk	boosts the pokémon's sp. atk stat when it takes a hit that causes its hp to become half or less.
219	steelworker	powers up steel-type moves.
220	electric surge	turns the ground into electric terrain when the pokémon enters a battle.
221	psychic surge	turns the ground into psychic terrain when the pokémon enters a battle.
222	grassy surge	turns the ground into grassy terrain when the pokémon enters a battle.
223	misty surge	turns the ground into misty terrain when the pokémon enters a battle.
224	full metal body	prevents other pokémon's moves or abilities from lowering the pokémon's stats.
225	shadow shield	reduces the amount of damage the pokémon takes while its hp is full.
226	beast boost	the pokémon boosts its most proficient stat each time it knocks out a pokémon.
227	prism armor	reduces the power of supereffective attacks taken.
228	soul-heart	boosts its sp. atk stat every time a pokémon faints.
229	galvanize	normal-type moves become electric-type moves. the power of those moves is boosted a little.
230	pastel veil	protects the pokémon and its ally pokémon from being poisoned.
231	quick draw	enables the pokémon to move first occasionally.
232	power of alchemy	the pokémon copies the ability of a defeated ally.
233	neutralizing gas	if the pokémon with neutralizing gas is in the battle the effects of all pokémon's abilities will be nullified or will not be triggered.
234	screen cleaner	when the pokémon enters a battle the effects of light screen reflect and aurora veil are nullified for both opposing and ally pokémon.
235	parental bond	parent and child each attacks.
236	aerilate	normal-type moves become flying-type moves. the power of those moves is boosted a little.
237	curious medicine	when the pokémon is brought into battle any stat alterations of allies are removed.
238	perish body	when hit by a move that makes direct contact the pokémon and the attacker will faint after three turns unless they switch out of battle.
239	neuroforce	powers up moves that are super effective.
240	power spot	just being next to the pokémon powers up moves.
241	stalwart	ignores the effects of opposing pokémon's abilities and moves that draw in moves.
242	hunger switch	the pokémon changes its form alternating between its full belly mode and hangry mode after the end of each turn.
243	battle bond	defeating an opposing pokémon strengthens the pokémon's bond with its trainer and it becomes ash-greninja. water shuriken gets more powerful.
244	delta stream	the pokémon changes the weather to eliminate all of the flying type's weaknesses.
245	primordial sea	the pokémon changes the weather to nullify fire-type attacks.
246	desolate land	the pokémon changes the weather to nullify water-type attacks.
247	libero	changes the pokémon's type to the type of the move it's about to use.
248	intrepid sword	boosts the pokémon's attack stat when the pokémon enters a battle.
249	dauntless shield	boosts the pokémon's defense stat when the pokémon enters a battle.
250	wandering spirit	the pokémon exchanges abilities with a pokémon that hits it with a move that makes direct contact.
251	mirror armor	bounces back only the stat-lowering effects that the pokémon receives.
252	ice face	the pokémon's ice head can take a physical attack as a substitute but the attack also changes the pokémon's appearance. the ice will be restored when it hails.
253	ice scales	the pokémon is protected by ice scales which halve the damage taken from special moves.
254	cotton down	when the pokémon is hit by an attack it scatters cotton fluff around and lowers the speed stat of all pokémon except itself.
255	ball fetch	if the pokémon is not holding an item it will fetch the poke ball from the first failed throw of the battle.
256	steam engine	boosts the pokémon's speed stat drastically if hit by a fire- or water-type move.
257	ripen	ripens berries and doubles their effect.
258	sand spit	the pokémon creates a sandstorm when it's hit by an attack.
259	gulp missile	when the pokémon uses surf or dive it will come back with prey. when it takes damage it will spit out the prey to attack.
260	propeller tail	ignores the effects of opposing pokémon's abilities and moves that draw in moves.
261	mimicry	changes the pokémon's type depending on the terrain.
262	gorilla tactics	boosts the pokémon's attack stat but only allows the use of the first selected move.
263	transistor	powers up electric-type moves.
264	dragon's maw	powers up dragon-type moves.
265	chilling neigh	when the pokémon knocks out a target it utters a chilling neigh which boosts its attack stat.
266	grim neigh	when the pokémon knocks out a target it utters a terrifying neigh which boosts its special attack stat.
267	as one	this ability combines the effects of both calyrex’s unnerve ability and glastrier’s/spectrier’s chilling neigh/grim neigh ability.
\.


--
-- Data for Name: egg_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.egg_groups (id, egg_group) FROM stdin;
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.games (id, game) FROM stdin;
\.


--
-- Data for Name: growth_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.growth_types (id, growth_type) FROM stdin;
1	medium slow
2	medium fast
3	slow
4	fast
5	fluctuating
6	erratic
1	red / blue / yellow
2	x / y
3	sword / shield
4	diamond / pearl
5	omega ruby / alpha sapphire
6	gold / silver / crystal
7	sun / moon
8	ruby / sapphire
9	black / white
10	ultra sun / ultra moon
11	let's go pikachu / let's go eevee
12	fire red
13	leaf green
14	emerald
15	platinum
16	black 2 / white 2
1	monster
2	undiscovered
3	human-like
4	field
5	bug
6	mineral
7	ditto
8	water 1
9	fairy
10	flying
11	grass
12	amorphous
13	water 2
14	water 3
15	dragon
52	null
\.


--
-- Data for Name: pokemon; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pokemon (id, pokedex_number, pokemon_name, legendary_id, type1_id, type2_id, ability1_id, ability2_id, hidden_ability, health, attack, defense, special_attack, special_defense, speed, region_id, catch_rate, growth_type_id, male_percent, game_id, egg_group1_id, egg_group2_id) FROM stdin;
1	1	bulbasaur	1	1	5	1	2	3	45	49	49	65	0	45	1	45	1	87.5	1	1	11
2	2	ivysaur	1	1	5	1	2	3	60	62	63	80	0	60	1	45	1	87.5	1	1	11
3	3	venusaur	1	1	5	1	2	3	80	82	83	100	0	80	1	45	1	87.5	1	1	11
4	3	venusaur	1	1	5	4	2	2	80	100	123	122	120	80	2	45	1	87.5	2	1	11
5	4	charmander	1	2	52	5	2	6	39	52	43	50	0	65	1	45	1	87.5	1	1	15
6	5	charmeleon	1	2	52	5	2	6	58	64	58	65	0	80	1	45	1	87.5	1	1	15
7	6	charizard	1	2	18	5	2	6	78	84	78	85	0	100	1	45	1	87.5	1	1	15
8	6	charizard	1	2	16	7	2	2	78	130	111	130	85	100	2	45	1	87.5	2	1	15
9	6	charizard	1	2	18	8	2	2	78	104	78	159	115	100	2	45	1	87.5	2	1	15
10	7	squirtle	1	3	52	9	2	10	44	48	65	50	0	43	1	45	1	87.5	1	1	8
11	8	wartortle	1	3	52	9	2	10	59	63	80	65	0	58	1	45	1	87.5	1	1	8
12	9	blastoise	1	3	52	9	2	10	79	83	100	85	0	78	1	45	1	87.5	1	1	8
13	9	blastoise	1	3	52	11	2	2	79	103	120	135	115	78	2	45	1	87.5	2	1	8
14	848	toxel	1	4	5	12	13	14	40	38	35	54	35	40	3	75	1	50	3	2	52
15	849	toxtricity	1	4	5	15	16	17	75	98	70	114	70	75	3	45	1	50	3	3	52
16	849	toxtricity	1	4	5	15	18	17	75	98	70	114	70	75	3	45	1	50	3	3	52
17	30	nidorina	1	5	52	19	20	21	70	62	67	55	0	56	1	120	1	0	1	2	52
18	31	nidoqueen	1	5	13	19	20	22	90	92	87	75	85	76	1	45	1	0	1	2	52
19	392	infernape	1	2	9	5	2	23	76	104	71	104	71	108	4	45	1	87.5	4	4	3
20	403	shinx	1	4	52	20	24	25	45	65	34	40	34	45	4	235	1	50	4	4	52
21	404	luxio	1	4	52	20	24	25	60	85	49	60	49	60	4	120	1	50	4	4	52
22	405	luxray	1	4	52	20	24	25	80	120	79	95	79	70	4	45	1	50	4	4	52
23	11	metapod	1	6	52	26	2	2	50	20	55	25	0	30	1	120	2	50	1	5	52
24	12	butterfree	1	6	18	27	2	28	60	45	50	90	80	70	1	45	2	50	1	5	52
25	679	honedge	1	7	17	29	2	2	45	80	100	35	37	28	2	180	2	50	2	6	52
26	680	doublade	1	7	17	29	2	2	59	110	150	45	49	35	2	90	2	50	2	6	52
27	15	beedrill	1	6	5	30	2	31	65	90	40	45	80	75	1	45	2	50	1	5	52
28	15	beedrill	1	6	5	32	2	2	65	150	40	15	80	145	2	45	2	50	5	5	52
29	132	ditto	1	8	52	33	2	34	48	48	48	48	0	48	1	35	2	0	1	7	52
30	14	kakuna	1	6	5	26	2	2	45	25	50	25	0	35	1	120	2	50	1	5	52
31	13	weedle	1	6	5	35	2	36	40	35	30	20	0	50	1	255	2	50	1	5	52
32	10	caterpie	1	6	52	35	2	36	45	30	35	20	0	45	1	255	2	50	1	5	52
33	29	nidoran (female)	1	5	52	19	20	21	55	47	52	40	0	41	1	235	1	0	1	1	4
34	390	chimchar	1	2	52	5	2	23	44	58	44	58	44	61	4	45	1	87.5	4	4	3
35	391	monferno	1	2	9	5	2	23	64	78	52	78	52	81	4	45	1	87.5	4	4	3
36	489	phione	2	3	52	37	2	2	80	80	80	80	80	80	4	30	3	0	4	8	9
37	490	manaphy	2	3	52	37	2	2	100	100	100	100	100	100	4	3	3	0	4	8	9
38	891	kubfu	3	9	52	38	2	2	60	90	60	53	50	72	3	3	3	87.5	3	2	52
39	892	urshifu	3	9	14	39	2	2	100	130	100	63	60	97	3	3	3	87.5	3	2	52
40	892	urshifu	3	9	3	39	2	2	100	130	100	63	60	97	3	3	3	87.5	3	2	52
41	898	calyrex	4	10	1	40	2	2	100	80	80	80	80	80	3	3	3	0	3	2	52
42	151	mew	2	10	52	41	2	2	100	100	100	100	0	100	1	45	1	0	1	2	52
43	150	mewtwo	4	10	52	42	2	40	106	110	90	154	0	130	1	3	3	0	1	2	52
44	150	mewtwo	4	10	52	43	2	2	106	190	100	154	100	130	2	3	3	0	2	2	52
45	150	mewtwo	4	10	52	44	2	2	106	150	70	194	120	140	2	3	3	0	2	2	52
46	81	magnemite	1	4	7	45	46	47	25	35	70	95	0	45	1	190	2	0	1	6	52
47	100	voltorb	1	4	52	48	13	49	40	30	50	55	0	100	1	190	2	0	1	6	52
48	32	nidoran (male)	1	5	52	19	20	21	46	57	40	40	0	50	1	235	1	100	1	1	4
49	33	nidorino	1	5	52	19	20	21	61	72	57	55	0	65	1	120	1	100	1	1	4
50	34	nidoking	1	5	13	19	20	22	81	102	77	85	75	85	1	45	1	100	1	1	4
51	173	cleffa	1	11	52	50	51	52	50	25	28	45	55	15	5	150	4	25	6	2	52
52	35	clefairy	1	11	52	50	53	52	70	45	48	60	0	35	1	150	4	25	1	9	52
53	36	clefable	1	11	52	50	53	54	95	70	73	95	90	60	1	25	4	25	1	9	52
54	37	vulpix	1	2	52	55	2	8	38	41	40	65	0	65	1	190	2	25	1	4	52
55	37	vulpix	1	12	52	56	2	57	38	41	40	50	65	65	6	190	2	25	7	4	52
56	38	ninetales	1	2	52	55	2	8	73	76	75	100	0	100	1	75	2	25	1	4	52
57	38	ninetales	1	12	11	56	2	57	73	67	75	81	100	109	6	75	2	25	7	4	52
58	174	igglybuff	1	8	11	50	58	52	90	30	15	40	20	15	5	170	4	25	6	2	52
59	39	jigglypuff	1	8	11	50	58	52	115	45	20	25	0	20	1	170	4	25	1	9	52
60	40	wigglytuff	1	8	11	50	58	59	140	70	45	85	50	45	1	50	4	25	1	9	52
61	41	zubat	1	5	18	38	2	60	40	45	35	40	0	55	1	255	2	50	1	10	52
62	42	golbat	1	5	18	38	2	60	75	80	70	75	0	95	1	90	2	50	1	10	52
63	169	crobat	1	5	18	38	2	60	85	90	80	70	80	130	5	90	2	50	6	10	52
64	43	oddish	1	1	5	3	2	36	45	50	55	75	0	30	1	255	1	50	1	11	52
65	44	gloom	1	1	5	3	2	61	60	65	70	85	0	40	1	120	1	50	1	11	52
66	45	vileplume	1	1	5	3	2	62	75	80	85	110	90	50	1	45	1	50	1	11	52
67	182	bellossom	1	1	52	3	2	63	75	80	95	90	100	50	5	45	1	50	6	11	52
68	46	paras	1	6	1	62	64	65	35	70	55	55	0	25	1	190	2	50	1	5	11
69	47	parasect	1	6	1	62	64	65	60	95	80	80	0	30	1	75	2	50	1	5	11
70	48	venonat	1	6	5	27	28	36	60	55	50	40	0	45	1	190	2	50	1	5	52
71	49	venomoth	1	6	5	35	28	66	70	65	60	90	0	90	1	75	2	50	1	5	52
72	50	diglett	1	13	52	67	68	69	10	55	25	45	0	95	1	255	2	50	1	4	52
73	51	dugtrio	1	13	52	67	68	69	35	100	50	50	70	120	1	50	2	50	1	4	52
74	50	diglett	1	13	7	67	70	69	10	55	30	35	45	90	6	255	2	50	7	4	52
75	51	dugtrio	1	13	7	67	70	69	35	100	60	50	70	110	6	50	2	50	7	4	52
76	16	pidgey	1	8	18	71	72	73	40	45	40	35	0	56	1	255	1	50	1	10	52
77	17	pidgeotto	1	8	18	71	72	73	63	60	55	50	0	71	1	120	1	50	1	10	52
78	18	pidgeot	1	8	18	71	72	73	83	80	75	70	70	101	1	45	1	50	1	10	52
79	18	pidgeot	1	8	18	29	2	2	83	80	80	135	80	121	2	45	1	50	5	10	52
80	19	rattata	1	8	52	36	25	21	30	56	35	25	0	72	1	255	2	50	1	4	52
81	19	rattata	1	14	8	74	21	4	30	56	35	25	35	72	6	255	2	50	7	4	52
82	20	raticate	1	8	52	36	25	21	55	81	60	50	0	97	1	127	2	50	1	4	52
83	20	raticate	1	14	8	74	21	4	75	71	70	40	80	77	6	127	2	50	7	4	52
84	21	spearow	1	8	18	71	2	31	40	60	30	31	0	70	1	255	2	50	1	10	52
85	22	fearow	1	8	18	71	2	31	65	90	65	61	0	100	1	90	2	50	1	10	52
86	23	ekans	1	5	52	24	26	40	35	60	44	40	0	55	1	255	2	50	1	4	15
87	24	arbok	1	5	52	24	26	40	60	95	69	65	79	80	1	90	2	50	1	4	15
88	172	pichu	1	4	52	13	2	75	20	40	15	35	35	60	5	190	2	50	6	2	52
89	25	pikachu	1	4	52	13	2	75	35	55	40	50	0	90	1	190	2	50	1	4	9
90	26	raichu	1	4	52	13	2	75	60	90	55	90	80	110	1	75	2	50	1	4	9
91	26	raichu	1	4	10	76	2	2	60	85	50	95	85	110	6	75	2	50	7	4	9
92	27	sandshrew	1	13	52	67	2	77	50	75	85	30	0	40	1	255	2	50	1	4	52
93	27	sandshrew	1	12	7	56	2	78	50	75	90	10	35	40	6	255	2	50	7	4	52
94	28	sandslash	1	13	52	67	2	77	75	100	110	55	0	65	1	90	2	50	1	4	52
95	28	sandslash	1	12	7	56	2	78	75	100	120	25	65	65	6	90	2	50	7	4	52
96	52	meowth	1	8	52	79	17	40	40	45	35	40	0	90	1	255	2	50	1	4	52
97	52	meowth	1	14	52	79	17	12	40	35	35	50	40	90	6	255	2	50	7	4	52
98	52	meowth	1	7	52	79	7	40	50	65	55	40	40	40	3	255	2	50	3	4	52
99	863	perrserker	1	7	52	80	7	81	70	110	100	50	60	50	3	90	2	50	3	4	52
100	53	persian	1	8	52	33	17	40	65	70	60	65	0	115	1	90	2	50	1	4	52
101	53	persian	1	14	52	82	17	12	65	60	60	75	65	115	6	90	2	50	7	4	52
102	54	psyduck	1	3	52	65	83	84	50	52	48	50	0	55	1	190	2	50	1	8	4
105	101	electrode	1	4	52	48	13	49	60	50	70	80	80	150	1	60	2	0	1	6	52
136	102	exeggcute	1	1	10	3	2	85	60	40	80	60	0	40	1	90	3	50	1	11	52
137	103	exeggutor	1	1	10	3	2	85	95	95	85	125	75	55	1	45	3	50	1	11	52
138	104	cubone	1	13	52	86	75	80	50	50	95	40	0	35	1	190	2	50	1	1	52
139	105	marowak	1	13	52	86	75	80	60	80	110	50	0	45	1	75	2	50	1	1	52
140	106	hitmonlee	1	9	52	33	87	88	50	120	53	35	0	87	1	45	2	100	1	3	52
141	107	hitmonchan	1	9	52	71	23	38	50	105	79	35	0	76	1	45	2	100	1	3	52
142	108	lickitung	1	8	52	89	90	83	90	55	75	60	0	30	1	45	2	50	1	1	52
143	109	koffing	1	5	52	91	2	2	40	65	95	60	0	35	1	190	2	50	1	12	52
144	110	weezing	1	5	52	91	2	2	65	90	120	85	0	60	1	60	2	50	1	12	52
145	111	rhyhorn	1	13	15	75	86	87	80	85	95	30	0	25	1	120	3	50	1	1	4
146	112	rhydon	1	13	15	75	86	87	105	130	120	45	0	40	1	60	3	50	1	1	4
147	113	chansey	1	8	52	92	93	63	250	5	5	105	0	50	1	30	4	0	1	9	52
148	114	tangela	1	1	52	3	94	95	65	55	115	100	0	60	1	45	2	50	1	11	52
211	115	kangaskhan	1	8	52	96	97	38	105	95	80	40	0	90	1	45	2	0	1	1	52
212	116	horsea	1	3	52	84	31	65	30	40	70	70	0	60	1	225	2	50	1	8	15
213	117	seadra	1	3	52	19	31	65	55	65	95	95	0	85	1	75	2	50	1	8	15
214	118	goldeen	1	3	52	84	98	75	45	67	60	50	0	63	1	225	2	50	1	13	52
215	119	seaking	1	3	52	84	98	75	80	92	65	80	0	68	1	60	2	50	1	13	52
216	120	staryu	1	3	52	99	92	47	30	45	55	70	0	85	1	225	3	0	1	14	52
217	121	starmie	1	3	10	99	92	47	60	75	85	100	0	115	1	60	3	0	1	14	52
218	122	mr. mime	1	10	11	48	100	17	40	45	65	100	0	90	1	45	2	50	1	3	52
219	123	scyther	1	6	18	30	17	43	70	110	80	55	0	105	1	45	2	50	1	5	52
220	124	jynx	1	12	10	90	101	64	65	50	35	95	0	95	1	45	2	0	1	3	52
221	125	electabuzz	1	4	52	13	2	102	65	83	57	85	0	105	1	45	2	75	1	3	52
222	126	magmar	1	2	52	103	2	102	65	95	57	85	0	93	1	45	2	75	1	3	52
223	127	pinsir	1	6	52	104	105	106	65	125	100	55	0	85	1	45	3	50	1	5	52
224	128	tauros	1	8	52	24	107	22	75	100	95	70	0	110	1	45	3	100	1	4	52
225	129	magikarp	1	3	52	84	2	12	20	10	55	20	0	80	1	255	3	50	1	13	15
226	130	gyarados	1	3	18	24	2	106	95	125	79	100	0	81	1	45	3	50	1	13	15
227	131	lapras	1	3	12	108	109	37	130	85	80	95	0	60	1	45	3	50	1	1	8
228	133	eevee	1	8	52	36	32	110	55	55	50	65	0	55	1	45	2	87.5	1	4	52
229	134	vaporeon	1	3	52	108	2	37	130	65	60	110	0	65	1	45	2	87.5	1	4	52
230	135	jolteon	1	4	52	111	2	112	65	65	60	110	0	130	1	45	2	87.5	1	4	52
231	136	flareon	1	2	52	55	2	25	65	130	60	110	0	65	1	45	2	87.5	1	4	52
232	137	porygon	1	8	52	113	114	47	65	60	70	75	0	40	1	45	2	0	1	6	52
233	138	omanyte	1	15	3	84	109	115	35	40	100	90	0	35	1	45	2	87.5	1	8	14
234	139	omastar	1	15	3	84	109	115	70	60	125	115	0	55	1	45	2	87.5	1	8	14
235	140	kabuto	1	15	3	84	80	115	30	80	90	45	0	55	1	45	2	87.5	1	8	14
236	141	kabutops	1	15	3	84	80	115	60	115	105	70	0	80	1	45	2	87.5	1	8	14
237	142	aerodactyl	1	15	18	86	42	40	80	105	65	60	0	130	1	45	3	87.5	1	10	52
238	143	snorlax	1	8	52	116	4	74	160	110	65	65	0	30	1	25	3	87.5	1	1	52
239	144	articuno	3	12	18	42	2	56	90	85	100	125	0	85	1	3	3	0	1	2	52
240	145	zapdos	3	4	18	42	2	13	90	90	85	125	0	100	1	3	3	0	1	2	52
241	146	moltres	3	2	18	42	2	103	90	100	90	125	0	90	1	3	3	0	1	2	52
242	147	dratini	1	16	52	26	2	117	41	64	45	50	0	50	1	45	3	50	1	8	15
243	148	dragonair	1	16	52	26	2	117	61	84	65	70	0	70	1	45	3	50	1	8	15
244	149	dragonite	1	16	18	38	2	118	91	134	95	100	0	80	1	45	3	50	1	8	15
245	152	chikorita	1	1	52	1	2	94	45	49	65	49	65	45	5	45	1	87.5	6	1	11
246	153	bayleef	1	1	52	1	2	94	60	62	80	63	80	60	5	45	1	87.5	6	1	11
247	154	meganium	1	1	52	1	2	94	80	82	100	83	100	80	5	45	1	87.5	6	1	11
248	155	cyndaquil	1	2	52	5	2	55	39	52	43	60	50	65	5	45	1	87.5	6	4	52
249	156	quilava	1	2	52	5	2	55	58	64	58	80	65	80	5	45	1	87.5	6	4	52
250	157	typhlosion	1	2	52	5	2	55	78	84	78	109	85	100	5	45	1	87.5	6	4	52
251	158	totodile	1	3	52	9	2	22	50	65	64	44	48	43	5	45	1	87.5	6	1	8
252	159	croconaw	1	3	52	9	2	22	65	80	80	59	63	58	5	45	1	87.5	6	1	8
253	160	feraligatr	1	3	52	9	2	22	85	105	100	79	83	78	5	45	1	87.5	6	1	8
254	161	sentret	1	8	52	36	71	59	35	46	34	35	45	20	5	255	2	50	6	4	52
255	162	furret	1	8	52	36	71	59	85	76	64	45	55	90	5	90	2	50	6	4	52
256	163	hoothoot	1	8	18	44	71	28	60	30	30	36	56	50	5	255	2	50	6	10	52
257	164	noctowl	1	8	18	44	71	28	100	50	50	86	96	70	5	90	2	50	6	10	52
258	165	ledyba	1	6	18	30	96	12	40	20	30	40	80	55	5	255	4	50	6	5	52
259	166	ledian	1	6	18	30	96	23	55	35	50	55	110	85	5	90	4	50	6	5	52
260	167	spinarak	1	6	5	30	44	31	40	60	40	40	40	30	5	255	4	50	6	5	52
261	168	ariados	1	6	5	30	44	31	70	90	70	60	70	40	5	90	4	50	6	5	52
262	170	chinchou	1	3	4	111	99	108	75	38	38	56	56	67	5	190	3	50	6	13	52
263	171	lanturn	1	3	4	111	99	108	125	58	58	76	76	67	5	75	3	50	6	13	52
264	175	togepi	1	11	52	21	93	119	35	20	65	40	65	20	5	190	4	87.5	6	2	52
265	176	togetic	1	11	18	21	93	119	55	40	85	80	105	40	5	75	4	87.5	6	10	9
266	177	natu	1	10	18	41	96	51	40	50	45	70	45	70	5	190	2	50	6	10	52
267	178	xatu	1	10	18	41	96	51	65	75	70	95	70	95	5	75	2	50	6	10	52
278	179	mareep	1	4	52	13	2	16	55	40	40	65	45	35	5	235	1	50	6	1	4
279	180	flaaffy	1	4	52	13	2	16	70	55	55	80	60	45	5	120	1	50	6	1	4
280	181	ampharos	1	4	52	13	2	16	90	75	85	115	90	55	5	45	1	50	6	1	4
283	183	marill	1	3	11	4	120	121	70	20	50	20	50	40	5	190	4	50	6	8	9
284	184	azumarill	1	3	11	4	120	121	100	50	80	60	80	50	5	75	4	50	6	8	9
285	185	sudowoodo	1	15	52	46	86	12	70	110	115	30	65	30	5	65	2	50	6	6	52
286	186	politoed	1	3	52	108	65	122	90	75	75	90	100	70	5	45	1	50	6	8	52
287	187	hoppip	1	1	18	3	94	60	35	35	40	35	55	50	5	255	1	50	6	9	11
288	188	skiploom	1	1	18	3	94	60	55	45	50	45	65	80	5	120	1	50	6	9	11
289	189	jumpluff	1	1	18	3	94	60	75	55	70	55	95	110	5	45	1	50	6	9	11
290	190	aipom	1	8	52	36	79	123	55	70	55	40	55	85	5	45	4	50	6	4	52
291	191	sunkern	1	1	52	3	6	96	30	30	30	30	30	30	5	235	1	50	6	11	52
292	192	sunflora	1	1	52	3	6	96	75	75	55	105	85	30	5	120	1	50	6	11	52
293	193	yanma	1	6	18	124	27	59	65	65	45	75	45	95	5	75	2	50	6	5	52
294	194	wooper	1	3	13	65	108	54	55	45	45	25	25	15	5	255	2	50	6	8	4
295	195	quagsire	1	3	13	65	108	54	95	85	85	65	65	35	5	90	2	50	6	8	4
296	196	espeon	1	10	52	41	2	51	65	65	60	130	95	110	5	45	2	87.5	6	4	52
297	197	umbreon	1	14	52	41	2	38	95	65	110	60	130	65	5	45	2	87.5	6	4	52
298	198	murkrow	1	14	18	44	119	125	60	85	42	85	42	91	5	30	1	50	6	10	52
299	199	slowking	1	3	10	90	89	95	95	75	80	100	110	30	5	70	2	50	6	1	8
324	200	misdreavus	1	17	52	91	2	2	60	60	60	85	85	85	5	45	4	50	6	12	52
325	201	unown	1	10	52	91	2	2	48	72	48	72	48	48	5	225	2	0	6	2	52
326	202	wobbuffet	1	10	52	126	2	127	190	33	58	33	58	33	5	45	2	50	6	12	52
327	203	girafarig	1	8	10	38	96	121	70	80	65	90	65	85	5	60	2	50	6	4	52
328	204	pineco	1	6	52	46	2	128	50	65	90	35	35	15	5	190	2	50	6	5	52
329	205	forretress	1	6	7	46	2	128	75	90	140	60	60	40	5	75	2	50	6	5	52
330	206	dunsparce	1	8	52	93	36	12	100	70	70	65	65	45	5	190	2	50	6	4	52
331	207	gligar	1	13	18	104	67	116	65	75	105	35	65	85	5	60	1	50	6	5	52
332	208	steelix	1	7	13	86	46	22	75	85	200	55	65	30	5	25	2	50	6	6	52
333	209	snubbull	1	11	52	24	36	12	60	80	50	40	40	30	5	190	4	25	6	4	9
334	210	granbull	1	11	52	24	112	12	90	120	75	60	60	45	5	75	4	25	6	4	9
335	211	qwilfish	1	3	5	19	84	24	65	95	85	55	55	85	5	45	2	50	6	13	52
336	212	scizor	1	6	7	30	17	129	70	130	100	55	80	65	5	25	2	50	6	5	52
337	213	shuckle	1	6	15	46	74	130	20	10	230	10	230	5	5	190	1	50	6	5	52
338	214	heracross	1	6	9	30	25	106	80	125	75	40	95	85	5	45	3	50	6	5	52
339	215	sneasel	1	14	12	38	71	131	55	95	55	35	75	115	5	60	1	50	6	4	52
340	216	teddiursa	1	8	52	79	112	132	60	80	50	50	50	40	5	120	2	50	6	4	52
341	217	ursaring	1	8	52	25	112	40	90	130	75	75	75	55	5	60	2	50	6	4	52
342	218	slugma	1	2	52	133	103	115	40	40	40	70	40	20	5	190	2	50	6	12	52
343	219	magcargo	1	2	15	133	103	115	60	50	120	90	80	30	5	75	2	50	6	12	52
344	220	swinub	1	12	13	90	56	4	50	50	40	30	30	50	5	225	3	50	6	4	52
345	221	piloswine	1	12	13	90	56	4	100	100	80	60	60	50	5	75	3	50	6	4	52
346	222	corsola	1	3	15	21	92	95	65	55	95	65	95	35	5	60	4	25	6	8	14
347	223	remoraid	1	3	52	21	31	134	35	65	35	65	35	65	5	190	2	50	6	8	13
348	224	octillery	1	3	52	135	31	134	75	105	75	105	75	45	5	75	2	50	6	8	13
349	225	delibird	1	12	18	102	2	44	45	55	45	65	45	75	5	45	4	50	6	8	4
350	226	mantine	1	3	18	84	108	98	85	40	70	80	140	70	5	25	3	50	6	8	52
351	227	skarmory	1	7	18	71	46	115	65	80	140	40	70	70	5	25	3	50	6	10	52
352	228	houndour	1	14	2	96	55	40	45	60	30	80	50	65	5	120	3	50	6	4	52
353	229	houndoom	1	14	2	96	55	40	75	90	50	110	80	95	5	45	3	50	6	4	52
354	230	kingdra	1	3	16	84	31	65	75	95	95	95	95	85	5	45	2	50	6	8	15
355	231	phanpy	1	13	52	79	2	67	90	60	60	40	40	40	5	120	2	50	6	4	52
356	232	donphan	1	13	52	46	2	67	90	120	120	60	60	50	5	60	2	50	6	4	52
357	233	porygon2	1	8	52	113	114	47	85	80	90	105	95	60	5	45	2	0	6	6	52
358	234	stantler	1	8	52	24	59	121	73	95	62	85	65	85	5	45	3	50	6	4	52
359	235	smeargle	1	8	52	89	17	134	55	20	35	20	45	75	5	45	4	50	6	4	52
360	236	tyrogue	1	9	52	25	43	102	35	35	35	35	35	35	5	75	2	100	6	2	52
361	237	hitmontop	1	9	52	24	17	43	50	95	95	35	110	70	5	45	2	100	6	3	52
362	238	smoochum	1	12	10	90	101	37	45	30	15	85	65	65	5	45	2	0	6	2	52
363	239	elekid	1	4	52	13	2	102	45	63	37	65	55	95	5	45	2	75	6	2	52
364	240	magby	1	2	52	103	2	102	45	75	37	70	55	83	5	45	2	75	6	2	52
365	241	miltank	1	8	52	4	97	121	95	80	105	40	70	100	5	45	3	0	6	4	52
366	242	blissey	1	8	52	92	93	63	255	10	10	75	135	55	5	30	4	0	6	9	52
367	243	raikou	3	4	52	42	2	2	90	85	75	115	100	115	5	3	3	0	6	2	52
368	244	entei	3	2	52	42	2	38	115	115	85	90	75	100	5	3	3	0	6	2	52
369	245	suicune	3	3	52	42	2	38	100	75	115	90	115	85	5	3	3	0	6	2	52
370	246	larvitar	1	15	13	25	2	67	50	64	50	45	50	41	5	45	3	50	6	1	52
371	247	pupitar	1	15	13	26	2	2	70	84	70	65	70	51	5	45	3	50	6	1	52
372	248	tyranitar	1	15	14	136	2	40	100	134	110	95	100	61	5	45	3	50	6	1	52
373	249	lugia	4	10	18	42	2	118	106	90	130	90	154	110	5	3	3	0	6	2	52
374	250	ho-oh	4	2	18	42	2	95	106	130	90	110	154	90	5	3	3	0	6	2	52
375	251	celebi	2	10	1	92	2	2	100	100	100	100	100	100	5	45	1	0	6	2	52
380	252	treecko	1	1	52	1	2	88	40	45	35	65	55	70	7	45	1	87.5	8	1	15
381	253	grovyle	1	1	52	1	2	88	50	65	45	85	65	95	7	45	1	87.5	8	1	15
382	254	sceptile	1	1	52	1	2	88	70	85	65	105	85	120	7	45	1	87.5	8	1	15
383	255	torchic	1	2	52	5	2	124	45	60	40	70	50	45	7	45	1	87.5	8	4	52
384	256	combusken	1	2	9	5	2	124	60	85	60	85	60	55	7	45	1	87.5	8	4	52
385	257	blaziken	1	2	9	5	2	124	80	120	70	110	70	80	7	45	1	87.5	8	4	52
386	258	mudkip	1	3	52	9	2	65	50	70	50	50	50	40	7	45	1	87.5	8	1	8
387	259	marshtomp	1	3	13	9	2	65	70	85	70	60	70	50	7	45	1	87.5	8	1	8
388	260	swampert	1	3	13	9	2	65	100	110	90	85	90	60	7	45	1	87.5	8	1	8
389	261	poochyena	1	14	52	36	112	12	35	55	35	30	30	35	7	255	2	50	8	4	52
390	262	mightyena	1	14	52	24	112	106	70	90	70	60	60	70	7	127	2	50	8	4	52
391	263	zigzagoon	1	8	52	79	74	112	38	30	41	30	41	60	7	255	2	50	8	4	52
392	264	linoone	1	8	52	79	74	112	78	70	61	50	61	100	7	90	2	50	8	4	52
393	265	wurmple	1	6	52	35	2	36	45	45	35	20	30	20	7	255	2	50	8	5	52
394	266	silcoon	1	6	52	26	2	2	50	35	55	25	25	15	7	120	2	50	8	5	52
395	267	beautifly	1	6	18	30	2	20	60	70	50	100	50	65	7	45	2	50	8	5	52
396	268	cascoon	1	6	52	26	2	2	50	35	55	25	25	15	7	120	2	50	8	5	52
397	269	dustox	1	6	5	35	2	27	60	50	70	50	90	65	7	45	2	50	8	5	52
398	270	lotad	1	3	1	84	10	89	40	30	30	40	50	30	7	255	1	50	8	8	11
399	271	lombre	1	3	1	84	10	89	60	50	50	60	70	50	7	120	1	50	8	8	11
400	272	ludicolo	1	3	1	84	10	89	80	70	70	90	100	70	7	45	1	50	8	8	11
401	273	seedot	1	1	52	3	96	131	40	40	50	30	30	30	7	255	1	50	8	4	11
402	274	nuzleaf	1	1	14	3	96	131	70	70	40	60	40	60	7	120	1	50	8	4	11
403	275	shiftry	1	1	14	3	96	131	90	100	60	90	60	80	7	45	1	50	8	9	11
404	276	taillow	1	8	18	25	2	97	40	55	30	30	30	85	7	200	1	50	8	10	52
405	277	swellow	1	8	18	25	2	97	60	85	60	75	50	125	7	45	1	50	8	10	52
406	278	wingull	1	3	18	71	37	10	40	30	30	55	30	85	7	190	2	50	8	8	10
407	279	pelipper	1	3	18	71	122	10	60	50	100	95	70	65	7	45	2	50	8	8	10
408	280	ralts	1	10	11	41	113	127	28	25	25	45	35	40	7	235	3	50	8	3	12
409	281	kirlia	1	10	11	41	113	127	38	35	35	65	55	50	7	120	3	50	8	3	12
410	282	gardevoir	1	10	11	41	113	127	68	65	65	125	115	80	7	45	3	50	8	3	12
411	283	surskit	1	6	3	84	2	10	40	30	32	50	52	65	7	200	2	50	8	8	5
412	284	masquerain	1	6	18	24	2	40	70	60	62	100	82	80	7	75	2	50	8	8	5
413	285	shroomish	1	1	52	62	137	112	60	40	60	40	60	35	7	255	5	50	8	9	11
414	286	breloom	1	1	9	62	137	17	60	130	80	60	60	70	7	90	5	50	8	9	11
415	287	slakoth	1	8	52	138	2	2	60	60	60	35	35	30	7	255	3	50	8	4	52
416	288	vigoroth	1	8	52	102	2	2	80	80	80	55	55	90	7	120	3	50	8	4	52
417	289	slaking	1	8	52	138	2	2	150	160	100	95	65	100	7	45	3	50	8	4	52
418	290	nincada	1	6	13	27	2	36	31	45	90	30	30	40	7	255	6	50	8	5	52
419	291	ninjask	1	6	18	124	2	60	61	90	45	50	50	160	7	120	6	50	8	5	52
420	292	shedinja	1	6	17	139	2	2	1	90	45	30	30	40	7	45	6	0	8	6	52
421	293	whismur	1	8	52	48	2	12	64	51	23	51	23	28	7	190	1	50	8	1	4
422	294	loudred	1	8	52	48	2	97	84	71	43	71	43	48	7	120	1	50	8	1	4
423	295	exploud	1	8	52	48	2	97	104	91	63	91	73	68	7	45	1	50	8	1	4
424	296	makuhita	1	9	52	4	25	22	72	60	30	20	30	25	7	180	5	75	8	3	52
425	297	hariyama	1	9	52	4	25	22	144	120	60	40	60	50	7	200	5	75	8	3	52
426	298	azurill	1	8	11	4	120	121	50	20	40	20	40	20	7	150	4	25	8	2	52
427	299	nosepass	1	15	52	46	45	69	30	45	135	45	90	30	7	255	2	50	8	6	52
428	300	skitty	1	8	52	50	140	66	50	45	45	35	35	50	7	255	4	25	8	4	9
429	301	delcatty	1	8	52	50	140	66	70	65	65	55	55	90	7	60	4	25	8	4	9
430	302	sableye	1	14	17	71	141	125	50	75	75	65	65	50	7	45	1	50	8	3	52
431	303	mawile	1	7	11	104	24	22	50	85	85	55	55	50	7	45	4	50	8	4	9
432	304	aron	1	7	15	46	86	142	50	70	100	40	40	30	7	180	3	50	8	1	52
433	305	lairon	1	7	15	46	86	142	60	90	140	50	50	40	7	90	3	50	8	1	52
434	306	aggron	1	7	15	46	86	142	70	110	180	60	60	50	7	45	3	50	8	1	52
435	307	meditite	1	9	10	143	2	127	30	40	55	40	55	60	7	180	2	50	8	3	52
436	308	medicham	1	9	10	143	2	127	60	60	75	60	75	80	7	90	2	50	8	3	52
437	309	electrike	1	4	52	13	75	18	40	45	40	65	40	65	7	120	3	50	8	4	52
438	310	manectric	1	4	52	13	75	18	70	75	60	105	60	105	7	45	3	50	8	4	52
439	311	plusle	1	4	52	16	2	75	60	50	40	85	75	95	7	200	2	50	8	9	52
440	312	minun	1	4	52	18	2	111	60	40	50	75	85	95	7	200	2	50	8	9	52
441	313	volbeat	1	6	52	99	30	125	65	73	75	47	85	85	7	150	6	100	8	5	3
442	314	illumise	1	6	52	90	28	125	65	47	75	73	85	85	7	150	5	0	8	5	3
443	315	roselia	1	1	5	92	19	94	50	60	45	100	80	65	7	150	1	50	8	9	11
444	316	gulpin	1	5	52	144	145	74	70	43	53	43	53	40	7	225	5	50	8	12	52
445	317	swalot	1	5	52	144	145	74	100	73	83	73	83	55	7	75	5	50	8	12	52
446	318	carvanha	1	3	14	146	2	124	45	90	20	65	20	65	7	225	3	50	8	13	52
447	319	sharpedo	1	3	14	146	2	124	70	120	40	95	40	95	7	60	3	50	8	13	52
448	320	wailmer	1	3	52	98	90	42	130	70	35	70	35	60	7	125	5	50	8	4	13
449	321	wailord	1	3	52	98	90	42	170	90	45	90	45	60	7	60	5	50	8	4	13
450	322	numel	1	2	13	90	147	89	60	60	40	65	45	35	7	255	2	50	8	4	52
451	323	camerupt	1	2	13	133	148	107	70	100	70	105	75	40	7	150	2	50	8	4	52
452	324	torkoal	1	2	52	149	8	109	70	85	140	85	70	20	7	90	2	50	8	4	52
453	325	spoink	1	10	52	4	89	74	60	25	35	70	80	60	7	255	4	50	8	4	52
454	326	grumpig	1	10	52	4	89	74	80	45	65	90	110	80	7	60	4	50	8	4	52
455	327	spinda	1	8	52	89	72	130	60	60	60	60	60	60	7	255	4	50	8	4	3
456	328	trapinch	1	13	52	104	68	22	45	100	45	45	45	10	7	255	1	50	8	5	15
457	329	vibrava	1	13	16	91	2	2	50	70	50	50	50	70	7	120	1	50	8	5	15
458	330	flygon	1	13	16	91	2	2	80	100	80	80	80	100	7	45	1	50	8	5	15
459	331	cacnea	1	1	52	67	2	108	50	85	40	85	40	35	7	190	1	50	8	11	3
460	332	cacturne	1	1	14	67	2	108	70	115	60	115	60	55	7	60	1	50	8	11	3
461	333	swablu	1	8	18	92	2	83	45	40	60	40	75	50	7	255	6	50	8	10	15
462	334	altaria	1	16	18	92	2	83	75	70	90	70	105	80	7	45	6	50	8	10	15
463	335	zangoose	1	8	52	116	2	150	73	115	60	60	60	90	7	90	6	50	8	4	52
464	336	seviper	1	5	52	26	2	60	73	100	60	100	60	65	7	90	5	50	8	4	15
465	337	lunatone	1	15	10	91	2	2	90	55	65	95	85	70	7	45	4	0	8	6	52
466	338	solrock	1	15	10	91	2	2	90	95	85	55	65	70	7	45	4	0	8	6	52
467	339	barboach	1	3	13	90	110	37	50	48	43	46	41	60	7	190	2	50	8	13	52
468	340	whiscash	1	3	13	90	110	37	110	78	73	76	71	60	7	75	2	50	8	13	52
469	341	corphish	1	3	52	104	109	32	43	80	65	50	35	35	7	205	5	50	8	8	14
470	342	crawdaunt	1	3	14	104	109	32	63	120	85	90	55	55	7	155	5	50	8	8	14
471	343	baltoy	1	13	10	91	2	2	40	40	55	40	70	55	7	255	2	0	8	6	52
472	344	claydol	1	13	10	91	2	2	60	70	105	70	120	75	7	90	2	0	8	6	52
473	345	lileep	1	15	1	135	2	151	66	41	77	61	87	23	7	45	6	87.5	8	14	52
474	346	cradily	1	15	1	135	2	151	86	81	97	81	107	43	7	45	6	87.5	8	14	52
475	347	anorith	1	15	6	80	2	84	45	95	50	40	50	75	7	45	6	87.5	8	14	52
476	348	armaldo	1	15	6	80	2	84	75	125	100	70	80	45	7	45	6	87.5	8	14	52
477	349	feebas	1	3	52	84	90	32	20	15	20	10	55	80	7	255	6	50	8	8	15
478	350	milotic	1	3	52	117	58	50	95	60	79	100	125	81	7	60	6	50	8	8	15
479	351	castform	1	8	52	152	2	2	70	70	70	70	70	70	7	45	2	50	8	9	12
480	352	kecleon	1	8	52	153	2	154	60	90	70	60	120	40	7	200	1	50	8	4	52
481	353	shuppet	1	17	52	44	59	155	44	75	35	63	33	45	7	225	4	50	8	12	52
482	354	banette	1	17	52	44	59	155	64	115	65	83	63	65	7	45	4	50	8	12	52
483	355	duskull	1	17	52	91	2	59	20	40	90	30	90	25	7	190	4	50	8	12	52
484	356	dusclops	1	17	52	42	2	59	40	70	130	60	130	25	7	90	4	50	8	12	52
485	357	tropius	1	1	18	3	6	85	99	68	83	72	87	51	7	200	3	50	8	1	11
486	358	chimecho	1	10	52	91	2	2	75	50	80	95	90	65	7	45	4	50	8	12	52
487	359	absol	1	14	52	42	119	156	65	130	60	75	60	75	7	30	1	50	8	4	52
488	360	wynaut	1	10	52	126	2	127	95	23	48	23	48	23	7	125	2	50	8	2	52
489	361	snorunt	1	12	52	38	157	134	50	50	50	50	50	50	7	190	2	50	8	9	6
490	362	glalie	1	12	52	38	157	134	80	80	80	80	80	80	7	75	2	50	8	9	6
491	363	spheal	1	12	3	4	157	90	70	40	50	55	50	25	7	255	1	50	8	8	4
492	364	sealeo	1	12	3	4	157	90	90	60	70	75	70	45	7	120	1	50	8	8	4
493	365	walrein	1	12	3	4	157	90	110	80	90	95	90	65	7	45	1	50	8	8	4
494	366	clamperl	1	3	52	109	2	12	35	64	85	74	55	32	7	255	6	50	8	8	52
495	367	huntail	1	3	52	84	2	98	55	104	105	94	75	52	7	60	6	50	8	8	52
496	368	gorebyss	1	3	52	84	2	37	55	84	105	114	75	52	7	60	6	50	8	8	52
497	369	relicanth	1	3	15	84	86	46	100	90	130	45	65	55	7	25	3	87.5	8	8	13
498	370	luvdisc	1	3	52	84	2	37	43	30	55	40	65	97	7	225	4	25	8	13	52
499	371	bagon	1	16	52	86	2	22	45	75	60	40	30	50	7	45	3	50	8	15	52
500	372	shelgon	1	16	52	86	2	128	65	95	100	60	50	50	7	45	3	50	8	15	52
501	373	salamence	1	16	18	24	2	106	95	135	80	110	80	100	7	45	3	50	8	15	52
502	374	beldum	1	7	10	158	2	129	40	55	80	35	60	30	7	3	3	100	8	6	52
503	375	metang	1	7	10	158	2	129	60	75	100	55	80	50	7	3	3	100	8	6	52
504	376	metagross	1	7	10	158	2	129	80	135	130	95	90	70	7	3	3	100	8	6	52
505	377	regirock	3	15	52	158	2	46	80	100	200	50	100	50	7	3	3	0	8	2	52
506	378	regice	3	12	52	158	2	157	80	50	100	100	200	50	7	3	3	0	8	2	52
507	379	registeel	3	7	52	158	2	129	80	75	150	75	150	50	7	3	3	0	8	2	52
508	380	latias	3	16	10	91	2	2	80	80	90	110	130	110	7	3	3	0	8	2	52
509	381	latios	3	16	10	91	2	2	80	90	80	130	110	110	7	3	3	100	8	2	52
510	382	kyogre	4	3	52	122	2	2	100	100	90	150	140	90	7	3	3	0	8	2	52
511	383	groudon	4	13	52	8	2	2	100	150	140	100	90	90	7	3	3	0	8	2	52
512	384	rayquaza	4	16	18	159	2	2	105	150	90	150	90	95	7	45	3	0	8	2	52
513	385	jirachi	2	7	10	93	2	2	100	100	100	100	100	100	7	3	3	0	8	2	52
514	386	deoxys	2	10	52	42	2	2	50	150	50	150	50	150	7	3	3	0	8	2	52
591	387	turtwig	1	1	52	1	2	109	55	68	64	45	55	31	4	45	1	87.5	4	1	11
592	388	grotle	1	1	52	1	2	109	75	89	85	55	65	36	4	45	1	87.5	4	1	11
593	389	torterra	1	1	13	1	2	109	95	109	105	75	85	56	4	45	1	87.5	4	1	11
594	393	piplup	1	3	52	9	2	160	53	51	53	61	56	40	4	45	1	87.5	4	8	4
595	394	prinplup	1	3	52	9	2	160	64	66	68	81	76	50	4	45	1	87.5	4	8	4
596	395	empoleon	1	3	7	9	2	160	84	86	88	111	101	60	4	45	1	87.5	4	8	4
597	396	starly	1	8	18	71	2	87	40	55	30	30	30	60	4	255	1	50	4	10	52
598	397	staravia	1	8	18	24	2	87	55	75	50	40	40	80	4	120	1	50	4	10	52
599	398	staraptor	1	8	18	24	2	87	85	120	70	50	60	100	4	45	1	50	4	10	52
600	399	bidoof	1	8	52	147	54	134	59	45	40	35	40	31	4	255	2	50	4	8	4
601	400	bibarel	1	8	3	147	54	134	79	85	60	55	60	71	4	127	2	50	4	8	4
602	401	kricketot	1	6	52	26	2	36	37	25	41	25	41	25	4	255	1	50	4	5	52
603	402	kricketune	1	6	52	30	2	17	77	85	51	55	51	65	4	45	1	50	4	5	52
604	406	budew	1	1	5	92	19	94	40	30	35	50	70	55	4	255	1	50	4	2	52
605	407	roserade	1	1	5	92	19	17	60	70	65	125	105	90	4	75	1	50	4	9	11
606	408	cranidos	1	15	52	105	2	22	67	125	40	30	30	58	4	45	6	87.5	4	1	52
607	409	rampardos	1	15	52	105	2	22	97	165	60	65	50	58	4	45	6	87.5	4	1	52
608	410	shieldon	1	15	7	46	2	48	30	42	118	42	88	30	4	45	6	87.5	4	1	52
609	411	bastiodon	1	15	7	46	2	48	60	52	168	47	138	30	4	45	6	87.5	4	1	52
610	412	burmy	1	6	52	26	2	128	40	29	45	29	45	36	4	120	2	50	4	5	52
611	413	wormadam	1	6	1	110	2	128	60	59	85	79	105	36	4	45	2	0	4	5	52
612	414	mothim	1	6	18	30	2	28	70	94	50	94	50	66	4	45	2	100	4	5	52
613	415	combee	1	6	18	132	2	21	30	30	42	30	42	70	4	120	1	87.5	4	5	52
614	416	vespiquen	1	6	18	42	2	40	70	80	102	80	102	40	4	45	1	0	4	5	52
615	417	pachirisu	1	4	52	36	79	111	60	45	70	45	90	95	4	200	2	50	4	4	9
616	418	buizel	1	3	52	84	2	98	55	65	35	60	30	85	4	190	2	50	4	8	4
617	419	floatzel	1	3	52	84	2	98	85	105	55	85	50	115	4	75	2	50	4	8	4
618	420	cherubi	1	1	52	3	2	2	45	35	45	62	53	35	4	190	2	50	4	9	11
619	421	cherrim	1	1	52	161	2	2	70	60	70	87	78	85	4	75	2	50	4	9	11
620	422	shellos	1	3	52	145	151	69	76	48	48	57	62	34	4	190	2	50	4	8	12
621	423	gastrodon	1	3	13	145	151	69	111	83	68	92	82	39	4	75	2	50	4	8	12
622	424	ambipom	1	8	52	17	79	123	75	100	66	60	66	115	4	45	4	50	4	4	52
623	425	drifloon	1	17	18	49	88	162	90	50	34	60	44	70	4	125	5	50	4	12	52
624	426	drifblim	1	17	18	49	88	162	150	80	44	90	54	80	4	60	5	50	4	12	52
625	427	buneary	1	8	52	36	14	33	55	66	44	44	56	85	4	190	2	50	4	4	3
626	428	lopunny	1	8	52	50	14	33	65	76	84	54	96	105	4	60	2	50	4	4	3
627	429	mismagius	1	17	52	91	2	2	60	60	60	105	105	105	4	45	4	50	4	12	52
628	430	honchkrow	1	14	18	44	119	106	100	125	52	105	52	71	4	30	1	50	4	10	52
629	431	glameow	1	8	52	33	89	71	49	55	42	42	37	85	4	190	4	25	4	4	52
630	432	purugly	1	8	52	4	89	160	71	82	64	64	59	112	4	75	4	25	4	4	52
631	433	chingling	1	10	52	91	2	2	45	30	50	65	50	45	4	120	4	50	4	2	52
632	434	stunky	1	5	14	61	49	71	63	63	47	41	41	74	4	225	2	50	4	4	52
633	435	skuntank	1	5	14	61	49	71	103	93	67	71	61	84	4	60	2	50	4	4	52
634	436	bronzor	1	7	10	91	163	142	57	24	86	24	86	23	4	255	2	0	4	6	52
635	437	bronzong	1	7	10	91	163	142	67	89	116	79	116	33	4	90	2	0	4	6	52
636	438	bonsly	1	15	52	46	86	12	50	80	95	10	45	10	4	255	2	50	4	2	52
637	439	mime jr.	1	10	11	48	100	17	20	25	45	70	90	60	4	145	2	50	4	2	52
638	440	happiny	1	8	52	92	93	52	100	5	5	15	65	30	4	130	4	0	4	2	52
639	441	chatot	1	8	18	71	72	73	76	65	45	92	42	91	4	30	1	50	4	10	52
640	442	spiritomb	1	17	14	42	2	60	50	92	108	92	108	35	4	100	2	50	4	12	52
641	443	gible	1	16	13	67	2	146	58	70	45	40	45	42	4	45	3	50	4	1	15
642	444	gabite	1	16	13	67	2	146	68	90	65	50	55	82	4	45	3	50	4	1	15
643	445	garchomp	1	16	13	67	2	146	108	130	95	80	85	102	4	45	3	50	4	1	15
644	446	munchlax	1	8	52	79	4	74	135	85	40	40	85	5	4	50	3	87.5	4	2	52
645	447	riolu	1	9	52	43	38	125	40	70	40	35	40	60	4	75	1	87.5	4	2	52
646	448	lucario	1	9	7	43	38	156	70	110	70	115	70	90	4	45	1	87.5	4	4	3
647	449	hippopotas	1	13	52	136	2	69	68	72	78	38	42	32	4	140	3	50	4	4	52
648	450	hippowdon	1	13	52	136	2	69	108	112	118	68	72	47	4	60	3	50	4	4	52
649	451	skorupi	1	5	6	80	31	71	40	50	90	30	55	65	4	120	3	50	4	5	14
650	452	drapion	1	5	14	80	31	71	70	90	110	60	75	95	4	45	3	50	4	5	14
651	453	croagunk	1	5	9	110	64	164	48	61	40	61	40	50	4	140	2	50	4	3	52
652	454	toxicroak	1	5	9	110	64	164	83	106	65	86	65	85	4	75	2	50	4	3	52
653	455	carnivine	1	1	52	91	2	2	74	100	72	90	72	46	4	200	3	50	4	11	52
654	456	finneon	1	3	52	84	151	98	49	49	56	49	61	66	4	190	6	50	4	13	52
655	457	lumineon	1	3	52	84	151	98	69	69	76	69	86	91	4	75	6	50	4	13	52
656	458	mantyke	1	3	18	84	108	98	45	20	50	60	120	50	4	25	3	50	4	2	52
657	459	snover	1	1	12	57	2	48	60	62	50	62	60	40	4	120	3	50	4	1	11
658	460	abomasnow	1	1	12	57	2	48	90	92	75	92	85	60	4	60	3	50	4	1	11
683	461	weavile	1	14	12	42	2	131	70	120	65	45	85	125	4	45	1	50	4	4	52
684	462	magnezone	1	4	7	45	46	47	70	70	115	130	90	60	4	30	2	0	4	6	52
685	463	lickilicky	1	8	52	89	90	83	110	85	95	80	95	50	4	30	2	50	4	1	52
686	464	rhyperior	1	13	15	75	148	87	115	140	130	55	55	40	4	30	3	50	4	1	4
687	465	tangrowth	1	1	52	3	94	95	100	100	125	110	50	50	4	30	2	50	4	11	52
688	466	electivire	1	4	52	165	2	102	75	123	67	95	85	95	4	30	2	75	4	3	52
699	467	magmortar	1	2	52	103	2	102	75	95	67	125	95	83	4	30	2	75	4	3	52
713	468	togekiss	1	11	18	21	93	119	85	50	95	120	115	80	4	30	4	87.5	4	10	9
714	469	yanmega	1	6	18	124	28	59	86	76	86	116	56	95	4	30	2	50	4	5	52
715	470	leafeon	1	1	52	94	2	3	65	110	130	60	65	95	4	45	2	87.5	4	4	52
716	471	glaceon	1	12	52	56	2	157	65	60	110	130	95	65	4	45	2	87.5	4	4	52
717	472	gliscor	1	13	18	104	67	137	75	95	125	45	75	95	4	30	1	50	4	5	52
718	473	mamoswine	1	12	13	90	56	4	110	130	80	70	60	80	4	50	3	50	4	4	52
719	474	porygon-z	1	8	52	32	114	47	85	80	70	135	75	90	4	30	2	0	4	6	52
720	475	gallade	1	10	9	43	2	156	68	125	65	65	115	80	4	45	3	100	4	3	12
726	476	probopass	1	15	7	46	45	69	60	55	145	75	150	40	4	60	2	50	4	6	52
727	477	dusknoir	1	17	52	42	2	59	45	100	135	65	135	45	4	45	4	50	4	12	52
728	478	froslass	1	12	17	56	2	155	70	80	70	80	70	110	4	75	2	0	4	9	6
729	479	rotom	1	4	17	91	2	2	50	50	77	95	77	91	4	45	2	0	4	12	52
730	480	uxie	3	10	52	91	2	2	75	75	130	75	130	95	4	3	3	0	4	2	52
731	481	mesprit	3	10	52	91	2	2	80	105	105	105	105	80	4	3	3	0	4	2	52
732	482	azelf	3	10	52	91	2	2	75	125	70	125	70	115	4	3	3	0	4	2	52
733	483	dialga	4	7	16	42	2	127	100	120	120	150	100	90	4	3	3	0	4	2	52
734	484	palkia	4	3	16	42	2	127	90	120	100	150	120	100	4	3	3	0	4	2	52
735	485	heatran	3	2	7	55	2	103	91	90	106	130	106	77	4	3	3	50	4	2	52
736	486	regigigas	3	8	52	166	2	2	110	160	110	80	110	100	4	3	3	0	4	2	52
737	487	giratina	4	17	16	42	2	127	150	100	120	100	120	90	4	3	3	0	4	2	52
738	488	cresselia	3	10	52	91	2	2	120	70	120	75	130	85	4	3	3	0	4	2	52
739	491	darkrai	2	14	52	167	2	2	70	90	90	135	90	125	4	3	3	0	4	2	52
740	492	shaymin	2	1	52	92	2	2	100	100	100	100	100	100	4	45	1	0	4	2	52
741	493	arceus	2	8	52	168	2	2	120	120	120	120	120	120	4	3	3	0	4	2	52
742	494	victini	2	10	2	169	2	2	100	100	100	100	100	100	8	3	3	0	9	2	52
743	765	oranguru	1	8	10	38	127	170	90	60	80	90	110	60	6	45	3	50	7	4	52
829	495	snivy	1	1	52	1	2	130	45	45	55	45	55	63	8	45	1	87.5	9	4	11
830	496	servine	1	1	52	1	2	130	60	60	75	60	75	83	8	45	1	87.5	9	4	11
831	497	serperior	1	1	52	1	2	130	75	75	95	75	95	113	8	45	1	87.5	9	4	11
832	498	tepig	1	2	52	5	2	4	65	63	45	45	45	45	8	45	1	87.5	9	4	52
833	499	pignite	1	2	9	5	2	4	90	93	55	70	55	55	8	45	1	87.5	9	4	52
834	500	emboar	1	2	9	5	2	87	110	123	65	100	65	65	8	45	1	87.5	9	4	52
835	501	oshawott	1	3	52	9	2	109	55	55	45	63	45	45	8	45	1	87.5	9	4	52
836	502	dewott	1	3	52	9	2	109	75	75	60	83	60	60	8	45	1	87.5	9	4	52
837	503	samurott	1	3	52	9	2	109	95	100	85	108	70	70	8	45	1	87.5	9	4	52
838	504	patrat	1	8	52	36	71	47	45	55	39	35	39	42	8	255	2	50	9	4	52
839	505	watchog	1	8	52	99	71	47	60	85	69	60	69	77	8	255	2	50	9	4	52
840	506	lillipup	1	8	52	102	79	36	45	60	45	25	45	55	8	255	1	50	9	4	52
841	507	herdier	1	8	52	24	77	97	65	80	65	35	65	60	8	120	1	50	9	4	52
842	508	stoutland	1	8	52	24	77	97	85	110	90	45	90	80	8	45	1	50	9	4	52
843	509	purrloin	1	14	52	33	88	125	41	50	37	50	37	66	8	255	2	50	9	4	52
844	510	liepard	1	14	52	33	88	125	64	88	50	88	50	106	8	90	2	50	9	4	52
845	511	pansage	1	1	52	74	2	1	50	53	48	53	48	64	8	190	2	87.5	9	4	52
846	512	simisage	1	1	52	74	2	1	75	98	63	98	63	101	8	75	2	87.5	9	4	52
847	513	pansear	1	2	52	74	2	5	50	53	48	53	48	64	8	190	2	87.5	9	4	52
848	514	simisear	1	2	52	74	2	5	75	98	63	98	63	101	8	75	2	87.5	9	4	52
849	515	panpour	1	3	52	74	2	9	50	53	48	53	48	64	8	190	2	87.5	9	4	52
850	516	simipour	1	3	52	74	2	9	75	98	63	98	63	101	8	75	2	87.5	9	4	52
851	517	munna	1	10	52	101	41	127	76	25	45	67	55	24	8	190	4	50	9	4	52
852	518	musharna	1	10	52	101	41	127	116	55	85	107	95	29	8	75	4	50	9	4	52
853	519	pidove	1	8	18	73	119	20	50	55	50	36	30	43	8	255	1	50	9	10	52
854	520	tranquill	1	8	18	73	119	20	62	77	62	50	42	65	8	120	1	50	9	10	52
855	521	unfezant	1	8	18	73	119	20	80	115	80	65	55	93	8	45	1	50	9	10	52
856	522	blitzle	1	4	52	75	165	121	45	60	32	50	32	76	8	190	2	50	9	4	52
857	523	zebstrika	1	4	52	75	165	121	75	100	63	80	63	116	8	75	2	50	9	4	52
858	524	roggenrola	1	15	52	46	115	69	55	75	85	25	25	15	8	255	1	50	9	6	52
859	525	boldore	1	15	52	46	115	69	70	105	105	50	40	20	8	120	1	50	9	6	52
860	526	gigalith	1	15	52	46	136	69	85	135	130	60	80	25	8	45	1	50	9	6	52
861	527	woobat	1	10	18	54	14	147	65	45	43	55	43	72	8	190	2	50	9	4	10
862	528	swoobat	1	10	18	54	14	147	67	57	55	77	55	114	8	45	2	50	9	4	10
863	529	drilbur	1	13	52	77	69	105	60	85	40	30	45	68	8	120	2	50	9	4	52
864	530	excadrill	1	13	7	77	69	105	110	135	60	50	65	88	8	60	2	50	9	4	52
865	531	audino	1	8	52	63	95	14	103	60	86	60	86	50	8	255	4	50	9	9	52
866	532	timburr	1	9	52	25	22	23	75	80	55	25	35	35	8	180	1	75	9	3	52
867	533	gurdurr	1	9	52	25	22	23	85	105	85	40	50	40	8	90	1	75	9	3	52
868	534	conkeldurr	1	9	52	25	22	23	105	140	95	55	65	45	8	45	1	75	9	3	52
869	535	tympole	1	3	52	84	37	108	50	50	40	50	40	64	8	255	1	50	9	8	52
870	536	palpitoad	1	3	13	84	37	108	75	65	55	65	55	69	8	120	1	50	9	8	52
871	537	seismitoad	1	3	13	84	164	108	105	95	75	85	75	74	8	45	1	50	9	8	52
872	538	throh	1	9	52	25	38	105	120	100	85	30	85	45	8	45	2	100	9	3	52
873	539	sawk	1	9	52	46	38	105	75	125	75	30	75	85	8	45	2	100	9	3	52
874	540	sewaddle	1	6	1	30	3	128	45	53	70	40	60	42	8	255	1	50	9	5	52
875	541	swadloon	1	6	1	94	3	128	55	63	90	50	80	42	8	120	1	50	9	5	52
876	542	leavanny	1	6	1	30	3	128	75	103	80	70	80	92	8	45	1	50	9	5	52
877	543	venipede	1	6	5	19	30	124	30	45	59	30	39	57	8	255	1	50	9	5	52
878	544	whirlipede	1	6	5	19	30	124	40	55	99	40	79	47	8	120	1	50	9	5	52
879	545	scolipede	1	6	5	19	30	124	60	100	89	55	69	112	8	45	1	50	9	5	52
880	546	cottonee	1	1	11	125	60	3	40	27	60	37	50	66	8	190	2	50	9	11	9
881	547	whimsicott	1	1	11	125	60	3	60	67	85	77	75	116	8	75	2	50	9	11	9
882	548	petilil	1	1	52	3	89	94	45	35	50	70	50	30	8	190	2	0	9	11	52
883	549	lilligant	1	1	52	3	89	94	70	60	75	110	75	90	8	75	2	0	9	11	52
884	55	golduck	1	3	52	65	83	84	80	82	78	80	0	85	1	75	2	50	1	8	4
885	550	basculin	1	3	52	87	32	105	70	92	65	80	55	98	8	25	2	50	9	13	52
886	551	sandile	1	13	14	24	106	107	50	72	35	35	35	65	8	180	1	50	9	4	52
887	552	krokorok	1	13	14	24	106	107	60	82	45	45	45	74	8	90	1	50	9	4	52
888	553	krookodile	1	13	14	24	106	107	95	117	80	65	70	92	8	45	1	50	9	4	52
889	554	darumaka	1	2	52	21	2	38	70	90	45	15	45	50	8	120	1	50	9	4	52
890	555	darmanitan	1	2	52	22	2	171	105	140	55	30	55	95	8	60	1	50	9	4	52
891	556	maractus	1	1	52	108	3	151	75	86	67	106	67	60	8	255	2	50	9	11	52
892	557	dwebble	1	6	15	46	109	115	50	65	85	35	35	55	8	190	2	50	9	5	6
893	558	crustle	1	6	15	46	109	115	70	105	125	65	75	45	8	75	2	50	9	5	6
894	559	scraggy	1	14	9	26	106	24	50	75	70	35	70	48	8	180	2	50	9	4	15
895	56	mankey	1	9	52	102	107	160	40	80	35	35	0	70	1	190	2	50	1	4	52
914	560	scrafty	1	14	9	26	106	24	65	90	115	45	115	58	8	90	2	50	9	4	15
915	561	sigilyph	1	10	18	66	53	28	72	58	80	103	80	97	8	45	2	50	9	10	52
916	562	yamask	1	17	52	172	2	2	38	30	85	55	65	30	8	190	2	50	9	6	12
917	563	cofagrigus	1	17	52	172	2	2	58	50	145	95	105	30	8	90	2	50	9	6	12
918	564	tirtouga	1	3	15	148	46	84	54	78	103	53	45	22	8	45	2	87.5	9	8	14
919	565	carracosta	1	3	15	148	46	84	74	108	133	83	65	32	8	45	2	87.5	9	8	14
920	566	archen	1	15	18	173	2	2	55	112	45	74	45	70	8	45	2	87.5	9	10	14
921	567	archeops	1	15	18	173	2	2	75	140	65	112	65	110	8	45	2	87.5	9	10	14
922	568	trubbish	1	5	52	61	145	49	50	50	62	40	62	65	8	190	2	50	9	6	52
923	569	garbodor	1	5	52	61	115	49	80	95	82	60	82	75	8	60	2	50	9	6	52
924	57	primeape	1	9	52	102	107	160	65	105	60	60	0	95	1	75	2	50	1	4	52
939	570	zorua	1	14	52	174	2	2	40	65	40	80	40	65	8	75	1	87.5	9	4	52
940	571	zoroark	1	14	52	174	2	2	60	105	60	120	60	105	8	45	1	87.5	9	4	52
941	572	minccino	1	8	52	50	17	123	55	50	40	40	40	75	8	255	4	25	9	4	52
942	573	cinccino	1	8	52	50	17	123	75	95	60	65	60	115	8	60	4	25	9	4	52
943	574	gothita	1	10	52	59	58	126	45	30	50	55	65	45	8	200	1	25	9	3	52
944	575	gothorita	1	10	52	59	58	126	60	45	70	75	85	55	8	100	1	25	9	3	52
945	576	gothitelle	1	10	52	59	58	126	70	55	95	95	110	65	8	50	1	25	9	3	52
946	577	solosis	1	10	52	128	53	95	45	30	40	105	50	20	8	200	1	50	9	12	52
947	578	duosion	1	10	52	128	53	95	65	40	50	125	60	30	8	100	1	50	9	12	52
948	579	reuniclus	1	10	52	128	53	95	110	65	75	125	85	30	8	50	1	50	9	12	52
949	58	growlithe	1	2	52	24	55	156	55	70	45	50	0	60	1	190	3	75	1	4	52
950	580	ducklett	1	3	18	71	73	37	62	44	50	44	50	55	8	190	2	50	9	8	10
951	581	swanna	1	3	18	71	73	37	75	87	63	87	63	98	8	45	2	50	9	8	10
952	582	vanillite	1	12	52	157	56	115	36	50	50	65	60	44	8	255	3	50	9	6	52
953	583	vanillish	1	12	52	157	56	115	51	65	65	80	75	59	8	120	3	50	9	6	52
954	584	vanilluxe	1	12	52	157	57	115	71	95	85	110	95	79	8	45	3	50	9	6	52
955	585	deerling	1	8	1	3	121	93	60	60	50	40	50	75	8	190	2	50	9	4	52
956	586	sawsbuck	1	8	1	3	121	93	80	100	70	60	70	95	8	75	2	50	9	4	52
957	587	emolga	1	4	18	13	2	165	55	75	60	75	60	103	8	200	2	50	9	4	52
958	588	karrablast	1	6	52	30	26	29	50	75	45	40	45	60	8	200	2	50	9	5	52
959	589	escavalier	1	6	7	30	109	128	70	135	105	60	105	20	8	75	2	50	9	5	52
960	59	arcanine	1	2	52	24	55	156	90	110	80	80	0	95	1	75	3	75	1	4	52
961	590	foongus	1	1	5	62	2	95	69	55	45	55	55	15	8	190	2	50	9	11	52
962	591	amoonguss	1	1	5	62	2	95	114	85	70	85	80	30	8	75	2	50	9	11	52
963	592	frillish	1	3	17	108	155	65	55	40	50	65	85	40	8	190	2	50	9	12	52
964	593	jellicent	1	3	17	108	155	65	100	60	70	85	105	60	8	60	2	50	9	12	52
965	594	alomomola	1	3	52	63	37	95	165	75	80	40	45	65	8	75	4	50	9	8	13
966	595	joltik	1	6	4	27	40	30	50	47	50	57	50	65	8	190	2	50	9	5	52
967	596	galvantula	1	6	4	27	40	30	70	77	60	97	60	108	8	75	2	50	9	5	52
968	597	ferroseed	1	1	7	175	2	2	44	50	91	24	86	10	8	255	2	50	9	11	6
969	598	ferrothorn	1	1	7	175	2	110	74	94	131	54	116	20	8	90	2	50	9	11	6
970	599	klink	1	7	52	16	18	158	40	55	70	45	60	30	8	130	1	0	9	6	52
971	60	poliwag	1	3	52	108	65	84	40	50	40	40	0	90	1	255	1	50	1	8	52
972	600	klang	1	7	52	16	18	158	60	80	95	70	85	50	8	60	1	0	9	6	52
973	601	klinklang	1	7	52	16	18	158	60	100	115	70	85	90	8	30	1	0	9	6	52
974	602	tynamo	1	4	52	91	2	2	35	55	40	45	40	60	8	190	3	50	9	12	52
975	603	eelektrik	1	4	52	91	2	2	65	85	70	75	70	40	8	60	3	50	9	12	52
976	604	eelektross	1	4	52	91	2	2	85	115	80	105	80	50	8	30	3	50	9	12	52
977	605	elgyem	1	10	52	127	41	47	55	55	55	85	55	30	8	255	2	50	9	3	52
978	606	beheeyem	1	10	52	127	41	47	75	75	75	125	95	40	8	90	2	50	9	3	52
979	607	litwick	1	17	2	55	103	60	50	30	55	65	55	20	8	190	1	50	9	12	52
980	608	lampent	1	17	2	55	103	60	60	40	60	95	60	55	8	90	1	50	9	12	52
981	609	chandelure	1	17	2	55	103	60	60	55	90	145	90	80	8	45	1	50	9	12	52
982	61	poliwhirl	1	3	52	108	65	84	65	65	65	50	0	90	1	120	1	50	1	8	52
983	610	axew	1	16	52	20	105	40	46	87	60	30	40	57	8	75	3	50	9	1	15
984	611	fraxure	1	16	52	20	105	40	66	117	70	40	50	67	8	60	3	50	9	1	15
985	612	haxorus	1	16	52	20	105	40	76	147	90	60	70	97	8	45	3	50	9	1	15
986	613	cubchoo	1	12	52	56	78	12	55	70	40	60	40	40	8	120	2	50	9	4	52
987	614	beartic	1	12	52	56	78	84	95	130	80	70	80	50	8	60	2	50	9	4	52
988	615	cryogonal	1	12	52	91	2	2	80	50	50	95	135	105	8	25	2	0	9	6	52
989	616	shelmet	1	6	52	37	109	128	50	40	85	40	65	25	8	200	2	50	9	5	52
990	617	accelgor	1	6	52	37	145	88	80	70	40	100	60	145	8	75	2	50	9	5	52
991	618	stunfisk	1	13	4	13	33	67	109	66	84	81	99	32	8	75	2	50	9	8	12
992	619	mienfoo	1	9	52	38	95	87	45	85	50	55	50	65	8	180	1	50	9	4	3
993	62	poliwrath	1	3	9	108	65	84	90	95	95	70	90	70	1	45	1	50	1	8	52
994	620	mienshao	1	9	52	38	95	87	65	125	60	95	60	105	8	45	1	50	9	4	3
995	621	druddigon	1	16	52	146	22	105	77	120	90	60	90	48	8	45	2	50	9	15	1
996	622	golett	1	13	17	23	14	29	59	74	50	35	50	35	8	190	2	0	9	6	52
997	623	golurk	1	13	17	23	14	29	89	124	80	55	80	55	8	90	2	0	9	6	52
998	624	pawniard	1	14	7	160	38	42	45	85	70	40	40	60	8	120	2	50	9	3	52
999	625	bisharp	1	14	7	160	38	42	65	125	100	60	70	70	8	45	2	50	9	3	52
1000	626	bouffalant	1	8	52	87	121	48	95	110	95	40	95	55	8	45	2	50	9	4	52
1001	627	rufflet	1	8	18	71	22	21	70	83	50	37	50	60	8	190	3	100	9	10	52
1002	628	braviary	1	8	18	71	22	160	100	123	75	57	75	80	8	60	3	100	9	10	52
1003	629	vullaby	1	14	18	73	128	115	70	55	75	45	65	60	8	190	3	0	9	10	52
1004	63	abra	1	10	52	41	38	53	25	20	15	105	0	90	1	200	1	75	1	3	52
1005	630	mandibuzz	1	14	18	73	128	115	110	65	105	55	95	80	8	60	3	0	9	10	52
1006	631	heatmor	1	2	52	74	55	149	85	97	66	105	66	65	8	90	2	50	9	4	52
1007	632	durant	1	6	7	30	21	138	58	109	112	48	48	109	8	90	2	50	9	5	52
1008	633	deino	1	14	16	21	2	2	52	65	50	45	50	38	8	45	3	50	9	15	52
1009	634	zweilous	1	14	16	21	2	2	72	85	70	65	70	58	8	45	3	50	9	15	52
1010	635	hydreigon	1	14	16	91	2	2	92	105	90	125	90	98	8	45	3	50	9	15	52
1011	636	larvesta	1	6	2	103	2	30	55	85	55	50	55	60	8	45	3	50	9	5	52
1012	637	volcarona	1	6	2	103	2	30	85	60	65	135	105	100	8	15	3	50	9	5	52
1013	638	cobalion	3	7	9	156	2	2	91	90	129	90	72	108	8	3	3	0	9	2	52
1014	639	terrakion	3	15	9	156	2	2	91	129	90	72	90	108	8	3	3	0	9	2	52
1015	64	kadabra	1	10	52	41	38	53	40	35	30	120	0	105	1	100	1	75	1	3	52
1016	640	virizion	3	1	9	156	2	2	91	90	72	90	129	108	8	3	3	0	9	2	52
1017	641	tornadus	3	18	52	125	2	160	79	115	70	125	80	111	8	3	3	100	9	2	52
1018	642	thundurus	3	4	18	125	2	160	79	115	70	125	80	111	8	3	3	100	9	2	52
1019	643	reshiram	4	16	2	176	2	2	100	120	100	150	120	90	8	3	3	0	9	2	52
1020	644	zekrom	4	16	4	177	2	2	100	150	120	120	100	90	8	3	3	0	9	2	52
1021	645	landorus	3	13	18	69	2	22	89	125	90	115	80	101	8	3	3	100	9	2	52
1022	646	kyurem	4	16	12	42	2	2	125	130	90	130	90	95	8	3	3	0	9	2	52
1023	647	keldeo	2	3	9	156	2	2	91	72	90	129	90	108	8	3	3	0	9	2	52
1024	648	meloetta	2	8	10	93	2	2	100	77	77	128	128	90	8	3	3	0	9	2	52
1025	649	genesect	2	6	7	114	2	2	71	120	95	120	95	99	8	3	3	0	9	2	52
1026	65	alakazam	1	10	52	41	38	53	55	50	45	135	95	120	1	50	1	75	1	3	52
1066	650	chespin	1	1	52	1	2	178	56	61	65	48	45	38	2	45	1	87.5	2	4	52
1067	651	quilladin	1	1	52	1	2	178	61	78	95	56	58	57	2	45	1	87.5	2	4	52
1068	652	chesnaught	1	1	9	1	2	178	88	107	122	74	75	64	2	45	1	87.5	2	4	52
1069	653	fennekin	1	2	52	5	2	179	40	45	40	62	60	60	2	45	1	87.5	2	4	52
1070	654	braixen	1	2	52	5	2	179	59	59	58	90	70	73	2	45	1	87.5	2	4	52
1071	655	delphox	1	2	10	5	2	179	75	69	72	114	100	104	2	45	1	87.5	2	4	52
1072	656	froakie	1	3	52	9	2	154	41	56	40	62	44	71	2	45	1	87.5	2	8	52
1073	657	frogadier	1	3	52	9	2	154	54	63	52	83	56	97	2	45	1	87.5	2	8	52
1074	658	greninja	1	3	14	9	2	154	72	95	67	103	71	122	2	45	1	87.5	2	8	52
1075	659	bunnelby	1	8	52	79	180	120	38	36	38	32	36	57	2	255	2	50	2	4	52
1076	66	machop	1	9	52	25	29	43	70	80	50	35	0	35	1	180	1	75	1	3	52
1077	660	diggersby	1	8	13	79	180	120	85	56	77	50	77	78	2	127	2	50	2	4	52
1078	661	fletchling	1	8	18	73	2	181	45	50	43	40	38	62	2	255	1	50	2	10	52
1079	662	fletchinder	1	2	18	103	2	181	62	73	55	56	52	84	2	120	1	50	2	10	52
1080	663	talonflame	1	2	18	103	2	181	78	81	71	74	69	126	2	45	1	50	2	10	52
1081	664	scatterbug	1	6	52	35	27	52	38	35	40	27	25	35	2	255	2	50	2	5	52
1082	665	spewpa	1	6	52	26	2	52	45	22	60	27	30	29	2	120	2	50	2	5	52
1083	666	vivillon	1	6	18	35	27	52	80	52	50	90	50	89	2	45	2	50	2	5	52
1084	667	litleo	1	2	8	20	40	106	62	50	58	73	54	72	2	220	1	12.5	2	4	52
1085	668	pyroar	1	2	8	20	40	106	86	68	72	109	66	106	2	65	1	12.5	2	4	52
1086	669	flabébé	1	11	52	182	2	170	44	38	39	61	79	42	2	225	2	0	2	9	52
1087	67	machoke	1	9	52	25	29	43	80	100	70	50	0	45	1	90	1	75	1	3	52
1088	670	floette	1	11	52	182	2	170	54	45	47	75	98	52	2	120	2	0	2	9	52
1089	671	florges	1	11	52	182	2	170	78	65	68	112	154	75	2	45	2	0	2	9	52
1090	672	skiddo	1	1	52	121	2	183	66	65	48	62	57	52	2	200	2	50	2	4	52
1091	673	gogoat	1	1	52	121	2	183	123	100	62	97	81	68	2	45	2	50	2	4	52
1092	674	pancham	1	9	52	23	105	97	67	82	62	46	48	43	2	220	2	50	2	4	3
1093	675	pangoro	1	9	14	23	105	97	95	124	78	69	71	58	2	65	2	50	2	4	3
1094	676	furfrou	1	8	52	82	2	2	75	80	60	65	90	102	2	160	2	50	2	4	52
1095	677	espurr	1	10	52	71	60	89	62	48	54	63	60	68	2	190	2	50	2	4	52
1096	678	meowstic	1	10	52	71	60	125	74	48	76	83	81	104	2	75	2	100	2	4	52
1097	68	machamp	1	9	52	25	29	43	90	130	80	65	0	55	1	45	1	75	1	3	52
1098	681	aegislash	1	7	17	184	2	2	60	50	140	50	140	60	2	45	2	50	2	6	52
1101	682	spritzee	1	11	52	63	2	185	78	52	60	63	65	23	2	200	2	50	2	9	52
1102	683	aromatisse	1	11	52	63	2	185	101	72	72	99	89	29	2	140	2	50	2	9	52
1103	684	swirlix	1	11	52	186	2	88	62	48	66	59	57	49	2	200	2	50	2	9	52
1104	685	slurpuff	1	11	52	186	2	88	82	80	86	85	75	72	2	140	2	50	2	9	52
1105	686	inkay	1	14	10	135	130	60	53	54	53	37	46	45	2	190	2	50	2	8	13
1106	687	malamar	1	14	10	135	130	60	86	92	88	68	75	73	2	80	2	50	2	8	13
1107	688	binacle	1	15	3	7	31	131	42	52	67	39	56	50	2	120	2	50	2	14	52
1108	689	barbaracle	1	15	3	7	31	131	72	105	115	54	86	68	2	45	2	50	2	14	52
1109	69	bellsprout	1	1	5	3	2	74	50	75	35	70	0	40	1	255	1	50	1	11	52
1110	690	skrelp	1	5	3	19	164	32	50	60	60	60	60	30	2	225	2	50	2	8	15
1111	691	dragalge	1	5	16	19	164	32	65	75	90	97	123	44	2	55	2	50	2	8	15
1112	692	clauncher	1	3	52	11	2	2	50	53	62	58	63	44	2	225	3	50	2	8	14
1113	693	clawitzer	1	3	52	11	2	2	71	73	88	120	89	59	2	55	3	50	2	8	14
1122	694	helioptile	1	4	8	64	67	6	44	38	33	61	43	70	2	190	2	50	2	1	15
1123	695	heliolisk	1	4	8	64	67	6	62	55	52	109	94	109	2	75	2	50	2	1	15
1124	696	tyrunt	1	15	16	187	2	46	58	89	77	45	45	48	2	45	2	87.5	2	1	15
1125	697	tyrantrum	1	15	16	187	2	86	82	121	119	69	59	71	2	45	2	87.5	2	1	15
1126	698	amaura	1	15	12	188	2	57	77	59	50	67	63	46	2	45	2	87.5	2	1	52
1127	699	aurorus	1	15	12	188	2	57	123	77	72	99	92	58	2	45	2	87.5	2	1	52
1128	70	weepinbell	1	1	5	3	2	74	65	90	50	85	0	55	1	120	1	50	1	11	52
1129	700	sylveon	1	11	52	50	2	189	95	65	65	110	130	60	2	45	2	87.5	2	4	52
1130	701	hawlucha	1	9	18	33	88	105	78	92	75	74	63	118	2	100	2	50	2	10	3
1131	702	dedenne	1	4	11	180	79	16	67	58	57	81	67	101	2	180	2	50	2	4	9
1132	703	carbink	1	15	11	158	2	46	50	50	150	50	150	50	2	60	3	0	2	9	6
1133	704	goomy	1	16	52	121	37	190	45	50	35	55	75	40	2	45	3	50	2	15	52
1134	705	sliggoo	1	16	52	121	37	190	68	75	53	83	113	60	2	45	3	50	2	15	52
1135	706	goodra	1	16	52	121	37	190	90	100	70	110	150	80	2	45	3	50	2	15	52
1136	707	klefki	1	7	11	125	2	179	57	80	91	80	87	75	2	75	4	50	2	6	52
1137	708	phantump	1	17	1	92	59	85	43	70	48	50	60	38	2	120	2	50	2	11	12
1138	709	trevenant	1	17	1	92	59	85	85	110	76	65	82	56	2	60	2	50	2	11	12
1139	71	victreebel	1	1	5	3	2	74	80	105	65	100	70	70	1	45	1	50	1	11	52
1140	710	pumpkaboo	1	17	1	79	59	44	49	66	70	44	55	51	2	120	2	50	2	12	52
1141	711	gourgeist	1	17	1	79	59	44	65	90	122	58	75	84	2	60	2	50	2	12	52
1142	712	bergmite	1	12	52	89	157	46	55	69	85	32	35	28	2	190	2	50	2	1	6
1143	713	avalugg	1	12	52	89	157	46	95	117	184	44	46	28	2	55	2	50	2	1	6
1144	714	noibat	1	18	16	59	60	127	40	30	35	45	40	55	2	190	2	50	2	10	15
1145	715	noivern	1	18	16	59	60	127	85	70	80	97	80	123	2	45	2	50	2	10	15
1146	716	xerneas	4	11	52	191	2	2	126	131	95	131	98	99	2	45	3	0	2	2	52
1147	717	yveltal	4	14	18	192	2	2	126	131	95	131	98	99	2	45	3	0	2	2	52
1148	718	zygarde	4	16	13	193	194	2	108	100	121	81	95	95	2	3	3	0	2	2	52
1149	719	diancie	2	15	11	158	2	2	50	100	150	100	150	50	2	3	3	0	2	2	52
1150	72	tentacool	1	3	5	158	144	10	40	40	35	100	0	70	1	190	3	50	1	14	52
1151	720	hoopa	2	10	17	179	2	2	80	110	60	150	130	70	2	3	3	0	2	2	52
1152	721	volcanion	2	2	3	108	2	2	80	110	120	130	90	70	2	3	3	0	2	2	52
1246	722	rowlet	1	1	18	1	2	195	68	55	55	50	50	40	6	45	1	87.5	7	10	52
1247	723	dartrix	1	1	18	1	2	195	78	75	75	70	70	52	6	45	1	87.5	7	10	52
1248	724	decidueye	1	1	17	1	2	195	78	107	75	100	100	70	6	45	1	87.5	7	10	52
1249	725	litten	1	2	52	5	2	24	45	65	40	60	40	70	6	45	1	87.5	7	4	52
1250	726	torracat	1	2	52	5	2	24	65	85	50	80	50	90	6	45	1	87.5	7	4	52
1251	727	incineroar	1	2	14	5	2	24	95	115	90	80	90	60	6	45	1	87.5	7	4	52
1252	728	popplio	1	3	52	9	2	196	50	54	54	66	56	40	6	45	1	87.5	7	8	4
1253	729	brionne	1	3	52	9	2	196	60	69	69	91	81	50	6	45	1	87.5	7	8	4
1254	73	tentacruel	1	3	5	158	144	10	80	70	65	120	0	100	1	60	3	50	1	14	52
1255	730	primarina	1	3	11	9	2	196	80	74	74	126	116	60	6	45	1	87.5	7	8	4
1256	731	pikipek	1	8	18	71	123	79	35	75	30	30	30	65	6	255	2	50	7	10	52
1257	732	trumbeak	1	8	18	71	123	79	55	85	50	40	50	75	6	120	2	50	7	10	52
1258	733	toucannon	1	8	18	71	123	22	80	120	75	75	75	60	6	45	2	50	7	10	52
1259	734	yungoos	1	8	52	197	187	32	48	70	30	30	30	45	6	255	2	50	7	4	52
1260	735	gumshoos	1	8	52	197	187	32	88	110	60	55	60	45	6	127	2	50	7	4	52
1261	736	grubbin	1	6	52	30	2	2	47	62	45	55	45	46	6	255	2	50	7	5	52
1262	737	charjabug	1	6	4	198	2	2	57	82	95	55	75	36	6	120	2	50	7	5	52
1263	738	vikavolt	1	6	4	91	2	2	77	70	90	145	75	43	6	45	2	50	7	5	52
1264	739	crabrawler	1	9	52	104	23	107	47	82	57	42	47	63	6	225	2	50	7	14	52
1265	74	geodude	1	15	13	86	46	67	40	80	100	30	0	20	1	255	1	50	1	6	52
1266	740	crabominable	1	9	12	104	23	107	97	132	77	62	67	43	6	60	2	50	7	14	52
1267	741	oricorio	1	2	18	199	2	2	75	70	70	98	70	93	6	45	2	25	7	10	52
1268	742	cutiefly	1	6	11	132	35	186	40	45	40	55	40	84	6	190	2	50	7	5	9
1269	743	ribombee	1	6	11	132	35	186	60	55	60	96	70	124	6	75	2	50	7	5	9
1270	744	rockruff	1	15	52	71	102	43	45	65	40	30	40	60	6	190	2	50	7	4	52
1271	745	lycanroc	1	15	52	71	77	43	75	115	65	55	65	112	6	90	2	50	7	4	52
1272	746	wishiwashi	1	3	52	200	2	2	45	20	20	25	25	40	6	60	4	50	7	13	52
1273	747	mareanie	1	5	3	201	33	95	50	53	62	43	52	45	6	190	2	50	7	8	52
1274	748	toxapex	1	5	3	201	33	95	50	63	152	53	142	35	6	75	2	50	7	8	52
1275	749	mudbray	1	13	52	89	202	38	70	100	70	45	55	45	6	190	2	50	7	4	52
1276	75	graveler	1	15	13	86	46	67	55	95	115	45	0	35	1	120	1	50	1	6	52
1277	750	mudsdale	1	13	52	89	202	38	100	125	100	55	85	35	6	60	2	50	7	4	52
1278	751	dewpider	1	3	6	203	2	108	38	40	52	40	72	27	6	200	2	50	7	8	5
1279	752	araquanid	1	3	6	203	2	108	68	70	92	50	132	42	6	100	2	50	7	8	5
1280	753	fomantis	1	1	52	94	2	130	40	55	35	50	35	35	6	190	2	50	7	11	52
1281	754	lurantis	1	1	52	94	2	130	70	105	90	80	90	45	6	75	2	50	7	11	52
1282	755	morelull	1	1	11	99	62	10	40	35	55	65	75	15	6	190	2	50	7	11	52
1283	756	shiinotic	1	1	11	99	62	10	60	45	80	90	100	30	6	75	2	50	7	11	52
1284	757	salandit	1	5	2	204	2	90	48	44	40	71	40	77	6	120	2	87.5	7	1	15
1285	758	salazzle	1	5	2	204	2	90	68	64	60	111	60	117	6	45	2	0	7	1	15
1286	759	stufful	1	8	9	205	14	50	70	75	50	45	50	50	6	140	2	50	7	4	52
1287	76	golem	1	15	13	86	46	67	80	120	130	55	65	45	1	45	1	50	1	6	52
1288	760	bewear	1	8	9	205	14	40	120	125	80	55	60	60	6	70	2	50	7	4	52
1289	761	bounsweet	1	1	52	94	90	186	42	30	38	30	38	32	6	235	1	0	7	11	52
1290	762	steenee	1	1	52	94	90	186	52	40	48	40	48	62	6	120	1	0	7	11	52
1291	763	tsareena	1	1	52	94	206	186	72	120	98	50	98	72	6	45	1	0	7	11	52
1292	764	comfey	1	11	52	182	207	92	51	52	90	82	110	100	6	60	4	25	7	11	52
1293	766	passimian	1	9	52	208	2	160	100	120	90	40	60	80	6	45	3	50	7	4	52
1294	767	wimpod	1	6	3	209	2	2	25	35	40	20	30	80	6	90	2	50	7	5	14
1295	768	golisopod	1	6	3	210	2	2	75	125	140	60	90	40	6	45	2	50	7	5	14
1296	769	sandygast	1	17	13	211	2	67	55	55	80	70	45	15	6	140	2	50	7	12	52
1297	77	ponyta	1	2	52	36	55	103	50	85	55	65	0	90	1	190	2	50	1	4	52
1298	770	palossand	1	17	13	211	2	67	85	75	110	100	75	35	6	60	2	50	7	12	52
1299	771	pyukumuku	1	3	52	212	2	54	55	60	130	30	130	5	6	60	4	50	7	8	52
1300	772	type: null	3	8	52	80	2	2	95	95	95	95	95	59	6	3	3	0	7	2	52
1301	773	silvally	3	8	52	213	2	2	95	95	95	95	95	95	6	3	3	0	7	2	52
1302	774	minior	1	15	18	214	2	2	60	60	100	60	100	60	6	30	1	0	7	6	52
1303	775	komala	1	8	52	215	2	2	65	115	65	75	95	65	6	45	3	50	7	4	52
1304	776	turtonator	1	2	16	109	2	2	60	78	135	91	85	36	6	70	2	50	7	1	15
1305	777	togedemaru	1	4	7	175	75	46	65	98	63	40	73	96	6	180	2	50	7	4	9
1306	778	mimikyu	1	17	11	216	2	2	55	90	80	50	105	96	6	45	2	50	7	12	52
1307	779	bruxish	1	3	10	217	187	66	68	105	70	70	70	92	6	80	2	50	7	13	52
1308	78	rapidash	1	2	52	36	55	103	65	100	70	80	0	105	1	60	2	50	1	4	52
1309	780	drampa	1	8	16	218	121	83	78	60	85	135	91	36	6	70	2	50	7	1	15
1310	781	dhelmise	1	17	1	219	2	2	70	131	100	86	90	40	6	25	2	0	7	6	52
1311	782	jangmo-o	1	16	52	178	48	128	45	55	65	45	45	45	6	45	3	50	7	15	52
1312	783	hakamo-o	1	16	9	178	48	128	55	75	90	65	70	65	6	45	3	50	7	15	52
1313	784	kommo-o	1	16	9	178	48	128	75	110	125	100	105	85	6	45	3	50	7	15	52
1314	785	tapu koko	3	4	11	220	2	127	70	115	85	95	75	130	6	3	3	0	7	2	52
1315	786	tapu lele	3	10	11	221	2	127	70	85	75	130	115	95	6	3	3	0	7	2	52
1316	787	tapu bulu	3	1	11	222	2	127	70	130	115	85	95	75	6	3	3	0	7	2	52
1317	788	tapu fini	3	3	11	223	2	127	70	75	115	95	130	85	6	3	3	0	7	2	52
1318	789	cosmog	4	10	52	54	2	2	43	29	31	29	31	37	6	45	3	0	7	2	52
1319	79	slowpoke	1	3	10	90	89	95	90	65	65	40	0	15	1	190	2	50	1	1	8
1320	790	cosmoem	4	10	52	46	2	2	43	29	131	29	131	37	6	45	3	0	7	2	52
1321	791	solgaleo	4	10	7	224	2	2	137	137	107	113	89	97	6	45	3	0	7	2	52
1322	792	lunala	4	10	17	225	2	2	137	113	89	137	107	97	6	45	3	0	7	2	52
1323	793	nihilego	3	15	5	226	2	2	109	53	47	127	131	103	6	45	3	0	7	2	52
1324	794	buzzwole	3	6	9	226	2	2	107	139	139	53	53	79	6	45	3	0	7	2	52
1325	795	pheromosa	3	6	9	226	2	2	71	137	37	137	37	151	6	45	3	0	7	2	52
1326	796	xurkitree	3	4	52	226	2	2	83	89	71	173	71	83	6	45	3	0	7	2	52
1327	797	celesteela	3	7	18	226	2	2	97	101	103	107	101	61	6	45	3	0	7	2	52
1328	798	kartana	3	1	7	226	2	2	59	181	131	59	31	109	6	45	3	0	7	2	52
1329	799	guzzlord	3	14	16	226	2	2	223	101	53	97	53	43	6	45	3	0	7	2	52
1330	80	slowbro	1	3	10	90	89	95	95	75	110	80	0	30	1	75	2	50	1	1	8
1331	800	necrozma	4	10	52	227	2	2	97	107	101	127	89	79	6	255	3	0	7	2	52
1332	801	magearna	2	7	11	228	2	2	80	95	115	130	115	65	6	3	3	0	7	2	52
1333	802	marshadow	2	9	17	17	2	2	90	125	80	90	90	125	6	3	3	0	7	2	52
1334	803	poipole	3	5	52	226	2	2	67	73	67	73	67	73	6	45	3	0	10	2	52
1335	804	naganadel	3	5	16	226	2	2	73	73	73	127	73	121	6	45	3	0	10	2	52
1336	805	stakataka	3	15	7	226	2	2	61	131	211	53	101	13	6	30	3	0	10	2	52
1337	806	blacephalon	3	2	17	226	2	2	53	127	53	151	79	107	6	30	3	0	10	2	52
1338	807	zeraora	2	4	52	111	2	2	88	112	75	102	80	143	6	3	3	0	10	2	52
1339	808	meltan	2	7	52	45	2	2	46	65	65	55	35	34	6	3	3	0	11	2	52
1340	809	melmetal	2	7	52	23	2	2	135	143	143	80	65	34	6	3	3	0	11	2	52
1341	82	magneton	1	4	7	45	46	47	50	60	95	120	0	70	1	60	2	0	1	6	52
1342	83	farfetch'd	1	8	18	71	38	160	52	90	55	58	62	60	1	45	2	50	1	10	4
1343	84	doduo	1	8	18	36	96	72	35	85	45	35	0	75	1	190	2	50	1	10	52
1344	85	dodrio	1	8	18	36	96	72	60	110	70	60	60	110	1	45	2	50	1	10	52
1345	86	seel	1	3	52	4	37	157	65	45	55	70	0	45	1	190	2	50	1	8	4
1346	87	dewgong	1	3	12	4	37	157	90	70	80	95	0	70	1	75	2	50	1	8	4
1347	88	grimer	1	5	52	61	145	164	80	80	50	40	0	25	1	190	2	50	1	12	52
1348	89	muk	1	5	52	61	145	164	105	105	75	65	0	50	1	75	2	50	1	12	52
1349	90	shellder	1	3	52	109	123	128	30	65	100	45	0	40	1	190	3	50	1	14	52
1350	91	cloyster	1	3	52	109	123	128	50	95	180	85	0	70	1	60	3	50	1	14	52
1351	92	gastly	1	17	5	91	2	2	30	35	30	100	0	80	1	190	1	50	1	12	52
1352	93	haunter	1	17	5	91	2	2	45	50	45	115	0	95	1	90	1	50	1	12	52
1353	94	gengar	1	17	5	91	2	2	60	65	60	130	0	110	1	45	1	50	1	12	52
1354	95	onix	1	15	13	86	46	115	35	45	160	30	0	70	1	45	2	50	1	6	52
1355	96	drowzee	1	10	52	44	101	38	60	48	45	90	0	42	1	190	2	50	1	3	52
1356	97	hypno	1	10	52	44	101	38	85	73	70	115	0	67	1	75	2	50	1	3	52
1357	98	krabby	1	3	52	104	109	22	30	105	90	25	0	50	1	225	2	50	1	14	52
1358	99	kingler	1	3	52	104	109	22	55	130	115	50	0	75	1	60	2	50	1	14	52
1359	103	exeggutor	1	1	16	59	2	85	95	105	85	125	75	45	6	45	3	50	7	11	52
1360	65	alakazam	1	10	52	113	2	2	55	50	65	175	105	150	2	50	1	75	2	3	52
1361	74	geodude	1	15	4	45	46	229	40	80	100	30	30	20	6	255	1	50	7	6	52
1362	75	graveler	1	15	4	45	46	229	55	95	115	45	45	35	6	120	1	50	7	6	52
1363	76	golem	1	15	4	45	46	229	80	120	130	55	65	45	6	45	1	50	7	6	52
1364	77	ponyta	1	10	52	36	230	110	50	85	55	65	65	90	3	190	2	50	3	4	52
1365	78	rapidash	1	10	11	36	230	110	65	100	70	80	80	105	3	60	2	50	3	4	52
1366	79	slowpoke	1	10	52	74	89	95	90	65	65	40	40	15	3	190	2	50	3	1	8
1367	80	slowbro	1	3	10	109	2	2	95	75	180	130	80	30	2	75	2	50	5	1	8
1368	80	slowbro	1	5	10	231	89	95	95	100	95	100	70	30	3	75	2	50	3	1	8
1369	83	farfetch'd	1	9	52	43	2	97	52	95	55	58	62	55	3	45	2	50	3	10	4
1370	681	aegislash	1	7	17	184	2	2	60	140	50	140	50	60	2	45	2	50	2	6	52
1371	94	gengar	1	17	5	126	2	2	60	65	80	170	95	130	2	45	1	50	2	12	52
1372	88	grimer	1	5	14	164	74	232	80	80	50	40	50	25	6	190	2	50	7	12	52
1373	89	muk	1	5	14	164	74	232	105	105	75	65	100	50	6	75	2	50	7	12	52
1374	105	marowak	1	17	2	155	75	86	60	80	110	50	80	45	6	75	2	50	7	1	52
1375	110	weezing	1	5	11	91	233	223	65	90	120	85	70	60	3	60	2	50	3	12	52
1376	866	mr. rime	1	12	10	72	234	157	80	85	75	110	100	70	3	45	2	50	3	3	52
1377	122	mr. mime	1	12	10	102	234	157	50	65	65	90	90	100	3	45	2	50	3	3	52
1378	870	falinks	1	9	52	80	2	160	60	100	100	70	60	75	3	45	2	0	3	9	6
1379	115	kangaskhan	1	8	52	235	2	2	105	125	100	60	100	100	2	45	2	0	2	1	52
1380	127	pinsir	1	6	18	236	2	2	65	155	120	65	90	105	2	45	3	50	2	5	52
1381	130	gyarados	1	3	14	105	2	2	95	155	109	70	130	81	2	45	3	50	2	13	15
1382	142	aerodactyl	1	15	18	7	2	2	80	135	85	70	95	150	2	45	3	87.5	2	10	52
1383	208	steelix	1	7	13	69	2	2	75	125	230	55	95	30	2	25	2	50	5	6	52
1384	212	scizor	1	6	7	17	2	2	70	150	140	65	100	75	2	25	2	50	2	5	52
1385	144	articuno	3	10	18	58	2	2	90	85	85	125	100	95	3	3	3	0	3	2	52
1386	145	zapdos	3	9	18	160	2	2	90	125	90	85	90	100	3	3	3	0	3	2	52
1387	146	moltres	3	14	18	218	2	2	90	85	90	100	125	90	3	3	3	0	3	2	52
1388	199	slowking	1	5	10	237	89	95	95	65	80	110	110	30	3	70	2	50	3	1	8
1389	222	corsola	1	17	52	115	2	155	60	55	100	65	100	30	3	60	4	25	3	8	14
1390	864	cursola	1	17	52	115	2	238	60	95	50	145	130	30	3	30	4	25	3	8	14
1391	386	deoxys	2	10	52	42	2	2	50	180	20	180	20	150	7	3	3	0	12	2	52
1392	386	deoxys	2	10	52	42	2	2	50	70	160	70	160	90	7	3	3	0	13	2	52
1393	386	deoxys	2	10	52	42	2	2	50	95	90	95	90	180	7	3	3	0	14	2	52
1394	181	ampharos	1	4	16	105	2	2	90	95	105	165	110	45	2	45	1	50	2	1	4
1395	214	heracross	1	6	9	123	2	2	80	185	115	40	105	75	2	45	3	50	2	5	52
1396	229	houndoom	1	14	2	6	2	2	75	90	90	140	90	115	2	45	3	50	2	4	52
1397	248	tyranitar	1	15	14	136	2	2	100	164	150	95	120	71	2	45	3	50	2	1	52
1398	865	sirfetch'd	1	9	52	43	2	97	62	135	95	68	82	65	3	45	2	50	3	10	4
1399	381	latios	1	16	10	91	2	2	80	130	100	160	120	110	2	3	3	100	5	2	52
1400	380	latias	1	16	10	91	2	2	80	100	120	140	150	110	2	3	3	0	5	2	52
1401	487	giratina	4	17	16	91	2	2	150	120	100	120	100	90	4	3	3	0	15	2	52
1402	745	lycanroc	1	15	52	71	102	29	85	115	75	55	75	82	6	90	2	50	7	4	52
1403	745	lycanroc	1	15	52	7	2	2	75	117	65	55	65	110	6	90	2	50	10	4	52
1404	800	necrozma	4	10	7	227	2	2	97	157	127	113	109	77	6	255	3	0	10	2	52
1405	800	necrozma	4	10	17	227	2	2	97	113	109	157	127	77	6	255	3	0	10	2	52
1406	800	necrozma	4	10	16	239	2	2	97	167	97	167	97	129	6	255	3	0	10	2	52
1407	492	shaymin	2	1	18	93	2	2	100	103	75	120	75	127	4	45	1	0	15	2	52
1408	479	rotom	1	4	2	91	2	2	50	65	107	105	107	86	4	45	2	0	15	12	52
1409	479	rotom	1	4	3	91	2	2	50	65	107	105	107	86	4	45	2	0	15	12	52
1410	479	rotom	1	4	12	91	2	2	50	65	107	105	107	86	4	45	2	0	15	12	52
1411	479	rotom	1	4	18	91	2	2	50	65	107	105	107	86	4	45	2	0	15	12	52
1412	874	stonjourner	1	15	52	240	2	2	100	125	135	20	20	70	3	60	3	50	3	6	52
1413	479	rotom	1	4	1	91	2	2	50	65	107	105	107	86	4	45	2	0	15	12	52
1414	550	basculin	1	3	52	86	32	105	70	92	65	80	55	98	8	25	2	50	9	13	52
1415	641	tornadus	3	18	52	95	2	2	79	100	80	110	90	121	8	3	3	100	16	2	52
1416	642	thundurus	3	4	18	111	2	2	79	105	70	145	80	101	8	3	3	100	16	2	52
1417	645	landorus	3	13	18	24	2	2	89	145	90	105	80	91	8	3	3	100	16	2	52
1418	880	dracozolt	1	4	16	111	21	77	90	100	90	80	70	75	3	45	3	0	3	2	52
1419	882	dracovish	1	3	16	108	187	77	90	90	100	70	80	75	3	45	3	0	3	2	52
1420	881	arctozolt	1	4	12	111	13	78	90	100	90	90	80	55	3	45	3	0	3	2	52
1421	646	kyurem	4	16	12	176	2	2	125	120	90	170	100	95	8	3	3	0	16	2	52
1422	883	arctovish	1	3	12	108	157	78	90	90	100	80	90	55	3	45	3	0	3	2	52
1423	646	kyurem	4	16	12	177	2	2	125	170	100	120	90	95	8	3	3	0	16	2	52
1424	884	duraludon	1	7	16	129	142	241	70	95	115	120	50	85	3	45	2	50	3	6	15
1425	871	pincurchin	1	4	52	75	2	220	48	101	95	91	85	15	3	75	2	50	3	8	12
1426	877	morpeko	1	4	14	242	2	2	58	95	58	70	58	97	3	180	2	50	3	4	9
1427	658	greninja	1	3	14	243	2	2	72	145	67	153	71	132	6	45	1	87.5	7	8	52
1428	254	sceptile	1	1	16	75	2	2	70	110	75	145	85	145	2	45	1	87.5	5	1	15
1429	257	blaziken	1	2	9	124	2	2	80	160	80	130	80	100	2	45	1	87.5	2	4	52
1430	260	swampert	1	3	13	84	2	2	100	150	110	95	110	70	2	45	1	87.5	5	1	8
1431	384	rayquaza	4	16	18	244	2	2	105	180	100	180	100	115	2	45	3	0	5	2	52
1432	382	kyogre	4	3	52	245	2	2	100	150	90	180	160	90	2	3	3	0	5	2	52
1433	383	groudon	4	13	2	246	2	2	100	180	160	150	90	90	2	3	3	0	5	2	52
1434	306	aggron	1	7	52	100	2	2	70	140	230	60	80	50	2	45	3	50	2	1	52
1435	282	gardevoir	1	10	11	189	2	2	68	85	65	165	135	100	2	45	3	50	2	12	52
1436	475	gallade	1	10	9	38	2	2	68	165	95	65	115	110	2	45	3	100	5	12	52
1437	310	manectric	1	4	52	24	2	2	70	75	80	135	80	135	2	45	3	50	2	4	52
1438	445	garchomp	1	16	13	69	2	2	108	170	115	120	95	92	2	45	3	50	2	1	15
1439	810	grookey	1	1	52	1	2	222	50	65	50	40	40	65	3	45	1	87.5	3	4	11
1440	811	thwackey	1	1	52	1	2	222	70	85	70	55	60	80	3	45	1	87.5	3	4	11
1441	812	rillaboom	1	1	52	1	2	222	100	125	90	60	70	85	3	45	1	87.5	3	4	11
1442	813	scorbunny	1	2	52	5	2	247	50	71	40	40	40	69	3	45	1	87.5	3	4	3
1443	814	raboot	1	2	52	5	2	247	65	86	50	55	60	94	3	45	1	87.5	3	4	3
1444	815	cinderace	1	2	52	5	2	247	80	116	75	65	75	119	3	45	1	87.5	3	4	3
1445	816	sobble	1	3	52	9	2	31	50	40	40	70	40	70	3	45	1	87.5	3	8	4
1446	817	drizzile	1	3	52	9	2	31	65	60	55	95	55	90	3	45	1	87.5	3	8	4
1447	818	inteleon	1	3	52	9	2	31	70	85	65	125	65	120	3	45	1	87.5	3	8	4
1448	888	zacian	4	11	52	248	2	2	92	130	115	80	115	138	3	10	3	0	3	2	52
1449	888	zacian	4	11	7	248	2	2	92	170	115	80	115	148	3	10	3	0	3	2	52
1450	889	zamazenta	4	9	52	249	2	2	92	130	115	80	115	138	3	10	3	0	3	2	52
1451	889	zamazenta	4	9	7	249	2	2	92	130	145	80	145	128	3	10	3	0	3	2	52
1452	890	eternatus	4	5	16	42	2	2	140	85	95	145	95	130	3	255	3	0	3	2	52
1461	890	eternatus	4	5	16	42	2	2	255	115	250	125	250	130	3	255	3	0	3	2	52
1462	819	skwovet	1	8	52	180	2	74	70	55	55	35	35	25	3	255	2	50	3	4	52
1463	820	greedent	1	8	52	180	2	74	120	95	95	55	75	20	3	90	2	50	3	4	52
1464	562	yamask	1	13	17	250	2	2	38	55	85	30	65	30	3	190	2	50	3	6	12
1465	867	runerigus	1	13	17	250	2	2	58	95	145	50	105	30	3	90	2	50	3	6	12
1466	263	zigzagoon	1	14	8	79	74	112	38	30	41	30	41	60	3	255	2	50	3	4	52
1467	264	linoone	1	14	8	79	74	112	78	70	61	50	61	100	3	90	2	50	3	4	52
1468	862	obstagoon	1	14	8	87	25	160	93	90	101	60	81	95	3	45	2	50	3	4	52
1469	821	rookidee	1	18	52	71	40	73	38	47	35	33	35	57	3	255	1	50	3	10	52
1470	822	corvisquire	1	18	52	71	40	73	68	67	55	43	55	77	3	120	1	50	3	10	52
1471	823	corviknight	1	18	7	42	40	251	98	87	105	53	85	67	3	45	1	50	3	10	52
1472	885	dreepy	1	16	17	158	60	155	28	60	30	40	30	82	3	45	3	50	3	12	15
1473	886	drakloak	1	16	17	158	60	155	68	80	50	60	50	102	3	45	3	50	3	12	15
1474	887	dragapult	1	16	17	158	60	155	88	120	75	100	75	142	3	45	3	50	3	12	15
1475	878	cufant	1	7	52	22	2	142	72	80	49	40	49	40	3	190	2	50	3	4	6
1476	879	copperajah	1	7	52	22	2	142	122	130	69	80	69	30	3	90	2	50	3	4	6
1477	876	indeedee	1	10	8	38	41	221	60	65	55	105	95	95	3	30	4	100	3	9	52
1478	876	indeedee	1	10	8	89	41	221	70	55	65	95	105	85	3	30	4	0	3	9	52
1479	875	eiscue	1	12	52	252	2	2	75	80	110	65	90	50	3	60	3	50	3	8	4
1480	875	eiscue	1	12	52	252	2	2	75	80	70	65	50	130	3	60	3	50	3	8	4
1481	872	snom	1	12	6	35	2	253	30	25	35	45	30	20	3	190	2	50	3	5	52
1482	873	frosmoth	1	12	6	35	2	253	70	65	60	125	90	65	3	75	2	50	3	5	52
1483	868	milcery	1	11	52	186	2	185	45	40	40	50	61	34	3	200	2	0	3	9	12
1484	869	alcremie	1	11	52	186	2	185	65	60	75	110	121	64	3	100	2	0	3	9	12
1485	824	blipbug	1	6	52	30	27	127	25	20	20	25	45	45	3	255	2	50	3	5	52
1486	825	dottler	1	6	10	30	27	127	50	35	80	50	90	30	3	120	2	50	3	5	52
1487	826	orbeetle	1	6	10	30	59	127	60	45	110	80	120	90	3	45	2	50	3	5	52
1488	827	nickit	1	14	52	36	88	197	40	28	28	47	52	50	3	255	4	50	3	4	52
1489	828	thievul	1	14	52	36	88	197	70	58	58	87	92	90	3	127	4	50	3	4	52
1490	829	gossifleur	1	1	52	254	95	62	40	40	60	40	60	10	3	190	2	50	3	11	52
1491	830	eldegoss	1	1	52	254	95	62	60	50	90	80	120	60	3	75	2	50	3	11	52
1492	831	wooloo	1	8	52	205	36	178	42	40	55	40	45	48	3	255	2	50	3	4	52
1493	832	dubwool	1	8	52	205	43	178	72	80	100	60	90	88	3	127	2	50	3	4	52
1494	833	chewtle	1	3	52	187	109	84	50	64	50	38	38	44	3	255	2	50	3	1	8
1495	834	drednaw	1	3	15	187	109	84	90	115	90	48	68	74	3	75	2	50	3	1	8
1496	835	yamper	1	4	52	255	2	12	59	45	50	40	50	26	3	255	4	50	3	4	52
1497	836	boltund	1	4	52	187	2	58	69	90	60	90	60	121	3	45	4	50	3	4	52
1498	837	rolycolt	1	15	52	256	163	55	30	40	50	40	50	30	3	255	1	50	3	6	52
1499	838	carkol	1	15	2	256	103	55	80	60	90	60	70	50	3	120	1	50	3	6	52
1500	839	coalossal	1	15	2	256	103	55	110	80	120	80	90	30	3	45	1	50	3	6	52
1501	840	applin	1	1	16	257	74	178	40	40	80	40	40	20	3	255	6	50	3	11	15
1502	841	flapple	1	1	16	257	74	21	70	110	80	95	60	70	3	45	6	50	3	11	15
1503	842	appletun	1	1	16	257	74	4	110	85	80	100	80	30	3	45	6	50	3	11	15
1504	843	silicobra	1	13	52	258	26	67	52	57	75	35	50	46	3	255	2	50	3	4	15
1505	844	sandaconda	1	13	52	258	26	67	72	107	125	65	70	71	3	120	2	50	3	4	15
1506	845	cramorant	1	18	3	259	2	2	70	85	55	85	95	85	3	45	2	50	3	8	10
1507	846	arrokunda	1	3	52	84	2	260	41	63	40	40	30	66	3	255	3	50	3	13	52
1508	847	barraskewda	1	3	52	84	2	260	61	123	60	60	50	136	3	60	3	50	3	13	52
1509	850	sizzlipede	1	2	6	55	149	103	50	65	45	50	50	45	3	190	2	50	3	5	52
1510	851	centiskorch	1	2	6	55	149	103	100	115	65	90	90	65	3	75	2	50	3	5	52
1511	852	clobbopus	1	9	52	33	2	17	50	68	60	50	50	32	3	180	1	50	3	8	3
1512	853	grapploct	1	9	52	33	2	17	80	118	90	70	80	42	3	45	1	50	3	8	3
1513	854	sinistea	1	17	52	115	2	155	40	45	45	74	54	50	3	120	2	0	3	6	12
1514	855	polteageist	1	17	52	115	2	155	60	65	65	134	114	70	3	60	2	0	3	6	12
1515	856	hatenna	1	10	52	63	110	51	42	30	45	56	53	39	3	235	3	0	3	9	52
1516	857	hattrem	1	10	52	63	110	51	57	40	65	86	73	49	3	120	3	0	3	9	52
1517	858	hatterene	1	10	11	63	110	51	57	90	95	136	103	29	3	45	3	0	3	9	52
1518	859	impidimp	1	14	11	125	59	131	45	45	30	55	40	50	3	255	2	100	3	9	3
1519	860	morgrem	1	14	11	125	59	131	65	60	45	75	55	70	3	120	2	100	3	9	3
1520	861	grimmsnarl	1	14	11	125	59	131	95	120	65	95	75	60	3	45	2	100	3	9	3
1521	12	butterfree	1	6	18	27	2	28	60	45	50	90	80	70	3	45	2	50	3	5	52
1522	6	charizard	1	2	18	5	2	6	78	84	78	109	85	100	3	45	1	87.5	3	1	15
1523	25	pikachu	1	4	52	13	2	75	35	55	40	50	50	90	3	190	2	50	3	4	9
1524	52	meowth	1	8	52	79	17	40	40	45	35	40	40	90	3	255	2	50	3	4	52
1525	9	blastoise	1	3	52	9	2	10	79	83	100	85	105	78	3	45	1	87.5	3	1	8
1526	3	venusaur	1	1	5	1	2	3	80	82	83	100	100	80	3	45	1	87.5	3	1	11
1527	818	inteleon	1	3	52	9	2	31	70	85	65	125	65	120	3	45	1	87.5	3	8	4
1528	815	cinderace	1	2	52	5	2	247	80	116	75	65	75	119	3	45	1	87.5	3	4	3
1529	812	rillaboom	1	1	52	1	2	222	100	125	90	60	70	85	3	45	1	87.5	3	4	11
1530	884	duraludon	1	7	16	129	142	241	70	95	115	120	50	85	3	45	2	50	3	6	15
1531	879	copperajah	1	7	52	22	2	142	122	130	69	80	69	30	3	90	2	50	3	4	6
1532	869	alcremie	1	11	52	186	2	185	65	60	75	110	121	64	3	100	2	0	3	9	12
1533	861	grimmsnarl	1	14	11	125	59	131	95	120	65	95	75	60	3	45	2	100	3	9	3
1534	858	hatterene	1	10	11	63	110	51	57	90	95	136	103	29	3	45	3	0	3	9	52
1535	851	centiskorch	1	2	6	55	149	103	100	115	65	90	90	65	3	75	2	50	3	5	52
1536	849	toxtricity	1	4	5	15	16	17	75	98	70	114	70	75	3	45	1	50	3	3	52
1537	849	toxtricity	1	4	5	15	18	17	75	98	70	114	70	75	3	45	1	50	3	3	52
1538	844	sandaconda	1	13	52	258	26	67	72	107	125	65	70	71	3	120	2	50	3	4	15
1539	842	appletun	1	1	16	257	74	4	110	85	80	100	80	30	3	45	6	50	3	11	15
1540	841	flapple	1	1	16	257	74	21	70	110	80	95	60	70	3	45	6	50	3	11	15
1541	839	coalossal	1	15	2	256	103	55	110	80	120	80	90	30	3	45	1	50	3	6	52
1542	834	drednaw	1	3	15	187	109	84	90	115	90	48	68	74	3	75	2	50	3	1	8
1543	826	orbeetle	1	6	10	30	59	127	60	45	110	80	120	90	3	45	2	50	3	5	52
1544	823	corviknight	1	18	7	42	40	251	98	87	105	53	85	67	3	45	1	50	3	10	52
1545	143	snorlax	1	8	52	116	4	74	160	110	65	65	110	30	3	25	3	87.5	3	1	52
1546	133	eevee	1	8	52	36	32	110	55	55	50	45	65	55	3	45	2	87.5	3	4	52
1547	131	lapras	1	3	12	108	109	37	130	85	80	85	95	60	3	45	3	50	3	1	8
1548	99	kingler	1	3	52	104	109	22	55	130	115	50	50	75	3	60	2	50	3	14	52
1549	94	gengar	1	17	5	155	2	2	60	65	60	130	75	110	3	45	1	50	3	12	52
1550	68	machamp	1	9	52	25	29	43	90	130	80	65	85	55	3	45	1	75	3	3	52
1551	569	garbodor	1	5	52	61	115	49	80	95	82	60	82	75	3	60	2	50	3	6	52
1552	809	melmetal	2	7	52	23	2	2	135	143	143	80	65	34	3	3	3	0	3	2	52
1553	618	stunfisk	1	13	7	261	2	2	109	81	99	66	84	32	3	75	2	50	3	8	12
1554	555	darmanitan	1	2	10	171	2	2	105	30	105	140	105	55	8	60	1	50	9	4	52
1555	555	darmanitan	1	12	52	262	2	171	105	140	55	30	55	95	3	60	1	50	3	4	52
1556	555	darmanitan	1	12	2	171	2	2	105	160	55	30	55	135	3	60	1	50	3	4	52
1557	554	darumaka	1	12	52	21	2	38	70	90	45	15	45	50	3	120	1	50	3	4	52
1558	302	sableye	1	14	17	51	2	2	50	85	125	85	115	20	2	45	1	50	5	3	52
1559	303	mawile	1	7	11	120	2	2	50	105	125	55	95	50	2	45	4	50	2	4	9
1560	362	glalie	1	12	52	188	2	2	80	120	80	120	80	100	2	75	2	50	5	9	6
1561	448	lucario	1	9	7	32	2	2	70	145	88	140	70	112	2	45	1	87.5	2	4	3
1562	460	abomasnow	1	1	12	57	2	2	90	132	105	132	105	30	2	60	3	50	2	1	11
1563	531	audino	1	8	11	63	2	2	103	60	126	80	126	50	2	255	4	50	5	9	52
1564	774	minior	1	15	18	214	2	2	60	100	60	100	60	120	6	30	1	0	7	6	52
1565	351	castform	1	2	52	152	2	2	70	70	70	70	70	70	7	45	2	50	8	9	12
1566	351	castform	1	3	52	152	2	2	70	70	70	70	70	70	7	45	2	50	8	9	12
1567	351	castform	1	12	52	152	2	2	70	70	70	70	70	70	7	45	2	50	8	9	12
1568	413	wormadam	1	6	13	110	2	128	60	79	105	59	85	36	4	45	2	0	4	5	52
1569	413	wormadam	1	6	7	110	2	128	60	69	95	69	95	36	4	45	2	0	4	5	52
1570	648	meloetta	2	8	9	93	2	2	100	128	90	77	77	128	8	3	3	0	9	2	52
1571	710	pumpkaboo	1	17	1	79	59	44	44	66	70	44	55	56	2	120	2	50	2	12	52
1572	710	pumpkaboo	1	17	1	79	59	44	54	66	70	44	55	46	2	120	2	50	2	12	52
1573	710	pumpkaboo	1	17	1	79	59	44	59	66	70	44	55	41	2	120	2	50	2	12	52
1574	711	gourgeist	1	17	1	79	59	44	55	85	122	58	75	99	2	60	2	50	2	12	52
1575	711	gourgeist	1	17	1	79	59	44	75	95	122	58	75	69	2	60	2	50	2	12	52
1576	711	gourgeist	1	17	1	79	59	44	85	100	122	58	75	54	2	60	2	50	2	12	52
1577	718	zygarde	4	16	13	193	194	2	54	100	71	61	85	115	6	3	3	0	7	2	52
1578	718	zygarde	4	16	13	194	2	2	216	100	121	91	95	85	6	3	3	0	7	2	52
1579	720	hoopa	2	10	14	179	2	2	80	160	60	170	130	80	2	3	3	0	5	2	52
1580	678	meowstic	1	10	52	71	60	58	74	48	76	83	81	104	2	75	2	0	2	4	52
1581	746	wishiwashi	1	3	52	200	2	2	45	140	130	140	135	30	6	60	4	50	7	13	52
1582	741	oricorio	1	4	18	199	2	2	75	70	70	98	70	93	6	45	2	25	7	10	52
1583	741	oricorio	1	10	18	199	2	2	75	70	70	98	70	93	6	45	2	25	7	10	52
1584	741	oricorio	1	17	18	199	2	2	75	70	70	98	70	93	6	45	2	25	7	10	52
1585	376	metagross	1	7	10	7	2	2	80	145	150	105	110	110	2	3	3	100	5	6	52
1586	373	salamence	1	16	18	236	2	2	95	145	130	120	90	120	2	45	3	50	5	15	52
1587	319	sharpedo	1	3	14	187	2	2	70	140	70	110	65	105	2	60	3	50	5	13	52
1588	323	camerupt	1	2	13	22	2	2	70	120	100	145	105	20	2	150	2	50	5	4	52
1589	334	altaria	1	16	11	189	2	2	75	110	110	110	105	80	2	45	6	50	5	10	15
1590	308	medicham	1	9	10	143	2	2	60	100	85	80	85	100	2	90	2	50	2	3	52
1591	359	absol	1	14	52	51	2	2	65	150	60	115	60	115	2	30	1	50	2	4	52
1592	354	banette	1	17	52	125	2	2	64	165	75	93	83	75	2	45	4	50	2	12	52
1593	428	lopunny	1	8	9	97	2	2	65	136	94	54	96	135	2	60	2	50	5	4	3
1594	719	diancie	2	15	11	51	2	2	50	160	110	160	110	110	2	3	3	0	5	2	52
1595	25	pikachu	1	4	52	13	2	75	45	80	50	75	60	120	6	190	2	50	11	4	9
1596	133	eevee	1	8	52	36	32	110	65	75	70	65	85	75	6	45	2	87.5	11	4	52
1597	893	zarude	2	14	1	94	2	2	105	120	105	70	95	105	3	3	3	0	3	2	52
1598	894	regieleki	3	4	52	263	2	2	80	100	50	100	50	200	3	3	3	0	3	2	52
1599	895	regidrago	3	16	52	264	2	2	200	100	50	100	50	80	3	3	3	0	3	2	52
1600	892	urshifu	3	9	14	39	2	2	100	130	100	63	60	97	3	3	6	87.5	3	2	52
1601	892	urshifu	3	9	3	39	2	2	100	130	100	63	60	97	3	3	6	87.5	3	2	52
1602	896	glastrier	3	12	52	265	2	2	100	145	130	65	110	30	3	3	3	0	3	2	52
1603	897	spectrier	3	17	52	266	2	2	100	65	60	145	80	130	3	3	3	0	3	2	52
1604	898	calyrex	4	10	12	267	2	2	100	165	150	85	130	50	3	3	3	0	3	2	52
1605	898	calyrex	4	10	17	267	2	2	100	85	80	165	100	150	3	3	3	0	3	2	52
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.regions (id, region) FROM stdin;
1	kanto
2	kalos
3	galar
4	sinnoh
5	johto
6	alola
7	hoenn
8	unova
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.types (id, pokemon_type) FROM stdin;
1	grass
2	fire
3	water
4	electric
5	poison
6	bug
7	steel
8	normal
9	fighting
10	psychic
11	fairy
12	ice
13	ground
14	dark
15	rock
16	dragon
17	ghost
18	flying
52	null
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
-- Name: growth_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.growth_types_id_seq', 1, false);


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
