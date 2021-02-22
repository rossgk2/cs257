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

@api.route('/abilities') 
def get_abilities():
    query = "SELECT * FROM abilities;"
    cursor = connect_database().cursor()
    cursor.execute(query)
    output_list = []
    for row in cursor:
        index, ability, ability_description = row
        output_list.append({'abilities': ability})
    return json.dumps(output_list)

@api.route('/types')
def get_types():
    query = "SELECT * FROM types;"
    db_connection = connect_database()
    cursor = db_connection.cursor()
    cursor.execute(query)
    output_list = []
    for row in cursor:
        index, type_name = row
        output_list.append({'types': type_name})
    return json.dumps(output_list)

@api.route('/regions')
def get_regions():
    query = "SELECT * FROM regions;"
    db_connection = connect_database()
    cursor = db_connection.cursor()
    cursor.execute(query)
    output_list = []
    for row in cursor:
        index, region = row
        output_list.append({'regions': region})
    return json.dumps(output_list)
