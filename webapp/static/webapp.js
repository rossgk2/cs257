/*
    webapp.js
    Jimmy Zhong and Ross Grogan-Kaylor, CS257 Carleton College, Professor Jeff Ondich
    Final Project 2021 Feburary 
*/
$(document).ready(onReady)
function onReady() {
    // Initialize the select2 JQuery plugin
    $(".search").select2(); //".search" is a CSS selector string

    load_info("types", "type1_list_selection", "Select type 1");
    load_info("types", "type2_list_selection", "Select type 2");
    load_info("abilities", "ability_list_selection", "Select ability");
    load_pokemon_cards()

    // Read selected option
    $('#search_button').click(function() {
        var type1Selected = $("#type1_list_selection").val();
        var type2Selected = $("#type2_list_selection").val();
        var abilitySelected = $("#ability_list_selection").val(); //search in all ability1, 2, hidden
        document.getElementById("result").innerHTML = "filter selection: " + type1Selected + " | " + type2Selected + " | " + abilitySelected;
        load_pokemon_cards(type1Selected, type2Selected, abilitySelected)
    });
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

function getPokemonImagePath(pokemonName) {
    var base_path = "../static/pokemon_images/";
    var jpg_url = base_path + pokemonName + ".jpg";
    var png_url = base_path + pokemonName + ".png";
    if (doesFileExist(jpg_url)) return jpg_url;
    if (doesFileExist(png_url)) return png_url;
    return "../static/pokemon_images/pokemon_picture_missing.png"
}

function getAPIBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
    return baseURL;
}

function load_info(thisTypeOfInfo, htmlID, searchBarText) {
    var url = getAPIBaseURL() + '/' + thisTypeOfInfo;
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(info) {
        var listBody ='<option value = "all">' + searchBarText + '</option>\n';
        for (var i=0; i < info.length; i++){
            var rawElement = info[i];
            listBody += '<option value = "' + rawElement + '">' + makePresentable(rawElement) + '</option>\n'
        }
        document.getElementById(htmlID).innerHTML = listBody
    })
    .catch(function(error) {
        console.log(error);
    });
}

function load_pokemon_cards(type1Filter = "all", type2Filter = "all", abilityFilter = "all"){
    //?pokemon_name=' + pokemon_dynamic_name
    var num_pokemon_shown = 18;
    var num_pokemon_per_row = 6;
    var url = getAPIBaseURL() + '/advanced_search/DESC?limit=' + num_pokemon_shown + "&order_by=pokedex_number";
    if(type1Filter != "all") url += "&type1=" + type1Filter;
    if(type2Filter != "all") url += "&type2=" + type2Filter;
    if(abilityFilter != "all") url += "&composite_ability=" + abilityFilter
    //don't have pictures of pokemon with pokedex_number > 809; pokemon without images won't show up unless people search for them
    if(type1Filter!="all" || type2Filter!="all" || abilityFilter!="all") url += "&pokedex_upper=3000" 

    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(returnPokemon) {
        var pokemonDisplayDiv = '<div class="container">\n<div class="row">' //change row every 6 cards
        for (var i = 0; i < returnPokemon.length; i++){
            pokemonDisplayDiv += '<div class="col-2">'
            var thisPokemon = returnPokemon[i];

            var name = makePresentable(thisPokemon['pokemon_name']);
            var pokemonImagePath = getPokemonImagePath(name);
            var pokemonImageHtml = '<img src="' + pokemonImagePath + '" alt="sorry, we do not have picture for this pokemon now" class="img-thumbnail">\n\n';

            var pokedexNum = thisPokemon['pokedex_number'];
            var firstLine = '<h6>(ID: ' + pokedexNum.toString() + ") " + name + "</h>\n"

            var typeImageLine1 = 'T1:<img src="../static/type_images/' + thisPokemon['type1'] + '.png" alt="something is wrong" class="img-thumbnail">\n'
            var typeImageLine2 = 'T2:<img src="../static/type_images/' + thisPokemon['type2'] + '.png" alt="something is wrong" class="img-thumbnail">\n'
            var secondLine = '<h6>\n' + typeImageLine1 + typeImageLine2 + '</h2>\n' //type images
            
            pokemonDisplayDiv += (pokemonImageHtml+ firstLine + secondLine + '</div>')
            if (i == num_pokemon_per_row-1){
                pokemonDisplayDiv += '</div>\n<div class="row">'
            }
        }
        pokemonDisplayDiv += '</div>\n</div>'
        document.getElementById("pokemon_landing_display").innerHTML = pokemonDisplayDiv
    })
}

function makePresentable(str) {
    result = str.charAt(0).toUpperCase() + str.slice(1);
    return result.replaceAll("_", " ");
 }