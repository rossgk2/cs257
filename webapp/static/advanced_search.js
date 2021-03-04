/* The symbol $ is an alias for JQuery(). To be totally clear, this means that $ is used as the name of a function! In the below, $(document)
 is the function $ acting on the argument whose name is document.
*/

// The anonymous function inside $(document).ready() is called after the document has been loaded.
$(document).ready(onReady)

function onReady() {
	// Initialize the select2 JQuery plugin
	$(".search").select2(); //".search" is a CSS selector string

	// Read selected option
	$('#search_button').click(function() {
		var value = $("#pokemon_name option:selected").text();
		$('#result').html("selected value: " + value);
	});

	loadPokemonNameDropdown();
}

function loadPokemonNameDropdown() {
    var url = getAPIBaseURL() + "/query/ASC"
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(pokemonList) {
    	// Construct the innerHTML for the dropdown
    	var innerHTML = "<option> Click to search or select an option </option>\n";
    	for (var i = 0; i < pokemonList.length; i ++) {
			innerHTML += "<option> " + makePresentable(pokemonList[i]["pokemon_name"]) + " </option>\n";
    	}
    	innerHTML += "\n\n";

    	// Assign this innerHTML
    	var pokemonNameSearch = document.getElementById("pokemon_name_dropdown");
		pokemonNameSearch.innerHTML = innerHTML;    	
    })
    .catch(function(error) {
        console.log(error);
    });
}

// Helper functions

function getAPIBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
    return baseURL;
}

function makePresentable(str) {
   result = str.charAt(0).toUpperCase() + str.slice(1);
   return result.replace("_", " ");
}