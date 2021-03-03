/*
    webapp.js
    Jimmy Zhong and Ross Grogan-Kaylor, CS257 Carleton College, Professor Jeff Ondich
    Final Project 2021 Feburary 
*/
window.onload = initialize;

function initialize() {
   load_info("types", "type1_list_selection");
   load_info("types", "type2_list_selection");
   load_info("abilities", "ability_list_selection");

   // there should be filter of types and ability implemented later
   load_pokemon_images()
}


function getAPIBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
    return baseURL;
}

function load_info(thisTypeOfInfo, tag_name) {
    var url = getAPIBaseURL() + '/' + thisTypeOfInfo;
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(info) {
        var listBody ='';
        for (var i=0; i < info.length; i++){
            var individualElement = info[i][thisTypeOfInfo].replaceAll('_', " ") 
            listBody += '<option value = "' + individualElement + '">'
                        + individualElement + '</option>\n';
        }
        var listElement = document.getElementById(tag_name);
        if (listElement){listElement.innerHTML = listBody;}
    })
    .catch(function(error) {
        console.log(error);
    });
}

function load_pokemon_images(){
    //?pokemon_name=' + pokemon_dynamic_name
    var num_pokemon_shown = 12;
    var url = getAPIBaseURL() + '/query/DESC?limit=' + num_pokemon_shown;
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(returnPokemon) {
        var outer_dict = {};
        for (var i = 0; i < returnPokemon.length; i++){
            inner_dict = {}; //for each pokemon
            var var_names = ['pokemon_name', 'pokedex_number', 'type1', 'type2'];
            for (var j = 0; j < var_names.length; j++) {
                key = var_names[j];
                inner_dict[key] = returnPokemon[i][key];
                if (typeof inner_dict[key] === 'string') {
                    inner_dict[key] = inner_dict[key].replaceAll('_', " ") 
                }
            }
            outer_dict[i] = inner_dict
		}
        document.getElementById("pokemon_landing_display").innerHTML = JSON.stringify(outer_dict)
    })
}

    /*
    function onRegionButton() {
    var url = getAPIBaseURL() + '/regions';
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(regions) {
        var listBody ='';
        for (var i=0; i < regions.length; i++){
            listBody += '<li>' + regions[i]['regions'] + '</li>\n';
        }
        var listElement = document.getElementById('regions_list');
        if (listElement){listElement.innerHTML = listBody;}
    })
    .catch(function(error) {
        console.log(error);
    });
    }
    var homePageElement = document.getElementById('click_and_change_button');
    if (homePageElement) {
        homePageElement.onclick = onRegionButton;
        load_info("types", "type1_list_selection");
        load_info("types", "type2_list_selection");
        load_info("abilities", "ability_list_selection")
    }
    */