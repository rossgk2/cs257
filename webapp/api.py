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
        output_list.append(type_name)
    output_list.remove("NULL")
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

@api.route('/query/<order>')
def advance_query(order):
    query = '''SELECT DISTINCT pokemon_name pokemon_name, pokedex_number, 
    type_table_a.pokemon_type AS type1, type_table_b.pokemon_type AS type2, 
    ability_table_a.ability AS ability1, ability_table_b.ability AS ability2, ability_table_c.ability AS hidden_ability, 
    legendary_status, health, attack, special_attack AS s_attack, defense, special_defense AS s_defense, speed, region, 
    catch_rate, male_percent, game, egg_table_a.egg_group AS egg_group1, egg_table_b.egg_group AS egg_group2
    FROM pokemon
    JOIN types AS type_table_a ON pokemon.type1_id = type_table_a.id
    JOIN types AS type_table_b ON pokemon.type2_id = type_table_b.id

    JOIN egg_groups AS egg_table_a ON pokemon.egg_group1_id = egg_table_a.id
    JOIN egg_groups AS egg_table_b ON pokemon.egg_group2_id = egg_table_b.id

    JOIN abilities AS ability_table_a ON pokemon.ability1_id = ability_table_a.id
    JOIN abilities AS ability_table_b ON pokemon.ability2_id = ability_table_b.id
    JOIN abilities AS ability_table_c ON pokemon.hidden_ability = ability_table_c.id

    JOIN legendaries ON legendaries.id = pokemon.is_legendary
    JOIN regions ON regions.id = pokemon.region_id
    JOIN games ON games.id = pokemon.game_id
    WHERE pokedex_number BETWEEN %s AND %s '''

    # http://localhost:5000/api/query/ASC?type1=fire
    # http://localhost:5000/api/query/ASC?pokemon_name=an
    # http://localhost:5000/api/query/ASC?pokemon_name=an&ability1=battle_armor
    # http://localhost:5000/api/query/DESC?pokemon_name=an&order_by=pokemon_name
    # http://localhost:5000/api/query/ASC?pokemon_name=an&special_defense=50-100
    # http://localhost:5000/api/query/ASC?pokemon_name=an&catch_rate=0-50
    # http://localhost:5000/api/query/ASC?pokemon_name=an&male_percent=50-100&catch_rate=0-50

    user_pokedex_lower, user_pokedex_upper = flask.request.args.get('pokedex_lower'), flask.request.args.get('pokedex_upper')
    pokedex_lower = user_pokedex_lower if user_pokedex_lower else 0
    pokedex_upper = user_pokedex_upper if user_pokedex_upper else 809
    # print('TYPE pokedex_lower is :', type(pokedex_lower), file=sys.stderr)
    
    query_parameters = [pokedex_lower, pokedex_upper]

    if flask.request.args.get('pokemon_name'):
        like_arguments = '%' + flask.request.args.get('pokemon_name') + '%'
        query = query + ''' \n AND pokemon_name LIKE %s'''
        query_parameters.append(like_arguments)

    if flask.request.args.get('type1'):
        type1 = flask.request.args.get('type1')
        query = query + '''\n AND type_table_a.pokemon_type = %s '''
        query_parameters.append(type1)
    
    if flask.request.args.get('type2'):
        query = query + '''\n AND type_table_b.pokemon_type = %s '''
        query_parameters.append(flask.request.args.get('type2'))
    
    if flask.request.args.get('ability1'):
        query = query + '''\n AND ability_table_a.ability = %s '''
        query_parameters.append(flask.request.args.get('ability1'))
    
    if flask.request.args.get('ability2'):
        query = query + '''\n AND ability_table_b.ability = %s '''
        query_parameters.append(flask.request.args.get('ability2'))

    if flask.request.args.get('hidden_ability'):
        query = query + '''\n AND ability_table_c.ability = %s '''
        query_parameters.append(flask.request.args.get('hidden_ability'))
    
    # same thing for egg groups
    # same for game, region, is_legendary

    for stat in ["health", "attack", "defense", "special_attack", "special_defense", "speed", "catch_rate", "male_percent"]:
        argument = flask.request.args.get(stat)
        if argument:
            lower_bound, upper_bound = argument.split("-")
            query = query + "\n AND " + stat + " BETWEEN %s AND %s "
            query_parameters.append(lower_bound)
            query_parameters.append(upper_bound)

    order_by = "pokedex_number"
    if flask.request.args.get('order_by'):
        order_by = flask.request.args.get('order_by')
        pokemon_info = ["pokedex_number", "pokemon_name", "is_legendary", "type1", "type2", 
        "ability1", "ability2", "hidden_ability", "health", "attack", "defense", "special_attack", 
        "special_defense", "speed", "region", "catch_rate", "male_percent", "game", "egg_group1", "egg_group2"]
    
    order = order.upper() # only ASC or DESC is allowed
    if order == "ASC":
        query = query + "\n ORDER BY {}".format(order_by)
    elif order == "DESC":
        query = query + "\n ORDER BY {} DESC".format(order_by)
    else:
        print("yooo, error, your order by must be one of these, and order must be ACS or DESC")
        print(pokemon_info)
        return
    
    if flask.request.args.get('limit'):
        query = query + "\n LIMIT %s"
        line_limit = int(flask.request.args.get('limit'))
        query_parameters.append(line_limit)
    

    db_connection = connect_database()
    cursor = db_connection.cursor()
    
    query = query + ";"
    query_parameters = tuple(query_parameters)
    print(cursor.mogrify(query, query_parameters))
    cursor.execute(query, query_parameters)
    print("my query is: ")
    print(cursor.query)
    
    output_list = []
    for row in cursor:
        name, pokedex_num, type1, type2, abi1, abi2, hid_abi, is_legendary, health, attack, defense, \
            s_attack, s_defense, speed, region, catch_rate, male_percent, game, egg1, egg2 = row
        output_list.append({"pokemon_name": name, "pokedex_number": pokedex_num, "is_legendary": is_legendary,
        "type1": type1, "type2": type2, "ability1": abi1, "ability2": abi2, "hidden_ability": hid_abi, 
        "health": health, "attack": attack, "defense": defense, "special_attack": s_attack, "special_defense": s_defense,
        "speed": speed, "region": region, "catch_rate": str(catch_rate), "male_percent": str(male_percent), "game": game,
        "egg_group1": egg1, "egg_group2": egg2})
    return json.dumps(output_list)