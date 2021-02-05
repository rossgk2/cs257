#!/usr/bin/env python3
'''
    api-test.py
    Jeff Ondich, 11 April 2016
    Updated 7 October 2020

    An example for CS 257 Software Design. How to retrieve results
    from an HTTP-based API, parse the results (JSON in this case),
    and manage the potential errors.
'''

import sys
import argparse
import json
import urllib.request

API_BASE_URL = "http://pokeapi.co/api/v2/"

def get_pokemon_abilities(pokemon):
    url = f"{API_BASE_URL}/pokemon/{pokemon}"
    data_from_server = urllib.request.urlopen(url).read()
    string_from_server = data_from_server.decode("utf-8")
    json = json.loads(string_from_server)
    abilities = json["abilities"]
    abilities_names = [a.name for a in abilities]
    return abilities_names

def main(args):
    abilities = get_pokemon_abilities(args.pokemon)
    print(abilities)
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Get abilities of a given Pokemon')
    parser.add_argument("pokemon")
    args = parser.parse_args()

    main(args)
