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

    $('#information_sign_button').click(function() {
        informationSign();
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
    var url = getAPIBaseURL() + `/advanced_search/ASC?order_by=pokedex_number&limit=${numPokemonEachQuery}`;
    if(typeFilter != "all") url += "&composite_type=" + typeFilter;
    if(abilityFilter != "all") url += "&composite_ability=" + abilityFilter;
    url += `&offset=${curNumPokemonOnThePage}`;
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
            var pokemonImageHtml = getPokemonImageWithLink(rawName);

            var firstLine = `<h6>${makePresentable(rawName)} (ID:${pokedexNum})</h>\n`;
            var secondLine = `<h6>${getTypeImageHTML(thisPokemon['type1'])} ${getTypeImageHTML(thisPokemon['type2'])}</h6>\n`;
            pokemonDisplayDiv += pokemonImageHtml + firstLine + secondLine + '</div>';

            if (i == numPokemonPerRow-1){ //change row every 6 cards
                pokemonDisplayDiv += '</div>\n<div class="row">';
            }
        }
        pokemonDisplayDiv += '</div>\n</div>';

        curNumPokemonOnThePage += numPokemonEachQuery;
        checkReachTheEnd(url, pokedexNum, returnPokemon.length);

        page_content = document.getElementById("pokemon_landing_display");
        newInnerHTML = page_content.innerHTML.replaceAll(load_wating_pic(), " ") + pokemonDisplayDiv;
        page_content.innerHTML = newInnerHTML
    })
}

function checkReachTheEnd(url, pokedexNum, returnQueryLength){
    endIndicator = document.getElementById("the_end_of_query");
    //empty query result
    if (returnQueryLength == 0){endIndicator.innerHTML = "Sorry, no pokemon can satisfy your query criteria..."; return;}

    //for short result
    if (returnQueryLength < numPokemonEachQuery){endIndicator.innerHTML = "It's already the end of the query!"; return;}

    //if result >= 30, see whether we get any pokemon above this pokedexNum given the same filter criteria
    url = url.replace(/&offset=.*/gi, "");
    url += "&pokedex_lower=" + (pokedexNum + 1);
    return fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(returnPokemon) {
        if (returnPokemon.length == 0) endIndicator.innerHTML = "It's already the end of the query!";
    })
}

function load_advanced_search(){
    advancedSearchURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/advanced_search';
    linkElement = `<a href ="${advancedSearchURL}"> <img src="../static/pokemon_images/searchSign.png" width="50" alt="searchSign">advance search </img></a>`;
    document.getElementById("link_to_advanced_search").innerHTML = linkElement;
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
