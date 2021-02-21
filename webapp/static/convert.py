'''
convert.py written by Jimmy Zhong, Ross Grogan Kaylor at Carleton College in CS Software Design under Prof Jeff Ondich 
converts an csv file called 'athlete_events.csv' into database-ready csv (with index included)
Produces 8 tables for database operation: 
athletes_table.csv; teams_table.csv; sport_categories_table.csv; detailed_events_table.csv
medals_table.csv; nocs_table.csv; olympic_games_table.csv; main_events_table.csv
'''
import csv 

class poke_row:
	"""object that takes in every element in a row of given csv file"""
	def __init__(self, pokemon_id, pokedex_number, pokemon_name, legendary_type, 
	type1, type2, primary_ability, primary_ability_description, secondary_ability, 
	secondary_ability_description, hidden_ability, hidden_ability_description, male_ratio, 
	female_ratio, games_of_origin, region, health, attack, defense, special_attack, 
	special_defense, speed, base_total, catch_rate, experience_growth, egg_group1, egg_group2):
		self.pokemon_id = pokemon_id
		self.pokedex_number = pokedex_number
		self.pokemon_name = pokemon_name
		self.legendary_type = legendary_type
		self.type1 = type1
		self.type2 = type2
		self.primary_ability = primary_ability
		self.primary_ability_description = primary_ability_description
		self.secondary_ability = secondary_ability
		self.secondary_ability_description = secondary_ability_description
		self.hidden_ability = hidden_ability
		self.hidden_ability_description = hidden_ability_description
		self.male_ratio = male_ratio
		self.female_ratio = female_ratio
		self.games_of_origin = games_of_origin 
		self.region = region
		self.health = health
		self.attack = attack
		self.defense = defense
		self.special_attack = special_attack
		self.special_defense = special_defense
		self.speed = speed
		self.base_total = base_total
		self.catch_rate = catch_rate
		self.experience_growth = experience_growth
		self.egg_group1 = egg_group1
		self.egg_group2 = egg_group2
'''
growth_dict = {"Slow": 1, "Medium Slow": 2, "Medium Fast": 3, "Fast": 4, "Fluctuating": 6, "Erratic": 6}
legend_dict = {"NULL": 1, "Sub-Legendary":2, "Legendary": 3, "Mythical": 4}
'''
def create_one_map_one_table(all_rows, option): 
	""" returns a 2D array and dictionary of one_map_one style data, 
	"""
	option_list = ["type1", "games_of_origin", "region", "experience_growth", "legendary_type", "egg_group1"]
	table = []
	dictionary = {}
	index = 1
	option = (option.strip()).lower()
	if option not in option_list:
		print("your option for one_map_one table is not valid!")
		return 
	for a_row in all_rows:
		str_data = str(getattr(a_row, option))
		if str_data not in dictionary:
			this_row = [index, str_data]
			table.append(this_row)
			dictionary[str_data] = index
			index = index + 1
	
	if option == "egg_group1" or option == "type1":
		table.append([52, "null"])
		dictionary["null"] = 52
	return table, dictionary

class ability:
	"""contain individual ability and its description"""
	def __init__(self, ability_name, description = None):
		self.ability_name = ability_name
		self.description = description
	def __hash__(self):
		return hash(self.ability_name)
	def __eq__(self, other):
		return (self.ability_name == other.ability_name)
def create_ability_table(all_rows):
	"""returns a 2D array and dictionary of ability ID, ability and description. Need a list of poke_row objects"""
	ability_table = []
	ability_dict = {}
	index = 1
	for poke_row in all_rows:
		primary_ability = ability(poke_row.primary_ability, poke_row.primary_ability_description)
		secondary_ability = ability(poke_row.secondary_ability, poke_row.secondary_ability_description)
		hidden_ability = ability(poke_row.hidden_ability, poke_row.hidden_ability_description)
		all_abilities = [primary_ability, secondary_ability, hidden_ability]
		for this_ability in all_abilities:
			if this_ability not in ability_dict:
				this_row = [index, this_ability.ability_name, this_ability.description]
				ability_table.append(this_row)
				ability_dict[this_ability] = index
				index = index + 1
	return ability_table, ability_dict

