'''
Written by Ross Grogan-Kaylor and Jimmy Zhong.
'''

import numpy as np
import pandas as pd

def main():
	# Load the .csv. The first row in the .csv has no relevant data, so skip it.
	pokemon = pd.read_csv(open("pokemon_info_clean.csv", "r"), skiprows = 1)

	# Preprocess the pokemon DataFrame.
	pokemon = pokemon.replace(",", "", regex = True) # Get rid of commas
	pokemon = pokemon.replace("\"", "", regex = True) # Get rid of single and double quotes
	pokemon = pokemon.replace(" ", "_", regex = True) # Replace spaces with underscores
	pokemon = pokemon.applymap(lambda s: s.lower() if type(s) == str else s) # Make all strings lowercase
	pokemon = pokemon.fillna("NULL")  # Replace empty cells with "NULL". (https://code.likeagirl.io/how-to-use-python-to-remove-or-modify-empty-values-in-a-csv-dataset-34426c816347)

	# Do the same sort of preprocessing for the column names of the pokemon DataFrame.
	new_cols = pokemon.columns.str.replace(" ", "_", regex = True)
	new_cols = new_cols.str.lower()
	pokemon.columns = new_cols
	pokemon = pokemon.drop(columns = ["pokemon_id"]) # The pokemon_id column is not actually a unique identifier; we don't need it

	# Initialize pokemon_frame to contain all of the columns from pokemon in the list cols.
	cols = ["pokedex_number", "pokemon_name", "health_stat", "attack_stat",
			"defense_stat", "special_attack_stat", "special_defense_stat", "speed_stat", "catch_rate", "male_ratio"]
	pokemon_cols_list = [pokemon[c] for c in cols]
	pokemon_frame = pd.concat(pokemon_cols_list, axis=1)

	# Rename the columns in the pokemon_frame. (The names chosen are weird- we want to use better-chosen names).
	pokemon_frame.columns = ["pokedex_number", "name", "health", "attack",
							 "defense", "special_attack", "special_defense", "speed", "catch_rate", "male_percent"]

	# Create subframes for each column that will have its own linking table, and put the correct linking id's into pokemon_frame for each such column.

	# Legendary.
	legendary_frame = get_subframe(pokemon, old_col_name= "legendary_type")
	insert_id_column(pokemon, pokemon_frame, legendary_frame, insert_after_name = "name", old_col_name = "legendary_type", new_col_name = "legendary_id")

	# Types.
	types_frame = get_subframe(pokemon, old_col_name = "primary_type", new_col_name = "type")
	insert_id_column(pokemon, pokemon_frame, types_frame, insert_after_name = "legendary_id", old_col_name = "primary_type", new_col_name = "type1_id")
	insert_id_column(pokemon, pokemon_frame, types_frame, insert_after_name = "type1_id", old_col_name = "secondary_type", new_col_name = "type2_id")

	# Abilities.
	abilities_frame = get_subframe(pokemon, old_col_name = "primary_ability")
	insert_id_column(pokemon, pokemon_frame, abilities_frame, insert_after_name = "type2_id", old_col_name = "primary_ability", new_col_name = "ability1_id")
	insert_id_column(pokemon, pokemon_frame, abilities_frame, insert_after_name = "ability1_id", old_col_name = "secondary_ability", new_col_name = "ability2_id")
	insert_id_column(pokemon, pokemon_frame, abilities_frame, insert_after_name = "ability2_id", old_col_name = "hidden_ability", new_col_name = "hidden_ability_id")
	abilities_descriptions = pokemon[["primary_ability", "primary_ability_description"]].drop_duplicates(subset=['primary_ability'])
	abilities_frame = abilities_frame.merge(abilities_descriptions, how='left', left_on='primary_ability', right_on='primary_ability')
	abilities_frame.columns = ["ability", "description"]

	# Regions.
	regions_frame = get_subframe(pokemon, old_col_name = "region_of_origin")
	insert_id_column(pokemon, pokemon_frame, regions_frame, insert_after_name = "speed", old_col_name = "region_of_origin", new_col_name = "region")

	# Game (e.g. FireRed, LeafGreen, Diamond, Pearl).
	games_frame = get_subframe(pokemon, old_col_name = "game(s)_of_origin")
	insert_id_column(pokemon, pokemon_frame, games_frame, insert_after_name = "male_percent", old_col_name = "game(s)_of_origin", new_col_name = "game")

	# Egg groups.
	egg_groups_frame = get_subframe(pokemon, old_col_name = "primary_egg_group", new_col_name = "egg_group")
	insert_id_column(pokemon, pokemon_frame, egg_groups_frame, insert_after_name = "game", old_col_name = "primary_egg_group", new_col_name = "egg_group1_id")
	insert_id_column(pokemon, pokemon_frame, egg_groups_frame, insert_after_name = "egg_group1_id", old_col_name = "secondary_egg_group", new_col_name = "egg_group2_id")

	# Replace all instances of "-1" in pokemon_frame with "NULL".
	pokemon_frame = pokemon_frame.astype(str).replace("-1", "NULL", regex = True) #.astype(str) needed since otherwise -1 considered to be an int

	# Write each DataFrame to a .csv file.
	dataframes = [pokemon_frame, legendary_frame, types_frame, abilities_frame, regions_frame, games_frame, egg_groups_frame]
	filenames = ["pokemon", "legendaries", "types", "abilities", "regions", "games", "egg_groups"]
	for (df, f) in zip(dataframes, filenames):
		df.to_csv(f + "_pandas.csv", header = False)

# Returns a DataFrame containing all distinct entries in the column old_col_name, and inserts an id column into pokemon_frame
# that links pokemon_frame to the returned DataFrame.
def get_subframe(pokemon, old_col_name, new_col_name = None):
	# Make the DataFrame to be returned.
	col = np.unique(pokemon[old_col_name])
	subframe = pd.DataFrame(col)
	if new_col_name:
		subframe.columns = [new_col_name]
	else:
		subframe.columns = [old_col_name]
	return subframe

def insert_id_column(pokemon, pokemon_frame, to_insert, insert_after_name, old_col_name, new_col_name):
	id_col = convert_row_indices(pokemon, to_insert, old_col_name)
	insertion_location = list(pokemon_frame.columns).index(insert_after_name) + 1
	pokemon_frame.insert(loc = insertion_location, column = new_col_name, value = id_col)

# df1_rows_to_df2(df1, df2, col_name)[i] is the row in df2 that corresponds (via col_name) to the ith row in df1.
def convert_row_indices(df1, df2, col_name):
	df2_first_col = df2.iloc[:, 0]
	df2_index = pd.Index(df2_first_col)
	indexer = df2_index.get_indexer(df1[col_name])
	result = df2.index[indexer]

	# At this point, we might think that we can return result and be done. However...
	# Some entries in indexer were -1 (i.e. NULL). Unfortunately, this -1 is interpreted to mean "last element" by the previous line,
	# so any -1 in indexer in fact refers to the last element of df2.index. We want to preserve the interpretation of -1 as NULL, so
	# we do the following.

	result = result.to_numpy() # Index objects are immutable; convert to numpy array so that we can modify final result
	result[indexer == -1] = -1
	return result

	# We can imagine that the returned value from this function is constructed as follows:
	# - iterate down the column with column name "col_name" in df1
	# - for each element x of this column, find the index of the row in df2 that contains x, and add this index to a list
	# - return the list
	#
	# See # https://stackoverflow.com/questions/56658723/how-to-maintain-order-when-selecting-rows-in-pandas-dataframe.

main()