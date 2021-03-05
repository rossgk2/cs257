/* The symbol $ is an alias for jQuery(). To be totally clear, this means that $ is used as the name of a function! In the below, $(document)
 is the function $ acting on the argument whose name is document.
*/

// The anonymous function inside $(document).ready() is called after the document has been loaded.
$(document).ready(onReady)

function onReady() {
	// Initialize the select2 JQuery plugin. Functionality is added to HTML elements with class "search2". 
	$(".search2").select2();

	//loadPokemonNameDropdown();
	loadLegendaryStatusDropdown();
	loadTypeDropdowns();
	loadAbilityDropdowns();
	loadRegionDropdowns();
	loadGameDropdown();
	loadEggGroupsDropdown();
	registerSexRatioCallbacks();
	loadStatsButtonCallback(); // Adapted from https://www.w3schools.com/howto/howto_js_collapsible.asp

	//Load the search button's callback. Simple enough.
	searchButton = document.getElementById("search_button");
	searchButton.onclick = onSearchButtonClicked;
}

function onSearchButtonClicked() {
	// This dict will store all the search data input by the user.
	var dict = {};
	
	// First load user input from select2 dropdown menus
	var dropdownInput = ["legendary_status", "type1", "type2", "ability1", "ability2", "hidden_ability", "region", "egg_group1", "egg_group2"];
	for (var i = 0; i < dropdownInput.length; i ++) {
		var key = dropdownInput[i];
		var id = key + "_dropdown";
		dict[key] = $("#" + id + " option:selected").text();
	}

	// Now get user input from search fields (i.e. <input type = "text"> tags). This includes all of the stats.
	var searchInput = ["id", "pokemon_name", "health", "attack", "defense", "special_attack", "special_defense", "speed"];
	for (var i = 0; i < searchInput.length; i ++) { 
		var key = searchInput[i];
		var id = key + "_search";
		dict[key] = document.getElementById(id).value.replaceAll(" ", "");
	}
	
	// Get an array of all the names of the user input fields
	var keys = dropdownInput;
	for (var i = 0; i < searchInput.length; i ++) {
		keys.push(searchInput[i]);
	}

	// Temporary: ignore legendary_status and egg groups for now
	keys = keys.filter(function(x){ return x !== "legendary_status" && x !== "egg_group1" && x !== "egg_group2" });

	// Query the API using the user input in order to display the pokemon that satisfy the search criteria

	//Form the query
	var query = "ASC?";
	var i;
	for (i = 0; i < keys.length; i ++) {
		key = keys[i];
		userInput = dict[key];
		userInput = userInput.replaceAll(" ", "").toLowerCase();
		//Don't include arguments in the query that coorrespond to fields not filled out by the user
		if (userInput !== "any" && userInput != "") { 
			query += key + "=" + userInput;
			if (i <= keys.length - 2) {
				query += "&";
			}
		}
	}

	// Use the query
	var url = getAPIBaseURL() + "/advanced_search/" + query;
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(pokemonList) {
    	var search_results = document.getElementById("search_results");
    	var innerHTML = "<ul>\n";
    	for (var i = 0; i < pokemonList.length; i ++) {
    		innerHTML += "<li> " + makePresentable(pokemonList[i]["pokemon_name"]) + " </li>\n"; 
    	}
    	result += "</ul>";
    	search_results.innerHTML = innerHTML;    	
    })
    .catch(function(error) {
        console.log(error);
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

function loadLegendaryStatusDropdown() {
	var url = getAPIBaseURL() + "/legendaries"
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(legendaryStatusList) {
    	innerHTML = getDropdownInnerHTML(legendaryStatusList, function(str) {return toTitleCase(makePresentable(str)) } , null);
    	innerHTML = innerHTML.replace("Null", "Not legendary");
    	var legendaryStatusDropdown = document.getElementById("legendary_status_dropdown");
		legendaryStatusDropdown.innerHTML = innerHTML;
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

function registerSexRatioCallbacks() {
	var percentMaleSearch = document.getElementById("percent_male_search");
	var percentFemaleSearch = document.getElementById("percent_female_search");
	percentMaleSearch.oninput = function() { return updateSexRatios("female") };
	percentFemaleSearch.oninput = function() { return updateSexRatios("male") };
}

// Since male_percent and female_percent sum to 100, we can update one when the other is changed.
function updateSexRatios(fieldToUpdate) {
	var percentMaleSearch = document.getElementById("percent_male_search");
	var percentFemaleSearch = document.getElementById("percent_female_search");
	if (fieldToUpdate === "male") {
		percentMaleSearch.value = updateSexRatiosHelper(percentFemaleSearch);
	}
	else if (fieldToUpdate === "female") {
		percentFemaleSearch.value = updateSexRatiosHelper(percentMaleSearch);
	}
	else {
		throw 'fieldToUpdate must be either "male" or "female"'
	}
}


/* Returns the string that should be stored in the sex ratio field that is the "opposite" of sexRatioField. For example, if
sexRatioField is "percent_male_search", then this function returns the string that should be be assigned to the .value field of
the HTML element whose id is "percent_female_search".
*/
function updateSexRatiosHelper(sexRatioField) {
	values = sexRatioField.value === null ? "" : sexRatioField.value;
	values = values.replace(/\s+/g, ""); //remove all whitespace from string
	 if (values.includes("-")) {
	 	valuesSplit = values.split(/\D/);
	 	
	 	onlyDigitsBefore = values.indexOf("-") == (values.length - 1); // true if values is of the form "x-", where x is a string of digits
	 	onlyDigitsAfter = values.indexOf("-") == 0; // true if values is of the form "-x"
	
		if (onlyDigitsBefore || onlyDigitsAfter)
	 	{
	 		if (onlyDigitsBefore) { 
		 		lower = valuesSplit[0];
		 		upper = 100;
	 		} 
	 		else if (onlyDigitsAfter) {
		 		lower = 0;
		 		upper = valuesSplit[1];
	 		}
		 	lowerOther = Math.min(100 - lower, 100 - upper);
		 	upperOther = Math.max(100 - lower, 100 - upper);
		}
		else {
			valueBefore = valuesSplit[0];
	 		valueAfter = valuesSplit[1];
	 		lowerOther = Math.min(100 - valueBefore, 100 - valueAfter);
	 		upperOther = Math.max(100 - valueBefore, 100 - valueAfter);
		}
		return lowerOther + " - " + upperOther;
	 }
	 else { //values is either the empty string or a string of digits
	 	if (values === "") {
	 		return "";
	 	}
	 	else {
	 		return 100 - values;
	 	}
	 }
}

function loadStatsButtonCallback() {
	var button = getStatsCollapsibleContainerChild("stats_collapsible_button")
	button.onclick = function() {
	    this.classList.toggle("active");
	    var content = getStatsCollapsibleContainerChild("content");
	    if (content.style.display === "block") {
	      content.style.display = "none";
	    } 
	    else {
	      content.style.display = "block";
	    }
	  };
}

// Helper functions

function getStatsCollapsibleContainerChild(id) {
	var container = document.getElementById("stats_collapsible_container");
	var children = container.children;
	return getElementFromArray(children, id);
}

function getElementFromArray(arr, id) {
	for (var i = 0; i < arr.length; i ++) {
		if (arr[i].getAttribute("id") === id) {
			return arr[i];
		}
	}
	return null;
}

/* Inputs:
 arr is an array
 presentor is a function that takes a single string as input and returns a string as output
 accessor is a function that takes in an array and an integer and returns an element of that array
*/
function getDropdownInnerHTML(arr, presentor, accessor) {
	if (accessor === null) {
		accessor = function(arr, i){ return arr[i]; };
	}
	var innerHTML = "<option> Any </option>\n";
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