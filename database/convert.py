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

athlete_events = pd.read_csv(open("athlete_events.csv", "r"))
noc_regions = pd.read_csv(open("noc_regions.csv", "r"))

# Preprocess .csv files.
athlete_events = athlete_events.replace(",", "", regex = True) # Get rid of commas
athlete_events = athlete_events.fillna("NULL") # Replace empty cells with "NULL". (https://code.likeagirl.io/how-to-use-python-to-remove-or-modify-empty-values-in-a-csv-dataset-34426c816347)

def main():
    teams_frame = get_teams_frame_with_repeats()

    cols = ["ID", "Name", "Sex", "Age", "Height", "Weight", "Games", "City", "Sport", "Event", "Medal"]
    athletes_cols_list = [athlete_events[c] for c in cols]
    athletes_frame = pd.concat(athletes_cols_list, axis = 1)
    athletes_frame.insert(loc = cols.index("Games"), column = "team_id", value = athletes_frame.index)

    # Write each pandas dataframe to a .csv file.
    dataframes = [athletes_frame, teams_frame]
    file_prefixes = ["athletes", "teams"]

    for df, fp in zip(dataframes, file_prefixes):
        if df is not None:
            df.to_csv(fp + ".csv", header = False)

def get_teams_frame_with_repeats():
    # ae_to_noc_rows[i] will be the row in noc_regions that corresponds (via NOC names) to the ith row in athlete_events.
    #
    # We can imagine ae_to_noc_rows being constructed as follows: for each NOC name in athlete_events, find the row in
    # noc_regions that contains that NOC name and add it to ae_to_noc_rows. After sort ae_to_noc_rows is filled,
    # do NOT sort it.
    #
    # See # https://stackoverflow.com/questions/56658723/how-to-maintain-order-when-selecting-rows-in-pandas-dataframe.
    idx = pd.Index(noc_regions["NOC"])
    NOCindexer = idx.get_indexer(athlete_events["NOC"])
    ae_to_noc_rows = noc_regions.index[NOCindexer]

    NOCs = noc_regions.iloc[ae_to_noc_rows, :]
    NOCs = NOCs.reset_index()  # See https://stackoverflow.com/a/45056184.

    # When we use ["Team"] inside the indexing operation instead of "Team", the result is a DataFrame instead of a Series.
    return athlete_events[["Team"]].join(NOCs, how = "outer")

main()
