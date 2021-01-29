'''
Written by Ross Grogan-Kaylor and Sam Gloss.
'''

# https://stackoverflow.com/questions/21800169/python-pandas-get-index-of-rows-which-column-matches-certain-value

import pandas as pd
import numpy as np

'''
====================================================
OUTLINE OF DATABASE DESIGN
====================================================

FIELDS WITH TABLES
- athletes: SERIAL, name, sex, age, height, weight, team
- teams: SERIAL, team_name, NOC
- games: SERIAL, year, season 
- NOCs: SERIAL, region, notes (use noc_regions.csv)
- cities: SERIAL, city
- sports: SERIAL, sport
- events: SERIAL, event

FIELDS WITHOUT TABLES
- height, weight, sex, age, year, medal
'''

'''
After this program runs, must use syntax such as

\COPY athletes (Name, Sex, Age, Height, Weight, Team) FROM 'athletes.csv' DELIMITER ',' CSV NULL AS 'NULL';

to load .csv files into psql. Simply using 

\COPY athletes FROM 'athletes.csv' DELIMITER ',' CSV NULL AS 'NULL';

does not work, because the psql attempt to read in a string value for the SERIAL id field.

'''

def main():
    # Read from .csv files.
    athlete_events = pd.read_csv(open("athlete_events.csv", "r"))
    noc_regions = pd.read_csv(open("noc_regions.csv", "r"))

    # Preprocess .csv files.
    athlete_events = athlete_events.replace(",", "", regex = True) # Get rid of commas
    athlete_events = athlete_events.fillna("NULL") # Replace empty cells with "NULL". (https://code.likeagirl.io/how-to-use-python-to-remove-or-modify-empty-values-in-a-csv-dataset-34426c816347)

    # ae_to_noc_rows[i] will be the row in noc_regions that corresponds (via NOC names) to the ith row in athlete_events.
    #
    # We can imagine ae_to_noc_rows being constructed as follows: for each NOC name in athlete_events, find the row in
    # noc_regions that contains that NOC name. Store the list of these rows in the order that they are discovered in ae_to_noc_rows.
    # See # https://stackoverflow.com/questions/56658723/how-to-maintain-order-when-selecting-rows-in-pandas-dataframe.
    idx = pd.Index(noc_regions["NOC"])
    NOCindexer = idx.get_indexer(athlete_events["NOC"])
    ae_to_noc_rows = noc_regions.index[NOCindexer]



    #NOC_cols = [noc_regions[c] for c in NOCs]
    #team_cols = [athlete_events[c] for c in ["Team", "NOC"]]

    #team_frame = pandas.concat(team_cols + NOC_cols, axis = 1)
    #add_ids(team_frame)

    # Write each pandas dataframe to a .csv file.
    #dataframes = [None, None, None, team_frame, None, None, None]
    #file_prefixes = ["athletes", "teams", "games", "teams", "cities", "sports", "events"]

    #for df, fp in zip(dataframes, file_prefixes):
    #    if df is not None:
    #        df.to_csv(fp + ".csv", index = False, header = False)

    #team_frame.to_csv("teams" + ".csv", index=False, header=False)

# Returns a pandas dataframe consisting of the columns from "dataframe" whose titles are listed in "header_list".
def cols_from_dataframe(dataframe, header_list, drop_duplicates = False):
    cols_list = [dataframe[h] for h in header_list]
    if drop_duplicates:
        cols_list = [c.drop_duplicates() for c in cols_list]

    return cols_list

def add_ids(dataframe):
    dataframe.insert(loc = 0, column = "NOC_id", value = np.linspace(start = 0, stop = dataframe.shape[0] - 1, num = dataframe.shape[0]))

# Find the row in noc_regions["NOC"] that each NOC name occupies; if the row does not exist, store -1.
# NOCs = athlete_events["NOC"]
# rows = []
# i = 0
# for n in NOCs:
#     row = noc_regions.index[noc_regions["NOC"] == n]
#     if len(row) == 0:
#         row = pd.Int64Index([-1])  # If no rows were found, store -1 in the list as a placeholder.
#     elif len(row) > 1:
#     print("Uh oh. Multiple rows were selected: {}".format(row))
#
#     rows.append(row)
#     if i == 4:
#         break
#     i += 1

main()