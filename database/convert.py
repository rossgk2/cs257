'''
Written by Ross Grogan-Kaylor and Sam Gloss.
'''

import pandas

'''
====================================================
OUTLINE OF DATABASE DESIGN
====================================================

FIELDS WITH TABLES
- athlete: SERIAL, name, sex, age, height, weight, team
- team: SERIAL, team_name, NOC
- games: SERIAL, year, season 
- NOC: SERIAL, region, notes (use noc_regions.csv)
- city: SERIAL, city
- sport: SERIAL, sport
- event: SERIAL, event

FIELDS WITHOUT TABLES
- height, weight, sex, age, year, medal
'''

def main():
    # Read from .csv files.
    athlete_events = pandas.read_csv(open("athlete_events.csv", "r"))
    noc_regions = pandas.read_csv(open("noc_regions.csv", "r"))

    # Set up pandas dataframes for each table.
    athlete_frame = sub_dataframe_from_cols(athlete_events, ["Name", "Sex", "Age", "Height", "Weight", "Team"])
    team_frame = sub_dataframe_from_cols(athlete_events, ["Team", "NOC"], ["Team-name", "NOC"])
    game_frame = sub_dataframe_from_cols(athlete_events, ["Year", "Season"])
    NOC_frame = sub_dataframe_from_cols(noc_regions, ["NOC", "region", "notes"], ["NOC", "Region", "Notes"])
    city_frame = sub_dataframe_from_cols(athlete_events, ["City"])
    sport_frame = sub_dataframe_from_cols(athlete_events, ["Sport"])
    event_frame = sub_dataframe_from_cols(athlete_events, ["Event"])

    # Write each pandas dataframe to a .csv file.
    dataframes = [athlete_frame, team_frame, game_frame, NOC_frame, city_frame, sport_frame, event_frame]
    file_prefixes = ["athlete", "team", "game", "NOC", "city", "sport", "event"]

    for df, fp in zip(dataframes, file_prefixes):
        df.to_csv(fp + ".csv")

# Returns a pandas dataframe consisting of the columns from "dataframe" whose titles are listed in "header_list".
# The header titles in "new_headers" are the titles (in order) that are used in for the new dataframe.
# By default, new_headers = header_list.
def sub_dataframe_from_cols(dataframe, header_list, new_headers = None):
    if new_headers is None:
        new_headers = header_list

    cols_list = [dataframe[h].drop_duplicates() for h in header_list]
    return pandas.concat(cols_list, axis = 1, keys = new_headers)
    # The idea to use pandas.concat comes from https://www.kite.com/python/answers/how-to-create-a-pandas-dataframe-from-columns-in-other-dataframes-in-python

#athlete_list = [athlete_events["Name"], athlete_events["Sex"], athlete_events["Age"], athlete_events["Height"], athlete_events["Weight"], athlete_events["Team"]]
#athlete_headers = ["Name", "Sex", "Age", "Height", "Weight", "Team"]
#athlete_frame = pandas.concat(athlete_list, axis=1, keys=athlete_headers)

main()