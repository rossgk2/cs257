/*
    webapp.js
    Jimmy Zhong and Ross Grogan-Kaylor, CS257 Carleton College, Professor Jeff Ondich
    Final Project 2021 Feburary 
*/
$(document).ready(onReady)
function onReady() {
    // Initialize the select2 JQuery plugin
    $(".search").select2(); //".search" is a CSS selector string

    load_info("types", "type1_list_selection", "all type1");
    load_info("types", "type2_list_selection", "all type2");
    load_info("abilities", "ability_list_selection", "all ability");
    load_pokemon_cards()

    // Read selected option
    $('#search_button').click(function() {
        var type1Selected = $("#type1_list_selection").val();
        var type2Selected = $("#type2_list_selection").val();
        var abilitySelected = $("#ability_list_selection").val().replaceAll(' ', "_"); //search in all ability1, 2, hidden
        document.getElementById("result").innerHTML = type1Selected + type2Selected + abilitySelected
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
    var image_url = base_path + pokemonName + ".jpg";
    var backup_image_url = base_path + pokemonName + ".png";
    if (doesFileExist(image_url)) {
        return image_url
    }else{
        return backup_image_url
    }
}

function getAPIBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
    return baseURL;
}

function load_info(thisTypeOfInfo, tag_name, searchBarText) {
    var url = getAPIBaseURL() + '/' + thisTypeOfInfo;
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(info) {
        var listBody ='<option value = "all">' + searchBarText + '</option>\n';
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

function load_pokemon_cards(type1Filter = "all", type2Filter = "all", abilityFilter = "all"){
    //?pokemon_name=' + pokemon_dynamic_name
    var num_pokemon_shown = 18;
    var num_pokemon_per_row = 6;
    var url = getAPIBaseURL() + '/query/DESC?limit=' + num_pokemon_shown + "&order_by=pokedex_number";
    if(type1Filter != "all") url += "&type1=" + type1Filter;
    if(type2Filter != "all") url += "&type2=" + type2Filter;
    if(abilityFilter != "all") url += "&composite_ability=" + abilityFilter
    //don't have pictures of pokemon with pokedex_number > 809; pokemon without images won't show up unless people search for them
    if(type1Filter!="all" || type2Filter!="all" || abilityFilter!="all") url += "&pokedex_upper=3000" 
    /*
    if (type1Filter != "all"){
        url += "&type1=" + type1Filter
    }
    if (type2Filter != "all"){
        url += "&type2=" + type2Filter
    }
    if (abilityFilter != "all"){
        url += "&composite_ability=" + abilityFilter
    }
    */


    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(returnPokemon) {
        var pokemonDisplayDiv = '<div class="container">\n<div class="row">' //change row every 6 cards
        for (var i = 0; i < returnPokemon.length; i++){
            pokemonDisplayDiv += '<div class="col-2">'
            var thisPokemon = returnPokemon[i];

            var name = thisPokemon['pokemon_name'].replaceAll('_', "-");
            var pokemonImagePath = getPokemonImagePath(name);
            var pokemonImageHtml = '<img src="' + pokemonImagePath + '" alt="sorry, we do not have picture for this pokemon now" class="img-thumbnail">\n\n';

            var pokedexNum = thisPokemon['pokedex_number'];
            var firstLine = '<h6>ID:' + pokedexNum.toString() + " " + name + "</h>\n"

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

