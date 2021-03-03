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

# This route delivers the user your site's home page.
@app.route('/')
def home():
    return flask.render_template('index.html')

@app.route('/types')
def types():
    return flask.render_template('types.html')

# This route supports relative links among your web pages, assuming those pages
# are stored in the templates/ directory or one of its descendant directories,
# without requiring you to have specific routes for each page.

@app.route('/pokemon_page/<string:path>')
def individual_pokemon_page(path):
    # http://localhost:5000/individual_pokemon/araquanid
    query_pokemon = path.lower()
    return flask.render_template('pokemon_page.html', pokemon = query_pokemon)

if __name__ == '__main__':
    parser = argparse.ArgumentParser('Ross and Jimmy Pokemon application, including API')
    parser.add_argument('host', help='the host on which this application is running')
    parser.add_argument('port', type=int, help='the port on which this application is listening')
    arguments = parser.parse_args()
    app.run(host=arguments.host, port=arguments.port, debug=True)
