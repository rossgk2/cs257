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
    cols = ["pokedex_number"]
    pokemon_cols_list = [pokemon[c] for c in cols]
    pokemon_frame = pd.concat(pokemon_cols_list, axis=1)

    # Get types_frame.
    typesCol = np.unique(pokemon["primary_type"])
    types_frame = pd.DataFrame(typesCol)
    types_frame.columns = ["primary_type"] # Necessary for convert_row_indices() to work correctly

    # Insert the type1 column right before the Pokedex Number column.
    pokemon_frame["type1_id"] = convert_row_indices(pokemon, types_frame, "primary_type")

    # pokemon_frame.insert(loc=cols.index("pokedex_number"), column="type1", value = team_ids)

    # Write each pandas dataframe to a .csv file.
    pokemon_frame.to_csv("pokemon_pandas.csv", header = False)
    types_frame.to_csv("types_pandas.csv", header = False)

# df1_rows_to_df2(df1, df2, col_name)[i] is the row in df2 that corresponds (via col_name) to the ith row in df1.
def convert_row_indices(df1, df2, col_name):
    idx = pd.Index(df2[col_name])
    indexer = idx.get_indexer(df1[col_name])
    return df2.index[indexer]

    # We can imagine that the returned value from this function is constructed as follows:
    # - iterate down the column with column name "col_name" in df1
    # - for each element x of this column, find the index of the row in df2 that contains x, and add this index to a list
    # - return the list
    #
    # See # https://stackoverflow.com/questions/56658723/how-to-maintain-order-when-selecting-rows-in-pandas-dataframe.

main()