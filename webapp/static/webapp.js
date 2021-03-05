/*
    webapp.js
    Jimmy Zhong and Ross Grogan-Kaylor, CS257 Carleton College, Professor Jeff Ondich
    Final Project 2021 Feburary 
*/
$(document).ready(onReady)
var numPokemonEachQuery = 30;
var curNumPokemonOnThePage = 0;
var numPokemonPerRow = 6;
var reachTheEnd = 0; //0 is no, 1 is yes

function onReady() {
    // Initialize the select2 JQuery plugin
    $(".search").select2(); //".search" is a CSS selector string

    load_info("types", "type1_list_selection", "all type1");
    load_info("types", "type2_list_selection", "all type2");
    load_info("abilities", "ability_list_selection", "all ability");
    document.getElementById("pokemon_landing_display").innerHTML = load_wating_pic();
    load_pokemon_cards("all", "all", "all", 0);

    // Read selected option
    $('#search_button').click(function() {
        var type1Selected = $("#type1_list_selection").val();
        var type2Selected = $("#type2_list_selection").val();
        var abilitySelected = $("#ability_list_selection").val(); //search in all ability1, 2, hidden
        document.getElementById("pokemon_landing_display").innerHTML = load_wating_pic();
        curNumPokemonOnThePage = 0;
        load_pokemon_cards(type1Selected, type2Selected, abilitySelected)
    });

    $(window).on("scroll", function() {
        if (reachTheEnd == 0){
            infinite_user_scroll();
        }
    })
}


function infinite_user_scroll(){
    //from https://dev.to/sakun/a-super-simple-implementation-of-infinite-scrolling-3pnd
    var scrollHeight = $(document).height();
    var scrollPos = $(window).height() + $(window).scrollTop();
    document.getElementById("result").innerHTML = "scroll height/scrollPos: " + scrollHeight + "/" + scrollPos;
    if (scrollHeight - scrollPos <= 3) {
        document.getElementById("pokemon_landing_display").innerHTML += load_wating_pic();
        load_pokemon_cards("all", "all", "all");
    }
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

function load_pokemon_cards(type1Filter, type2Filter, abilityFilter){
    var url = getAPIBaseURL() + "/advanced_search/DESC?order_by=pokedex_number&limit=" + numPokemonEachQuery + "&offset=" + curNumPokemonOnThePage;
    if(type1Filter != "all") url += "&type1=" + type1Filter;
    if(type2Filter != "all") url += "&type2=" + type2Filter;
    if(abilityFilter != "all") url += "&composite_ability=" + abilityFilter;
    //don't have pictures of pokemon with pokedex_number > 809; pokemon without images won't show up unless people search for them
    if(type1Filter!="all" || type2Filter!="all" || abilityFilter!="all") url += "&pokedex_upper=3000";

    return fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(returnPokemon) {
        var pokemonDisplayDiv = '<div class="container">\n<div class="row">';
        var pokedexNum = 2000 //need this to each whether reach the end, for infinite scroll
        for (var i = 0; i < returnPokemon.length; i++){
            pokemonDisplayDiv += '<div class="col-2">'
            var thisPokemon = returnPokemon[i];
            pokedexNum = thisPokemon['pokedex_number'];

            var rawName = thisPokemon['pokemon_name'];
            var pokemonImagePath = getPokemonImagePath(rawName);
            var pokemonImageHtml = '<img src="' + pokemonImagePath + '" alt="sorry, we do not have picture for this pokemon now" class="img-thumbnail">\n';
            var pokeImageLink = '<a href="'+ getPokemonPageURL(rawName) + '">' + pokemonImageHtml + "</a>"

            var firstLine = '<h6>(ID: ' + pokedexNum.toString() + ") " + makePresentable(rawName) + "</h>\n"

            var typeImageLine1 = 'T1:<img src="../static/type_images/' + thisPokemon['type1'] + '.png" alt="something is wrong" class="img-thumbnail">\n';
            var typeImageLine2 = 'T2:<img src="../static/type_images/' + thisPokemon['type2'] + '.png" alt="something is wrong" class="img-thumbnail">\n';
            var secondLine = '<h6>\n' + typeImageLine1 + typeImageLine2 + '</h2>\n'; //type images
            
            pokemonDisplayDiv += pokeImageLink + firstLine + secondLine + '</div>'
            if (i == numPokemonPerRow-1){ //change row every 6 cards
                pokemonDisplayDiv += '</div>\n<div class="row">'
            }
        }
        pokemonDisplayDiv += '</div>\n</div>';

        curNumPokemonOnThePage += numPokemonEachQuery;
        //reachTheEnd = checkReachTheEnd(url, pokedexNum);
        //document.getElementById("result").innerHTML += "reach the end is: " + reachTheEnd;

        page_content = document.getElementById("pokemon_landing_display");
        newInnerHTML = page_content.innerHTML.replaceAll(load_wating_pic(), " ") + pokemonDisplayDiv;
        page_content.innerHTML = newInnerHTML
    })
}

function makePresentable(str) {
    result = str.charAt(0).toUpperCase() + str.slice(1);
    return result.replaceAll("_", " ");
 }

function checkReachTheEnd(url, pokedexNum){
    //see whether we get any pokemon below this pokedexNum given the same filter criteria
    var upper_bound_pokedexNum = pokedexNum -1;
    checkURL = url + "&pokedex_upper=" + upper_bound_pokedexNum;
    return fetch(checkURL)
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

function getPokemonPageURL(pokemon_name){
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/pokemon_page/' + pokemon_name;
    return baseURL;
}

function load_wating_pic(){
    var single_loading_image = `\n<div class="col-2">
    <img src="../static/pokemon_images/pokemon_ball_square.gif" class="img-thumbnail">
    <h5>loading</h5>
    <h6>T1:<img src="../static/type_images/null.png" class="img-thumbnail">
    T2:<img src="../static/type_images/null.png" class="img-thumbnail"></h6>
    </div>`;
    var loading_display = '<div class="container">\n<div class="row">';
    for (var i = 0; i < numPokemonPerRow; i++){
        loading_display += single_loading_image
    }
    loading_display += '</div>\n</div>';
    return loading_display;
}
