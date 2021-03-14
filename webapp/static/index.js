/*
    index.js
    Jimmy Zhong and Ross Grogan-Kaylor, CS257 Carleton College, Professor Jeff Ondich
    Final Project 2021 Feburary 
*/
window.onload = initialize;

function initialize() {
    // Initialize the select2 JQuery plugin
    $(".search").select2(); //".search" is a CSS selector string

    // Set up searchable dropdown menus.
    loadDropdown("type_list_selection", "types", null); // See shared_functions.js for definition of loadDropdown()
    loadDropdown("ability_list_selection", "abilities", function(arr, i){ return arr[i]["ability"];});
    
    // Set up the icon that leads to the advanced search page.
    loadAdvancedSearch();

    // Set up the InfinitePokemonCardScroller. (See InfinitePokemonCardScroller.js).
    loadInfinitePokemonCardScroller();

    // Set up the "help" button's event handler.
   	document.getElementById("information_sign_button").onclick = informationSign;
}

function loadInfinitePokemonCardScroller() {
    display = document.getElementById("pokemon_landing_display");
    searchButton = document.getElementById("search_button");

    getQueryURLOnUpdate = function() { 
        var url = `advanced_search/ASC?order_by=pokedex_number`;
        var typeSelected = $("#type_list_selection").val();
        var abilitySelected = $("#ability_list_selection").val();
        if (typeSelected != "any") url += "&composite_type=" + typeSelected;
        if (abilitySelected != "any") url += "&composite_ability=" + abilitySelected;
        return url;
    }

    getPokemonCard = function(pokemon) {
        var pokedexNum = pokemon['pokedex_number'];
        var name = pokemon['pokemon_name'];
        var pokemonImageHtml = getPokemonImageWithLink(name);
        
        var firstLine = `<h6>(ID: ${pokedexNum}) ${makePresentable(name)}</h6>\n`;
        var secondLine = `<h6>${getTypeImageHTML(pokemon['type1'])}`
        if (pokemon['type2'] !== "NULL")
            secondLine += ` ${getTypeImageHTML(pokemon['type2'])}</h6>\n`;
        
        return pokemonImageHtml + firstLine + secondLine;
    }

    let infinitePokemonCardScroller = new InfinitePokemonCardScroller(display, window, searchButton, getQueryURLOnUpdate, getPokemonCard, 24, 6);
    infinitePokemonCardScroller.initialize();
}

function loadAdvancedSearch() {
    advancedSearchURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/advanced_search';
    linkElement = `<div class = "highlight"><a href ="${advancedSearchURL}"> 
    <img src="../static/pokemon_images/searchSign.png" width="80" alt="searchSign">advance search</img></a></div>`;
    document.getElementById("link_to_advanced_search").innerHTML = linkElement;
}