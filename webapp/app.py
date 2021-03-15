#!/usr/bin/env python3
'''
    webapp.py
    Jimmy Zhong and Ross Grogan-Kaylor, CS257 Carleton College, Professor Jeff Ondich
    Final Project 2021 Feburary 
'''
import sys
import argparse
import flask
import api

app = flask.Flask(__name__, static_folder='static', template_folder='templates')
app.register_blueprint(api.api, url_prefix='/api')

@app.route('/')
def home():
    '''route to main page'''
    return flask.render_template('index.html')

@app.route('/help')
def show_help():
    '''route to help page, a list of api end-points'''
    return flask.render_template('types.html')

@app.route('/advanced_search')
def advanced_search():
    '''route to advance search page'''
    return flask.render_template('advanced_search.html')

@app.route('/pokemon_page/<string:path>')
def individual_pokemon_page(path):
    '''route to the page of an individual pokemon. for example: 
    http://localhost:5000/pokemon_page/araquanid'''
    query_pokemon = path.lower()
    return flask.render_template('pokemon_page.html', pokemon = query_pokemon)

if __name__ == '__main__':
    parser = argparse.ArgumentParser('Ross and Jimmy Pokemon application, including API')
    parser.add_argument('host', help='the host on which this application is running')
    parser.add_argument('port', type=int, help='the port on which this application is listening')
    arguments = parser.parse_args()
    app.run(host=arguments.host, port=arguments.port, debug=True)
