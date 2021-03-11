/*
    index.js
    Jimmy Zhong and Ross Grogan-Kaylor, CS257 Carleton College, Professor Jeff Ondich
    Final Project 2021 Feburary 
*/
$(document).ready(onReady)
var numPokemonEachQuery = 24;
var curNumPokemonOnThePage = 0;
var numPokemonPerRow = 6;
var stillQuerying = true;

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
        stillQuerying = true;
        loadPokemonCards(typeSelected, abilitySelected);
    });

    // Register some more event handlers.
    document.getElementById("information_sign_button").onclick = informationSign;
    window.onscroll = function() { infiniteUserScroll(typeSelected, abilitySelected); };
}

function infiniteUserScroll(typeSelected, abilitySelected) {
    if (stillQuerying) {
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
    // Only search for numPokemonEachQuery many Pokemon.
    var url = getAPIBaseURL() + `/advanced_search/ASC?order_by=pokedex_number&limit=${numPokemonEachQuery}`;
    
    // Pass the specified type and ability to the API query.
    if(typeFilter != "any") url += "&composite_type=" + typeFilter;
    if(abilityFilter != "any") url += "&composite_ability=" + abilityFilter;
    url += `&offset=${curNumPokemonOnThePage}`;

    // Query the API and construct the inner HTML which represents each queried Pokemon as a "card". 
    return fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(pokemonList) {
        var pokemonDisplayDiv = '<div class="container">\n<div class="row">';
        for (var i = 0; i < pokemonList.length; i ++){
            // Get info about the current Pokemon.
            var pokemon = pokemonList[i];
            var pokedexNum = pokemon['pokedex_number'];
            var name = pokemon['pokemon_name'];
            var pokemonImageHtml = getPokemonImageWithLink(name);
            
            // Add the "card" corresponding to the current Pokemon (two <h6> tags and a <div class = "col-2">) to
            // the current row of cards.
            var firstLine = `<h6>(ID: ${pokedexNum}) ${makePresentable(name)}</h6>\n`;
            var secondLine = `<h6>${getTypeImageHTML(pokemon['type1'])} ${getTypeImageHTML(pokemon['type2'])}</h6>\n`;
            pokemonDisplayDiv += '<div class = "col-2">' + pokemonImageHtml + firstLine + secondLine + '</div>';

            // Go to the next row every 6 cards.
            if (i == numPokemonPerRow - 1){
                pokemonDisplayDiv += '</div>\n<div class="row">';
            }
        }
        pokemonDisplayDiv += '</div>\n</div>';
        curNumPokemonOnThePage += numPokemonEachQuery;
        
        // Update stillQuerying.
        var noResultsSatisfyCriteria = pokemonList.length == 0;
        var endOfQueryReached = pokemonList.length < numPokemonEachQuery;
        stillQuerying = !(noResultsSatisfyCriteria || endOfQueryReached);

        // Update the page with the inner HTML we constructed.
        pokemonLandingDisplay = document.getElementById("pokemon_landing_display");
        innerHTML = pokemonLandingDisplay.innerHTML.replaceAll(getLoadingGifInnerHtml(), " ") + pokemonDisplayDiv;
        pokemonLandingDisplay.innerHTML = innerHTML;
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