def create_main_table(type_dict, games_of_origin_dict, region_dict, experience_growth_dict, legendary_type_dict, ability_dict, egg_group_dict, all_rows):
	""" return main events table(that displays all the IDs accordingly) given the dictionary of 
		each of the elements in the table as a parameter.
		main table: "id", "pokedex_number", "name", "legendary_id", "type1_id", "type2_id", 
		"ability1_id", "ability2_id", "hidden_ability", "health", "attack", "defense", "special_attack", 
		"special_defense", "speed", "region_id", "catch_rate", "growth_type_id", "male_ratio", "game_id", 
		"egg_group1_id", "egg_group2_id"
	"""
	main_events_table = []
	for poke_row in all_rows:
		legendary_id = legendary_type_dict[poke_row.legendary_type]
		type1_id = type_dict[poke_row.type1]
		type2_id = type_dict[poke_row.type2]
		region_id = region_dict[poke_row.region]
		game_id = games_of_origin_dict[poke_row.games_of_origin]
		egg_group1_id = egg_group_dict[poke_row.egg_group1]
		egg_group2_id = egg_group_dict[poke_row.egg_group2]
		growth_type_id = experience_growth_dict[poke_row.experience_growth]

		ability1_id = ability_dict[ability(poke_row.primary_ability)]
		ability2_id = ability_dict[ability(poke_row.secondary_ability)]
		hidden_ability = ability_dict[ability(poke_row.hidden_ability)]

		this_row = [poke_row.pokemon_id, poke_row.pokedex_number, poke_row.pokemon_name, legendary_id, type1_id, 
		type2_id, ability1_id, ability2_id, hidden_ability, poke_row.health, poke_row.attack, poke_row.defense, 
		poke_row.special_attack, poke_row.special_defense, poke_row.speed, region_id, poke_row.catch_rate, 
		growth_type_id, poke_row.male_ratio, game_id, egg_group1_id, egg_group2_id]
		main_events_table.append(this_row)
	return main_events_table

def make_csv_row(this_row):
	if len(this_row) < 1:
		print("yooo! your row aint right!")
		return
	out_csv_row = str(this_row[0])
	for i in range(1, len(this_row)):
		csv_save_cell = str(this_row[i]).replace(",", "").replace('"', "(", 1)
		csv_save_cell = csv_save_cell.replace('"', ")")
		out_csv_row = out_csv_row + "," + csv_save_cell
	return (out_csv_row + '\n')	

def write_csv_table(table_list, file_name, header_list):
	"""print method to print the tables into a csv file given the table list, file name and the header of the individual columns """
	# example header_list ["ID", "country_three_letter", "full country_name"]
	num_col = len(table_list[0])
	if num_col != len(header_list):
		print("yooo! the number of cols between your list and header_list doesn't match!")
		return
	outfile = open(file_name, 'w')
	outfile.write(make_csv_row(header_list))
	# write database related tables to csv
	for row in table_list:
		outfile.write(make_csv_row(row))
	outfile.close()

def main():
	"""read-in source athlete_event.csv source, and create all the individual csv files for the database"""
	all_rows = []
	with open('pokemon_info_clean.csv') as file:
		read_in_file = list((csv.reader(file, skipinitialspace=True)))[2:]
	for i in range(len(read_in_file)):
		for j in range(len(read_in_file[i])):
			read_in_file[i][j] = read_in_file[i][j].replace('"', '').lower()
	for row in read_in_file:
		if len(row) > 1:
			# read in pokemon_id, pokedex_number, pokemon_name, legendary_type, type1, type2, primary_ability, 
			# primary_ability_description, secondary_ability, secondary_ability_description, hidden_ability, 
			# hidden_ability_description, male_ratio, female_ratio, games_of_origin, region, health, attack, 
			# defense, special_attack, special_defense, speed, base_total, catch_rate, experience_growth, 
			# egg_group1, egg_group2
			this_row = poke_row(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7],
			row[8], row[9], row[10], row[11], row[12], row[13], row[14], row[15], row[16], row[17], 
			row[18], row[19], row[20], row[21], row[22], row[23], row[24], row[25], row[26])
			all_rows.append(this_row)
	
	pokemon_table_header = ["id", "pokedex_number", "name", "legendary_id", "type1_id", "type2_id", 
	"ability1_id", "ability2_id", "hidden_ability", "health", "attack", "defense", "special_attack", 
	"special_defense", "speed", "region_id", "catch_rate", "growth_type_id", "male_percent", "game_id", 
	"egg_group1_id", "egg_group2_id"]
	
	type_table, type_dict = create_one_map_one_table(all_rows, "type1")
	egg_group_table, egg_group_dict = create_one_map_one_table(all_rows, "egg_group1")
	games_of_origin_table, games_of_origin_dict = create_one_map_one_table(all_rows, "games_of_origin")
	region_table, region_dict = create_one_map_one_table(all_rows, "region")
	experience_growth_table, experience_growth_dict = create_one_map_one_table(all_rows, "experience_growth")
	legendary_type_table, legendary_type_dict = create_one_map_one_table(all_rows, "legendary_type")

	write_csv_table(type_table, "type_table.csv", ["ID", "type"])
	write_csv_table(egg_group_table, "egg_group_table.csv", ["ID", "egg_group"])
	write_csv_table(games_of_origin_table, "games_of_origins_table.csv", ["ID", "games_of_origin"])
	write_csv_table(region_table, "region_table.csv", ["ID", "region"])
	write_csv_table(experience_growth_table, "experience_growth_table.csv", ["ID", "experience_growth"])
	write_csv_table(legendary_type_table, "legendary_type_table.csv", ["ID", "legendary_type"])

	ability_table, ability_dict = create_ability_table(all_rows)
	write_csv_table(ability_table, "ability_table.csv", ["ID", "ability", "ability_description"])
	
	main_table = create_main_table(type_dict, games_of_origin_dict, region_dict, experience_growth_dict, legendary_type_dict, ability_dict, egg_group_dict, all_rows)
	write_csv_table(main_table, "pokemon_table.csv", pokemon_table_header)

if __name__ == '__main__':
    main()