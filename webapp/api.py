'''
    api.py
    Jimmy Zhong and Ross Grogan-Kaylor, CS257 Carleton College, Professor Jeff Ondich
    Final Project 2021 Feburary 
'''
import sys
import flask
import json
import config
import psycopg2

api = flask.Blueprint('api', __name__)

''' Jimmy's old code of executing querys, DON'T USE IT. Need to pass in parameter as safe sql string
def execute_query(connection, query):
    try:
        cursor = connection.cursor()
        query_command = "\n".join(query)
        print(query_command)
        cursor.execute(query_command)
        return cursor
    except Exception as search_not_sucessful:
        print(search_not_sucessful)
        exit()
'''

def connect_database():
    ''' return a connection object to the postgres database, which is passed down for querying'''
    from config import database
    from config import user
    from config import password
    try:
        connection = psycopg2.connect(database = database, user= user, password = password)
        print("connection successful!")
        return connection
    except Exception as e:
        print(e)
        exit()

@api.route('/cats/') 
def get_cats():
    # Of course, your API will be extracting data from your postgresql database.
    # To keep the structure of this tiny API crystal-clear, I'm just hard-coding data here.
    cats = [{'name':'Emma', 'birth_year':1983, 'death_year':2003, 'description':'the boss'},
            {'name':'Aleph', 'birth_year':1984, 'death_year':2002, 'description':'sweet and cranky'},
            {'name':'Curby', 'birth_year':1999, 'death_year':2000, 'description':'gone too soon'},
            {'name':'Digby', 'birth_year':2000, 'death_year':2018, 'description':'the epitome of Cat'},
            {'name':'Max', 'birth_year':1998, 'death_year':2009, 'description':'seismic'},
            {'name':'Scout', 'birth_year':2007, 'death_year':None, 'description':'accident-prone'}]
    return json.dumps(cats)

@api.route('/dogs/') 
def get_dogs():
    dogs = [{'name':'Ruby', 'birth_year':2003, 'death_year':2016, 'description':'a very good dog'},
            {'name':'Maisie', 'birth_year':2017, 'death_year':None, 'description':'a very good dog'}]
    return json.dumps(dogs)

@api.route('/types/')
def get_types():
    ''' Return all nocs and the fully spelled out nation/region names'''
    query = "SELECT * FROM types;"
    db_connection = connect_database()
    cursor = db_connection.cursor()
    cursor.execute(query)
    output_list = []
    for row in cursor:
        index, type_name = row
        output_list.append({'index':index, 'type_name': type_name})
    return json.dumps(output_list)

