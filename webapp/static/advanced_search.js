/* The symbol $ is an alias for JQuery(). To be totally clear, this means that $ is used as the name of a function! In the below, $(document)
 is the function $ acting on the argument whose name is document.
*/

// The anonymous function inside $(document).ready() is called after the document has been loaded.
$(document).ready(onReady)

function onReady() {
	// Initialize the select2 JQuery plugin. Functionality is added to HTML elements with class "search2". 
	$(".search2").select2();

	// Read selected option
	$('#search_button').click(function() {
		var value = $("#pokemon_name option:selected").text();
		$('#result').html("selected value: " + value);
	});

	loadPokemonNameDropdown();
	loadTypeDropdowns();
	loadAbilityDropdowns();
}

function loadPokemonNameDropdown() {
    var url = getAPIBaseURL() + "/query/ASC"
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(pokemonList) {
    	innerHTML = getDropdownInnerHTML(pokemonList, function(arr, i){ return arr[i]["pokemon_name"]; });
    	var pokemonNameDropdown = document.getElementById("pokemon_name_dropdown");
		pokemonNameDropdown.innerHTML = innerHTML;    	
    })
    .catch(function(error) {
        console.log(error);
    });
}

function loadTypeDropdowns() {
	var url = getAPIBaseURL() + "/types"
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(typesList) {
    	innerHTML = getDropdownInnerHTML(typesList, null);
    	var type1Dropdown = document.getElementById("type1_dropdown");
    	var type2Dropdown = document.getElementById("type2_dropdown");
		type1Dropdown.innerHTML = innerHTML;
		type2Dropdown.innerHTML = innerHTML;    	
    })
    .catch(function(error) {
        console.log(error);
    });
}

function loadAbilityDropdowns() {
	var url = getAPIBaseURL() + "/abilities"
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(abilitiesList) {
    	innerHTML = getDropdownInnerHTML(abilitiesList, null);
    	var ability1Dropdown = document.getElementById("ability1_dropdown");
    	var ability2Dropdown = document.getElementById("ability2_dropdown");
		ability1Dropdown.innerHTML = innerHTML;
		ability2Dropdown.innerHTML = innerHTML;    	
    })
    .catch(function(error) {
        console.log(error);
    });
}

// Helper functions

function getDropdownInnerHTML(arr, accessor) {
	if (accessor === null) {
		accessor = function(arr, i){ return arr[i]; };
	}
	var innerHTML = "<option> Click to search or select an option </option>\n";
    for (var i = 0; i < arr.length; i ++) {
		innerHTML += "<option> " + makePresentable(accessor(arr, i)) + " </option>\n";
    }
    return innerHTML;
}

function getAPIBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
    return baseURL;
}

function makePresentable(str) {
   result = str.charAt(0).toUpperCase() + str.slice(1);
   return result.replace("_", " ");
}