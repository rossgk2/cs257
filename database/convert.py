'''
Written by Ross Grogan-Kaylor and Sam Gloss.
'''

import pandas

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

def main():
    # Read from .csv files.
    athlete_events = pandas.read_csv(open("athlete_events.csv", "r"))
    noc_regions = pandas.read_csv(open("noc_regions.csv", "r"))

    # Preprocess .csv files.
    athlete_events = athlete_events.replace(",", "", regex = True) # Get rid of commas
    athlete_events = athlete_events.fillna("NULL") # Replace empty cells with "NULL". (https://code.likeagirl.io/how-to-use-python-to-remove-or-modify-empty-values-in-a-csv-dataset-34426c816347)

    # Set up pandas dataframes for each table.
    athlete_frame = sub_dataframe_from_cols(athlete_events, ["Name", "Sex", "Age", "Height", "Weight", "Team"])
    team_frame = sub_dataframe_from_cols(athlete_events, ["Team", "NOC"], ["TeamName", "NOC"])
    game_frame = sub_dataframe_from_cols(athlete_events, ["Year", "Season"])
    NOC_frame = sub_dataframe_from_cols(noc_regions, ["NOC", "region", "notes"])
    city_frame = sub_dataframe_from_cols(athlete_events, ["City"], drop_duplicates = True)
    sport_frame = sub_dataframe_from_cols(athlete_events, ["Sport"], drop_duplicates = True)
    event_frame = sub_dataframe_from_cols(athlete_events, ["Event"], drop_duplicates = True)

    # Write each pandas dataframe to a .csv file.
    dataframes = [athlete_frame, team_frame, game_frame, NOC_frame, city_frame, sport_frame, event_frame]
    file_prefixes = ["athletes", "teams", "games", "NOCs", "cities", "sports", "events"]

    for df, fp in zip(dataframes, file_prefixes):
        df.to_csv(fp + ".csv", index = False, header = False)

# Returns a pandas dataframe consisting of the columns from "dataframe" whose titles are listed in "header_list".
def sub_dataframe_from_cols(dataframe, header_list, drop_duplicates = False):
    if drop_duplicates:
        cols_list = [dataframe[h].drop_duplicates() for h in header_list]
    else:
        cols_list = [dataframe[h] for h in header_list]

    return pandas.concat(cols_list, axis = 1, keys = header_list)
    # The idea to use pandas.concat comes from https://www.kite.com/python/answers/how-to-create-a-pandas-dataframe-from-columns-in-other-dataframes-in-pythonom-columns-in-other-dataframes-in-python

main()