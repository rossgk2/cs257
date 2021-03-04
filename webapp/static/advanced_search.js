/* The symbol $ is an alias for jQuery(). To be totally clear, this means that $ is used as the name of a function! In the below, $(document)
 is the function $ acting on the argument whose name is document.
*/

// The anonymous function inside $(document).ready() is called after the document has been loaded.
$(document).ready(onReady)

function onReady() {
	// Initialize the select2 JQuery plugin. Functionality is added to HTML elements with class "search2". 
	$(".search2").select2();

	loadPokemonNameDropdown();
	loadTypeDropdowns();
	loadAbilityDropdowns();
	loadRegionDropdowns();
	loadGameDropdown();
	loadEggGroupsDropdown();

	// Read selected option
	$('#search_button').click(function() {
		var value = $("#pokemon_name option:selected").text();
		$('#result').html("selected value: " + value);
	});
}

function loadPokemonNameDropdown() {
    var url = getAPIBaseURL() + "/advanced_search/ASC?order_by=pokemon_name"
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(pokemonList) {
    	innerHTML = getDropdownInnerHTML(pokemonList, makePresentable, function(arr, i){ return arr[i]["pokemon_name"]; });
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
    	innerHTML = getDropdownInnerHTML(typesList, makePresentable, null);
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
    	innerHTML = getDropdownInnerHTML(abilitiesList, makePresentable, null);
    	var ability1Dropdown = document.getElementById("ability1_dropdown");
    	var ability2Dropdown = document.getElementById("ability2_dropdown");
		var hiddenAbilityDropdown = document.getElementById("hidden_ability_dropdown");
		ability1Dropdown.innerHTML = innerHTML;
		ability2Dropdown.innerHTML = innerHTML;  
		hiddenAbilityDropdown.innerHTML = innerHTML;  	
    })
    .catch(function(error) {
        console.log(error);
    });
}

function loadRegionDropdowns() {
	var url = getAPIBaseURL() + "/regions"
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(regionsList) {
    	innerHTML = getDropdownInnerHTML(regionsList, makePresentable, null);
    	var regionDropdown = document.getElementById("region_dropdown");
		regionDropdown.innerHTML = innerHTML;
    })
    .catch(function(error) {
        console.log(error);
    });
}

function loadGameDropdown() {
	var url = getAPIBaseURL() + "/games"
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(gamesList) {
    	innerHTML = getDropdownInnerHTML(gamesList, function(str) {return toTitleCase(makePresentable(str)) } , null);
    	var gameDropdown = document.getElementById("game_dropdown");
		gameDropdown.innerHTML = innerHTML;
    })
    .catch(function(error) {
        console.log(error);
    });
}

function loadEggGroupsDropdown() {
	var url = getAPIBaseURL() + "/egg_groups"
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(eggGroupsList) {
    	innerHTML = getDropdownInnerHTML(eggGroupsList, function(str) {return toTitleCase(makePresentable(str)) } , null);
    	var eggGroup1Dropdown = document.getElementById("egg_group1_dropdown");
		var eggGroup2Dropdown = document.getElementById("egg_group2_dropdown");
		eggGroup1Dropdown.innerHTML = innerHTML;
		eggGroup2Dropdown.innerHTML = innerHTML;
    })
    .catch(function(error) {
        console.log(error);
    });
}


// Helper functions

/* Inputs:
 arr is an array
 presentor is a function that takes a single string as input and returns a string as output
 accessor is a function that takes in an array and an integer and returns an element of that array
*/
function getDropdownInnerHTML(arr, presentor, accessor) {
	if (accessor === null) {
		accessor = function(arr, i){ return arr[i]; };
	}
	var innerHTML = "<option> Click to search or select an option </option>\n";
    for (var i = 0; i < arr.length; i ++) {
		innerHTML += "<option> " + presentor(accessor(arr, i)) + " </option>\n";
    }
    return innerHTML;
}

function getAPIBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
    return baseURL;
}

function makePresentable(str) {
   result = str.charAt(0).toUpperCase() + str.slice(1);
   return result.replaceAll("_", " ");
}

function toTitleCase(str) {
	// from https://stackoverflow.com/questions/196972/convert-string-to-title-case-with-javascript
  	return str.replace(/\w\S*/g, function(txt) { return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
}