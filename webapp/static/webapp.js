/*
    webapp.js
    Jimmy Zhong and Ross Grogan-Kaylor, CS257 Carleton College, Professor Jeff Ondich
    Final Project 2021 Feburary 
*/
$(document).ready(onReady)
var numPokemonEachQuery = 24;
var curNumPokemonOnThePage = 0;
var numPokemonPerRow = 6;

function onReady() {
    // Initialize the select2 JQuery plugin
    $(".search").select2(); //".search" is a CSS selector string

    // Set up searchable dropdown menus.
    loadDropdown("type_list_selection", "types", null); // See shared_functions.js for definition of loadDropdown()
    loadDropdown("ability_list_selection", "abilities", function(arr, i){ return arr[i]["ability"];});
    
    // Set up the icon that leads to the advanced search page.
    loadAdvancedSearch();

    // It will take a second or two for the effects of loadPokemonCards() (below) to register, so set up some "loading" GIFs.
    document.getElementById("pokemon_landing_display").innerHTML = getLoadingGifInnerHtml();
    
    // Display all Pokemon (initially, don't restrict Pokemon that are shown by type or ability).
    var typeSelected = "any";
    var abilitySelected = "any";
    loadPokemonCards(typeSelected, abilitySelected);

    // Get the type and ability selected by the user and use them to load the appropriate Pokemon cards.
    $('#search_button').click(function() {
        typeSelected = $("#type_list_selection").val();
        abilitySelected = $("#ability_list_selection").val(); //search in all ability1, 2, hidden
        document.getElementById("pokemon_landing_display").innerHTML = getLoadingGifInnerHtml();
        curNumPokemonOnThePage = 0;
        document.getElementById("the_end_of_query").innerHTML = "still querying";
        loadPokemonCards(typeSelected, abilitySelected);
    });

    // Register the event handler for the "help" button.
    document.getElementById("information_sign_button").onclick = informationSign;
    
    // Register the event handler for the onscroll event. 
    window.onscroll = function() { infiniteUserScroll(typeSelected, abilitySelected); };
}


function infiniteUserScroll(typeSelected, abilitySelected) {
    if (document.getElementById("the_end_of_query").innerHTML == "still querying") {
        //from https://dev.to/sakun/a-super-simple-implementation-of-infinite-scrolling-3pnd
        var scrollHeight = $(document).height();
        var scrollPos = $(window).height() + $(window).scrollTop();

        var smallNumber = 3;
        if (scrollHeight - scrollPos <= smallNumber) {
            document.getElementById("pokemon_landing_display").innerHTML += getLoadingGifInnerHtml();
            loadPokemonCards(typeSelected, abilitySelected);
        }
    }
}

function loadPokemonCards(typeFilter, abilityFilter){
    // Use the advanced search API endpoint to search for the Pokemon that will be displayed as cards.
    var url = getAPIBaseURL() + `/advanced_search/ASC?order_by=pokedex_number&limit=${numPokemonEachQuery}`;
    
    // Pass the specified type and ability to the API query.
    if(typeFilter != "any") url += "&composite_type=" + typeFilter;
    if(abilityFilter != "any") url += "&composite_ability=" + abilityFilter;
    url += `&offset=${curNumPokemonOnThePage}`;
    //don't have pictures of pokemon with pokedex_number > 809; pokemon without images won't show up unless people search for them
    //if(typeFilter!="any" || abilityFilter!="any") url += "&pokedex_upper=3000";

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
        newInnerHTML = page_content.innerHTML.replaceAll(getLoadingGifInnerHtml(), " ") + pokemonDisplayDiv;
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

function loadAdvancedSearch(){
    advancedSearchURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/advanced_search';
    linkElement = `<div class = "highlight"><a href ="${advancedSearchURL}"> 
    <img src="../static/pokemon_images/searchSign.png" width="80" alt="searchSign">advance search</img></a></div>`;
    document.getElementById("link_to_advanced_search").innerHTML = linkElement;
}

function getLoadingGifInnerHtml(){
    var nullTypeImage = '<img src="../static/type_images/null.png" class="img-thumbnail">';
    var singleBlock = `<img src="../static/pokemon_images/pokemon_ball_square.gif" class="img-thumbnail">
    <h5>loading</h5> <h6>T1:${nullTypeImage} T2:${nullTypeImage}</h6>`;
    
    var loading_display = '<div class="container">\n<div class="row">';
    for (var i = 0; i < numPokemonPerRow; i++){
        loading_display += '\n<div class="col-2">' + singleBlock + '</div>';
    }
    loading_display += '</div>\n</div>';
    return loading_display;
}
