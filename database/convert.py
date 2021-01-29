'''
Written by Ross Grogan-Kaylor and Sam Gloss.
'''

import numpy as np
import pandas as pd

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
    # noc_regions that contains that NOC name and add it to ae_to_noc_rows. After sort ae_to_noc_rows after is filled,
    # do NOT sort it.
    #
    # See # https://stackoverflow.com/questions/56658723/how-to-maintain-order-when-selecting-rows-in-pandas-dataframe.
    idx = pd.Index(noc_regions["NOC"])
    NOCindexer = idx.get_indexer(athlete_events["NOC"])
    ae_to_noc_rows = noc_regions.index[NOCindexer]

    NOCs = noc_regions.iloc[ae_to_noc_rows, :]
    NOCs = NOCs.reset_index() # See https://stackoverflow.com/a/45056184.
    teams_frame = athlete_events[["Team"]].join(NOCs, how = "outer") # When we use ["Team"] inside the indexing operation instead of "Team", the result returns a DataFrame instead of a Series

    add_ids(teams_frame)

    # Write each pandas dataframe to a .csv file.
    #dataframes = [None, None, None, team_frame, None, None, None]
    #file_prefixes = ["athletes", "teams", "games", "teams", "cities", "sports", "events"]

    #for df, fp in zip(dataframes, file_prefixes):
    #    if df is not None:
    #        df.to_csv(fp + ".csv", index = False, header = False)

    teams_frame.to_csv("teams" + ".csv", index = False, header = False)

# Returns a pandas dataframe consisting of the columns from "dataframe" whose titles are listed in "header_list".
def sub_dataframe_from_cols(dataframe, header_list, drop_duplicates = False):
    cols_list = [dataframe[h] for h in header_list]
    if drop_duplicates:
        cols_list = [c.drop_duplicates() for c in cols_list]

    return pd.concat(cols_list, axis = 1, keys = header_list)
    # The idea to use pandas.concat comes from https://www.kite.com/python/answers/how-to-create-a-pandas-dataframe-from-columns-in-other-dataframes-in-pythonom-columns-in-other-dataframes-in-python

def add_ids(dataframe):
    ids = np.linspace(start = 0, stop = dataframe.shape[0] - 1, num = dataframe.shape[0])
    dataframe.insert(loc = 0, column = "ids", value = ids)

main()
