/*
    index.js
    Jimmy Zhong and Ross Grogan-Kaylor, CS257 Carleton College, Professor Jeff Ondich
    Final Project 2021 Feburary 
*/
$(document).ready(onReady)

function onReady() {
    // Initialize the select2 JQuery plugin
    $(".search").select2(); //".search" is a CSS selector string

    // Set up searchable dropdown menus.
    loadDropdown("type_list_selection", "types", null); // See shared_functions.js for definition of loadDropdown()
    loadDropdown("ability_list_selection", "abilities", function(arr, i){ return arr[i]["ability"];});
    
    // Set up the icon that leads to the advanced search page.
    loadAdvancedSearch();

    // Set up the InfiniteScroller. (See InfiniteScroller.js).
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
        
        // Add the "card" corresponding to the current Pokemon (two <h6> tags and a <div class = "col-2">) to
        // the current row of cards.
        var firstLine = `<h6>(ID: ${pokedexNum}) ${makePresentable(name)}</h6>\n`;
        var secondLine = `<h6>${getTypeImageHTML(pokemon['type1'])} ${getTypeImageHTML(pokemon['type2'])}</h6>\n`;
        return pokemonImageHtml + firstLine + secondLine;
    }

    let infiniteScroller = new InfiniteScroller(display, searchButton, getQueryURLOnUpdate, getPokemonCard, 24, 6);
    infiniteScroller.onReady();

    // Set up the "help" button's event handler.
   	document.getElementById("information_sign_button").onclick = informationSign;
}

function loadAdvancedSearch() {
    advancedSearchURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/advanced_search';
    linkElement = `<div class = "highlight"><a href ="${advancedSearchURL}"> 
    <img src="../static/pokemon_images/searchSign.png" width="80" alt="searchSign">advance search</img></a></div>`;
    document.getElementById("link_to_advanced_search").innerHTML = linkElement;
}