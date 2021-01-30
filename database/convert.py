'''
Written by Ross Grogan-Kaylor and Sam Gloss.
'''

import numpy as np
import pandas as pd

athlete_events = pd.read_csv(open("athlete_events.csv", "r"))
noc_regions = pd.read_csv(open("noc_regions.csv", "r"))

# Preprocess .csv files.
athlete_events = athlete_events.replace(",", "", regex = True) # Get rid of commas
athlete_events = athlete_events.fillna("NULL") # Replace empty cells with "NULL". (https://code.likeagirl.io/how-to-use-python-to-remove-or-modify-empty-values-in-a-csv-dataset-34426c816347)

def main():
    # Get the teams frame and the teams_index, which will describe how the rows in athletes_frame
    # correspond to those in teams_frame.
    (teams_frame, teams_index) = get_teams_frame_and_index()

    # Initialize athletes_frame with all of its columns except for the Team_ID column.
    cols = ["ID", "Name", "Sex", "Age", "Height", "Weight", "Games", "City", "Sport", "Event", "Medal"]
    athletes_cols_list = [athlete_events[c] for c in cols]
    athletes_frame = pd.concat(athletes_cols_list, axis = 1)

    # Insert the Team_ID column right before the Games column.
    teams_frame = teams_frame.drop_duplicates(subset = "NOC") # Each row should have a unique entry in the "NOC" column
    athletes_frame.insert(loc = cols.index("Games"), column = "Team_ID", value = teams_index)

    # Decrement 1 from the "ID" column to use 0-based indexing.
    athletes_frame["ID"] -= 1

    # Write each pandas dataframe to a .csv file.
    athletes_frame.to_csv("athletes.csv", index = False, header = False)
    teams_frame.to_csv("teams.csv", index = True, header = False)

# Returns (teams_frame, teams_index).
# - teams_frame is a DataFrame consisting of the rows of noc_regions that match up (in terms of the "Team" column)
# to the rows of athlete_events.
# - teams_index is an Index (essentially a sequence of integers) whose ith entry is the index of the row in teams_frame
# that corresponds to the ith row in teams_frame
#
def get_teams_frame_and_index():
    # ae_to_noc_rows[i] will be the row in noc_regions that corresponds (via NOC names) to the ith row in athlete_events.
    ae_to_noc_rows = df1_rows_to_df2(athlete_events, noc_regions, "NOC")

    # Now use ae_to_noc_rows to grab the rows from noc_regions that we want.
    NOCs = noc_regions.iloc[ae_to_noc_rows, :]

    # Since the above has selected some particular rows from NOCs, the indices of the rows in NOCs may now be something
    # like 5, 7, 10, ... We now reset these indices to be 1, 2, 3...
    teams_index = NOCs.index
    NOCs = NOCs.reset_index(drop = False) # Use drop = False so that the old indices aren't stored as a column in the returned DataFrame.

    # Join the team names from athlete_events with the team NOC information. (Note: when we use ["Team"] inside the
    # indexing operation instead of "Team", the result is a DataFrame instead of a Series).
    teams_frame = athlete_events[["Team"]].join(NOCs, how = "outer")

    # Remove rows that have the same team name. Note, the id's/indices of each row do not get reset, which is what we want.
    # (No index resetting means that the id of the ith row in teams_frame is still equal to the id of the corresponding row
    # in athlete_events).
    teams_frame.drop_duplicates(subset = "Team")
    return (teams_frame, teams_index)

# df1_rows_to_df2(df1, df2, col_name)[i] is the row in df2 that corresponds (via col_name) to the ith row in df1.
def df1_rows_to_df2(df1, df2, col_name):
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
