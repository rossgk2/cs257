window.onload = initialize;

function initialize() {
	var pokemonName = document.getElementById('pokemon_dynamic_name').innerHTML;
    if (pokemonName) {
        loadPokemonData(pokemonName)
        loadPokemonImage(pokemonName)
    }
}

function doesFileExist(urlToFile) {
    // from https://www.kirupa.com/html5/checking_if_a_file_exists.htm
    var xhr = new XMLHttpRequest();
    xhr.open('HEAD', urlToFile, false);
    xhr.send();
     
    if (xhr.status == "404") {
        return false;
    } else {
        return true;
    }
}

function loadPokemonImage(pokemonName) {
    var base_path = "../static/pokemon_images/";
    var image_url = base_path + pokemonName + ".png";
    var backup_image_url = base_path + pokemonName + ".jpg";
    if (doesFileExist(image_url)) {
        document.getElementById('pokemon_image_dynamic').src = image_url;
        document.getElementById('change').innerHTML = image_url
    }else{
        document.getElementById('pokemon_image_dynamic').src = backup_image_url;
        document.getElementById('change').innerHTML = backup_image_url
    }
}

function loadPokemonData(pokemon_dynamic_name) {
    // Example: http://localhost:5000/api/query/ASC?pokemon_name=castform
    var url = getAPIBaseURL() + '/query/ASC?pokemon_name=' + pokemon_dynamic_name;
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(individualPokemon) {
        
		var dict = {};
        var var_names = ['pokemon_name', 'pokedex_number', 'is_legendary', 'type1', 'type2', 'ability1', 
        'ability2', 'hidden_ability', 'health', 'attack', 'defense', 'special_attack', 'special_defense',
        'speed', 'region', 'catch_rate', 'male_percent', 'game', 'egg_group1', 'egg_group2'];
        for (var i = 0; i < var_names.length; i++) {
        	key = var_names[i];
        	dict[key] = individualPokemon[0][key];
        	if (typeof dict[key] === 'string') {
			    dict[key] = dict[key].replaceAll('_', " ") 
			}
		}
        
        var firstTableBody = '<table>\n';
        var firstTableTitles = ["pokemon name", "pokedex number", "game appeared", "region", "male percentage", "catch rate", "legendary status"];
        var firstTableKeys = ["pokemon_name", "pokedex_number", "game", "region", "male_percent", "catch_rate", "is_legendary"];
        for (var i=0; i < firstTableKeys.length; i++){
            firstTableBody += "<tr>\n<th>" + firstTableTitles[i] + "</th>\n<th>" + dict[firstTableKeys[i]] + "</th>\n</tr>"
        }
        firstTableBody += '\n</table>\n\n';

        var secondTableBody = '<table>\n';
        var secondTableTitles = ["Primary Type", "Secondary Type", "Primary Ability", "Secondary Ability", "Hidden Ability", "egg_group1", "egg_group2"];
        var secondTableKeys = ["type1", "type2", "ability1", "ability2", "hidden_ability", "egg_group1", "egg_group2"];
        for (var i=0; i < secondTableKeys.length; i++){
            secondTableBody += "<tr>\n<th>" + secondTableTitles[i] + "</th>\n<th>" + dict[secondTableKeys[i]] + "</th>\n</tr>"
        }
        secondTableBody += '\n</table>\n\n';

        var thirdTableBody = '<table>\n';
        var thirdTableTitles = ["attack", "special attack", "defense", "special defense", "health", "speed"];
        var thirdTableKeys = ["attack", "special_attack", "defense", "special_defense", "health", "speed"];
        for (var i=0; i < secondTableKeys.length-1; i+=2){
            thirdTableBody += "<tr>\n<th>" + thirdTableTitles[i] + "</th>\n<th>" + dict[thirdTableKeys[i]] 
            + "</th>\n<th>"+ thirdTableTitles[i+1] + "</th>\n<th>" + dict[thirdTableKeys[i+1]] + "</th>\n</tr>"
        }
        thirdTableBody += '\n</table>\n\n';

        document.getElementById('pokemon_stats_display1').innerHTML = firstTableBody;
        document.getElementById('pokemon_stats_display2').innerHTML = secondTableBody;
        document.getElementById('pokemon_stats_display3').innerHTML = thirdTableBody
    })
    .catch(function(error) {
        console.log(error);
    });
}


function getAPIBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
    return baseURL;
}

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

function load_info(this_info, tag_name) {
    var url = getAPIBaseURL() + '/' + this_info;
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(info) {
        var listBody ='';
        for (var i=0; i < info.length; i++){
            listBody += '<option value = "' + info[i][this_info] + '">'
                        + info[i][this_info] + '</option>\n';
        }
        var listElement = document.getElementById(tag_name);
        if (listElement){listElement.innerHTML = listBody;}
    })
    .catch(function(error) {
        console.log(error);
    });
}


/* 
    load_all_types();
    load_all_abilities();


function load_all_types() {
    var url = getAPIBaseURL() + '/types';
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(type) {
        var listBody ='';
        for (var i=0; i < type.length; i++){
            thisType = type[i]
            listBody += '<option value = "' + thisType['type_name'] + '">'
                        + thisType['type_name'] + '</option>\n';
        }
        var typeListElement = document.getElementById('type1_list_selection');
        if (typeListElement){typeListElement.innerHTML = listBody;}
        var typeListElement = document.getElementById('type2_list_selection');
        if (typeListElement){typeListElement.innerHTML = listBody;}
    })
    .catch(function(error) {
        console.log(error);
    });
}

function load_all_abilities() {
    var url = getAPIBaseURL() + '/abilities';
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(abilities) {
        var listBody ='';
        for (var i=0; i < abilities.length; i++){
            listBody += '<option value = "' + abilities[i]['ability'] + '">'
                        + abilities[i]['ability'] + '</option>\n';
        }
        var abilityListElement = document.getElementById('ability_list_selection');
        if (abilityListElement){abilityListElement.innerHTML = listBody;}
    })
    .catch(function(error) {
        console.log(error);
    });
}



jQuery attempt
$(document).ready(function() {
    $("ability_list_selection").select2();
});
*/

