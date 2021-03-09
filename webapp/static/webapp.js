/*
    webapp.js
    Jimmy Zhong and Ross Grogan-Kaylor, CS257 Carleton College, Professor Jeff Ondich
    Final Project 2021 Feburary 
*/
$(document).ready(onReady)
var numPokemonEachQuery = 30;
var curNumPokemonOnThePage = 0;
var numPokemonPerRow = 6;

function onReady() {
    // Initialize the select2 JQuery plugin
    $(".search").select2(); //".search" is a CSS selector string

    var typeSelected = "all";
    var abilitySelected = "all";

    load_info("types", "type_list_selection", "all types");
    load_info("abilities", "ability_list_selection", "all abilities");
    load_advanced_search();
    document.getElementById("pokemon_landing_display").innerHTML = load_wating_pic();
    load_pokemon_cards("all", "all", "all");

    // Read selected option
    $('#search_button').click(function() {
        typeSelected = $("#type_list_selection").val();
        abilitySelected = $("#ability_list_selection").val(); //search in all ability1, 2, hidden
        document.getElementById("pokemon_landing_display").innerHTML = load_wating_pic();
        curNumPokemonOnThePage = 0;
        document.getElementById("the_end_of_query").innerHTML = "still querying";
        load_pokemon_cards(typeSelected, abilitySelected);
    });

    $(window).on("scroll", function() {
        if (document.getElementById("the_end_of_query").innerHTML == "still querying"){
            infinite_user_scroll(typeSelected, abilitySelected);
        }
    })
}


function infinite_user_scroll(typeSelected, abilitySelected){
    //from https://dev.to/sakun/a-super-simple-implementation-of-infinite-scrolling-3pnd
    var scrollHeight = $(document).height();
    var scrollPos = $(window).height() + $(window).scrollTop();
    if (scrollHeight - scrollPos <= 3) {
        document.getElementById("pokemon_landing_display").innerHTML += load_wating_pic();
        load_pokemon_cards(typeSelected, abilitySelected);
    }
}

function load_info(thisTypeOfInfo, htmlID, searchBarText) {
    var url = getAPIBaseURL() + '/' + thisTypeOfInfo;
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(info) {
        var listBody =`<option value = "all">${searchBarText}</option>\n`;
        for (var i=0; i < info.length; i++){
            var rawElement = info[i];
            listBody += `<option value = "${rawElement}">${makePresentable(rawElement)}</option>\n`
        }
        document.getElementById(htmlID).innerHTML = listBody
    })
    .catch(function(error) {
        console.log(error);
    });
}

function load_pokemon_cards(typeFilter, abilityFilter){
    var url = getAPIBaseURL() + `/advanced_search/ASC?order_by=pokedex_number&limit=${numPokemonEachQuery}&offset=${curNumPokemonOnThePage}`;
    if(typeFilter != "all") url += "&composite_type=" + typeFilter;
    if(abilityFilter != "all") url += "&composite_ability=" + abilityFilter;
    //don't have pictures of pokemon with pokedex_number > 809; pokemon without images won't show up unless people search for them
    //if(typeFilter!="all" || abilityFilter!="all") url += "&pokedex_upper=3000";

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
            var pokemonImageHtml = `<img src="${getPokemonImagePath(rawName)}" alt="sorry, pokemon image missing" class="img-thumbnail">\n`;
            var pokeImageLink = `<div class = "highlight"><a href="${getPokemonPageURL(rawName)}">${pokemonImageHtml}</a></div>`

            var firstLine = `<h6>${makePresentable(rawName)} (ID:${pokedexNum})</h>\n`
            var secondLine = `<h6>${getTypeImagesHTML(thisPokemon['type1'], thisPokemon['type2'])}</h6>\n`;
            pokemonDisplayDiv += pokeImageLink + firstLine + secondLine + '</div>'

            if (i == numPokemonPerRow-1){ //change row every 6 cards
                pokemonDisplayDiv += '</div>\n<div class="row">'
            }
        }
        pokemonDisplayDiv += '</div>\n</div>';

        curNumPokemonOnThePage += numPokemonEachQuery;
        checkReachTheEnd(url, pokedexNum);

        page_content = document.getElementById("pokemon_landing_display");
        newInnerHTML = page_content.innerHTML.replaceAll(load_wating_pic(), " ") + pokemonDisplayDiv;
        page_content.innerHTML = newInnerHTML
    })
}
/*
function makePresentable(str) {
    result = str.charAt(0).toUpperCase() + str.slice(1);
    return result.replaceAll("_", " ");
 }
*/
function makePresentable(str) {
    str = str.replaceAll("_", " ")
    .toLowerCase()
    .split(' ')
    .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
    .join(' ');
   //result = str.charAt(0).toUpperCase() + str.slice(1);
   return str;
}

function checkReachTheEnd(url, pokedexNum){
    //see whether we get any pokemon above this pokedexNum given the same filter criteria
    checkURL = url + "&pokedex_lower=" + (pokedexNum + 1);
    return fetch(checkURL, {method: 'get'})
    .then((response) => response.json())
    .then(function(returnPokemon) {
        if (returnPokemon.length == 0){
            document.getElementById("the_end_of_query").innerHTML = "It's already the end of the query!"
        }
    })
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

function load_advanced_search(){
    advancedSearchURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/advanced_search';
    linkElement = `<a href ="${advancedSearchURL}"> <img src="../static/pokemon_images/searchSign.png" width="50" alt="searchSign">advance search </img></a>`;
    document.getElementById("link_to_advanced_search").innerHTML = linkElement;
}

function getPokemonImagePath(pokemonName) {
    pokemonName = pokemonName.replaceAll("_", "-")
    var base_path = "../static/pokemon_images/";
    var jpg_url = base_path + pokemonName + ".jpg";
    var png_url = base_path + pokemonName + ".png";
    if (doesFileExist(png_url)) return png_url;
    if (doesFileExist(jpg_url)) return jpg_url;
    return "../static/pokemon_images/pokemon_picture_missing.png";
}

function getTypeImagesHTML(type1, type2){
    var typeImageLine1 = `<img src="../static/type_images/${type1}.png" alt="something is wrong" class="img-thumbnail" title= "type1 is: ${type1}">\n`;
    var typeImageLine2 = `<img src="../static/type_images/${type2}.png" alt="something is wrong" class="img-thumbnail" title= "type2 is: ${type2}">\n`;
    return (typeImageLine1 + typeImageLine2);
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
