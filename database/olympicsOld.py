##Made by Ross Grogan-Kaylor and Sam Gloss
import argparse
import csv
import sys


def get_parsed_arguments():
    '''
    parses arguments into an array of names, publish dates, and authors
    '''
    parser = argparse.ArgumentParser(description='Sort/filter a CSV formatted list of books and authors')
    parser.add_argument('--athletesfrom', '-a', help='lists every athlete from a given NOC')
    parser.add_argument('--nocbymedals', '-n', help='lists every NOC by total gold medals (decreasing order). needs an argument to run but what argument is doesnt matter')
    parser.add_argument('--events', '-e', help='lists every athlete who has competed in the listed event')
  
    parsed_arguments = parser.parse_args()
    return parsed_arguments
  
def get_athletes_from_NOC(NOC, athlete_list, teams):
  '''
  is given an NOC then it returns a list of every athlete from the specified NOC. If the NOC doesn't exist or has no athletes, it returns an empty list
  '''
  noc_ID = NOC_to_ID(NOC, teams)
  athletes_from_NOC = []
 
  for athlete in athlete_list:
    if athlete[6] == noc_ID:
      if athlete[1] not in athletes_from_NOC:
        athletes_from_NOC.append(athlete[1])
  return athletes_from_NOC


def NOC_to_ID(NOC, teams):
  '''
  is given an NOC (whether abreviation or full name or notes region) and converts it to a country ID
  '''
  for team in teams:
    if NOC in team:
      return team[0]
  print("invalid NOC. Please try again.")
  sys.exit

def ID_to_NOC(ID, teams):
  '''
  is given an ID (whether abreviation or full name or notes region) and converts it to a NOC
  '''
  for team in teams:
    if ID in team:
      return team[2]
  print("invalid ID. Please try again.")
  sys.exit



def get_list_of_NOCS_by_gold_medals_descending():
  '''
  returns a list of gold medals a country has won in descending order
  '''
  teams = get_teams()
  athlete_list = get_athletes()
  NOC_medal_ordered_list = []
  for team in teams:
    team_medals = []
    team_medals.append(team[2])
    team_medals.append(get_athletes_from_NOC_golds(team[2], athlete_list, teams))
    if len(NOC_medal_ordered_list) > 0:
      index = 0
      for medals in NOC_medal_ordered_list:
        if medals[1] < team_medals[1]:
          NOC_medal_ordered_list.insert(index, team_medals)
          break
        elif team_medals[1] == 0:
          NOC_medal_ordered_list.append(team_medals)
          break
        else:
          index += 1
      #if it didn't break
      #NOC_medal_ordered_list.append(team_medals)
    else:
      NOC_medal_ordered_list.append(team_medals)
  cleaned_list = []
  for team in NOC_medal_ordered_list:
    if team not in cleaned_list:
      cleaned_list.append(team)

  
  return cleaned_list






def get_athletes_from_NOC_golds(NOC, athlete_list, teams):
  '''
  is given an NOC then it returns a list of every medal from the specified NOC. If the NOC doesn't exist or has no athletes, it returns an empty list
  '''
  noc_ID = NOC_to_ID(NOC, teams)
  gold_count = 0
  for athlete in athlete_list:
    if athlete[6] == noc_ID:
      if athlete[11] == "Gold":
          gold_count += 1
  return gold_count

def get_athletes_in_event(event, athlete_list):
  '''
  is given an event then it returns a list of every athlete that has competed in sed event. If the event doesn't exist or has no athletes, it returns an empty list
  '''
  athletes_competed = []
 
  for athlete in athlete_list:
    if athlete[9].lower() == event.lower():
      if athlete[1] not in athletes_competed:
        athletes_competed.append(athlete[1])
  return athletes_competed

def print_args(list_of_args):
  '''
  is given a list of args, then it formats them pretty and prints them
  '''
  for args in list_of_args:
    print(args)
    

def get_teams():
  '''
   converts teams.csv to a list
  '''
  teams = []
  with open('teams.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    for row in reader:
        teams.append(row)
  return teams

def get_athletes():
  '''
   converts athletes.csv to a list
  '''
  athletes = []
  with open('athletes.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    for row in reader:
        athletes.append(row)
  return athletes


def main():
  '''
  parses command line arguments, and calls appropriate function for given commands, as well as the functions for printing the results
  '''
  arguments = get_parsed_arguments()

  if arguments.athletesfrom:
    athletes_from_noc = get_athletes_from_NOC(arguments.athletesfrom, get_athletes(), get_teams())
    print_args(athletes_from_noc)
  
  if arguments.nocbymedals:
    most_medals_list = get_list_of_NOCS_by_gold_medals_descending()
    print_args(most_medals_list)

  if arguments.events:
    athlete_event_list = get_athletes_in_event(arguments.events, get_athletes())
    print_args(athlete_event_list)

if __name__ == "__main__":
    main()
  
