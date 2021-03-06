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

@api.route('/abilities') 
def get_abilities():
    query = "SELECT * FROM abilities;"
    cursor = connect_database().cursor()
    cursor.execute(query)
    output_list = []
    for row in cursor:
        index, ability, ability_description = row
        output_list.append(ability)
    output_list.remove("NULL")
    return json.dumps(output_list)

@api.route('/legendaries')
def get_legendaries():
    query = "SELECT * FROM legendaries;"
    db_connection = connect_database()
    cursor = db_connection.cursor()
    cursor.execute(query)
    output_list = []
    for row in cursor:
        index, type_name = row
        output_list.append(type_name)
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
        output_list.append(region)
    return json.dumps(output_list)

@api.route('/games')
def get_games():
    query = "SELECT * FROM games;"
    db_connection = connect_database()
    cursor = db_connection.cursor()
    cursor.execute(query)
    output_list = []
    for row in cursor:
        index, game = row
        output_list.append(game)
    return json.dumps(output_list)

@api.route('/egg_groups')
def get_egg_groups():
    query = "SELECT * FROM egg_groups;"
    db_connection = connect_database()
    cursor = db_connection.cursor()
    cursor.execute(query)
    output_list = []
    for row in cursor:
        index, egg_group = row
        output_list.append(egg_group)
    output_list.remove("NULL")
    return json.dumps(output_list)

# use script calculate_effect.py, not the database
@api.route('/supereffect_cal/<my_type1>/<my_type2>')
def get_supereffect(my_type1, my_type2):
    my_type1 = my_type1.lower()
    my_type2 = my_type2.lower()
    # not finish yet
    return

@api.route('advanced_search/<order>')
def advanced_search(order):
    ''' 
    Examples of how to use this endpoint:
    http://localhost:5000/api/advanced_search/ASC?type1=fire
    http://localhost:5000/api/advanced_search/ASC?pokemon_name=an
    http://localhost:5000/api/advanced_search/ASC?pokemon_name=an&ability1=battle_armor
    http://localhost:5000/api/advanced_search/DESC?pokemon_name=an&order_by=pokemon_name
    http://localhost:5000/api/advanced_search/ASC?pokemon_name=an&special_defense=50-100
    http://localhost:5000/api/advanced_search/ASC?pokemon_name=an&catch_rate=0-50
    http://localhost:5000/api/advanced_search/ASC?pokemon_name=an&male_percent=50-100&catch_rate=0-50
    '''

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

    # Restrict the range of Pokedex ID's based on user input.
    pokedex_id_range = [0, 809] # default pokedex range, the picture of pokedex > 809 are usually lacking
    if flask.request.args.get('pokedex_lower'):
        pokedex_id_range[0] = flask.request.args.get('pokedex_lower')
    if flask.request.args.get('pokedex_upper'):
        pokedex_id_range[1] = flask.request.args.get('pokedex_upper')

    # Now add the API arguments to the SQL query.
    api_arg_to_sql_condition = {"pokemon_name" : "pokemon_name LIKE %s", "legendary_status" : "legendaries.legendary_status = %s",
    "type1" : "type_table_a.pokemon_type = %s", "type2" : "type_table_b.pokemon_type = %s", "ability1" : "ability_table_a.ability = %s",
    "ability2" : "ability_table_b.ability = %s", "hidden_ability" : "ability_table_c.ability = %s", "egg_group1" : "egg_table_a.egg_group = %s",
    "egg_group2" : "egg_table_b.egg_group = %s", "game": "games.game = %s", "region" : "regions.region = %s"}

    for api_arg in api_arg_to_sql_condition:
        if flask.request.args.get(api_arg):
            sql_condition = api_arg_to_sql_condition[api_arg]
            user_api_input = flask.request.args.get(api_arg)
            if "LIKE" in sql_condition:
                like_arguments = "%" + user_api_input + "%"
                query = query + " \n AND " + sql_condition
                pokedex_id_range.append(like_arguments)
            else:
                query = query + "\n AND " + sql_condition + " "
                pokedex_id_range.append(user_api_input) 

    # Modify the query to handle abilities a little differently. That is, given an ability X,
    # we want to return all pokemon that have X as ability1, ability2, or hidden_ability.
    if flask.request.args.get('composite_ability'):
        like_arguments = '%' + flask.request.args.get('composite_ability') + '%'
        query = query + "\n AND (ability_table_a.ability LIKE %s OR ability_table_b.ability LIKE %s OR ability_table_c.ability LIKE %s) "
        pokedex_id_range.extend([like_arguments for i in range(3)])

    for stat in ["health", "attack", "defense", "special_attack", "special_defense", "speed", "catch_rate", "male_percent"]:
        argument = flask.request.args.get(stat)
        if argument:
            lower_bound, upper_bound = argument.split("-")
            query = query + "\n AND " + stat + " BETWEEN %s AND %s "
            pokedex_id_range.append(lower_bound)
            pokedex_id_range.append(upper_bound)

    order_by = "pokedex_number"
    user_order_by = flask.request.args.get('order_by')
    pokemon_info = ["pokedex_number", "pokemon_name", "legendary_status", "type1", "type2", 
    "ability1", "ability2", "hidden_ability", "health", "attack", "defense", "special_attack", 
    "special_defense", "speed", "region", "catch_rate", "male_percent", "game", "egg_group1", "egg_group2"]
    if user_order_by in pokemon_info:
        order_by = user_order_by
    
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
        pokedex_id_range.append(int(flask.request.args.get('limit')))

        if flask.request.args.get('offset'):
            query = query + " OFFSET %s"
            pokedex_id_range.append(int(flask.request.args.get('offset')))
    query = query + ";"


    db_connection = connect_database()
    cursor = db_connection.cursor()
    
    pokedex_id_range = tuple(pokedex_id_range)
    # print(cursor.mogrify(query, pokedex_id_range))
    cursor.execute(query, pokedex_id_range)
    print("my query is: ")
    print(cursor.query)
    
    output_list = []
    for row in cursor:
        name, pokedex_num, type1, type2, abi1, abi2, hid_abi, legendary_status, health, attack, defense, \
            s_attack, s_defense, speed, region, catch_rate, male_percent, game, egg1, egg2 = row
        output_list.append({"pokemon_name": name, "pokedex_number": pokedex_num, "legendary_status": legendary_status,
        "type1": type1, "type2": type2, "ability1": abi1, "ability2": abi2, "hidden_ability": hid_abi, 
        "health": health, "attack": attack, "defense": defense, "special_attack": s_attack, "special_defense": s_defense,
        "speed": speed, "region": region, "catch_rate": str(catch_rate), "male_percent": str(male_percent), "game": game,
        "egg_group1": egg1, "egg_group2": egg2})
    return json.dumps(output_list)