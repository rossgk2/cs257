/* The symbol $ is an alias for jQuery(). To be totally clear, this means that $ is used as the name of a function! In the below, $(document)
 is the function $ acting on the argument whose name is document.
*/

// The anonymous function inside $(document).ready() is called after the document has been loaded.
$(document).ready(onReady)

function onReady() {
	// Initialize the select2 JQuery plugin. Functionality is added to HTML elements with class "search2". 
	$(".search2").select2();

	loadDropdowns();
	loadLinkToHomePage();
	registerSexRatioCallbacks();
	loadStatsButtonCallback(); // Adapted from https://www.w3schools.com/howto/howto_js_collapsible.asp

	//Load the search button's callback. Simple enough.
	searchButton = document.getElementById("search_button");
	searchButton.onclick = onSearchButtonClicked;

	$('#information_sign_button').click(function() {
        informationSign();
    });
}

function onSearchButtonClicked() {
	// This dict will store all the search data input by the user.
	var dict = {};
	
	// First load user input from select2 dropdown menus
	var dropdownInput = ["legendary_status", "type1", "type2", "ability1", "ability2", "hidden_ability", "region", "egg_group1", "egg_group2", "game"];
	for (var i = 0; i < dropdownInput.length; i ++) {
		var key = dropdownInput[i];
		var id = key + "_dropdown";
		dict[key] = $("#" + id + " option:selected").val();
	}

	// Now get user input from search fields (i.e. <input type = "text"> tags). This includes all of the stats.
	var searchInput = ["id", "pokemon_name", "health", "attack", "defense", "special_attack", "special_defense", "speed", 
	"catch_rate", "percent_male", "percent_female"];
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

	// Query the API using the user input in order to display the pokemon that satisfy the search criteria.
	// First, we form the query.
	// If the user passed in arguments, the query needs to start with "ASC?".
	var query = "ASC";
	if (keys.length > 0) {
		query += "?";
	}

	// Add the user input to the query.
	for (var i = 0; i < keys.length; i ++) {
		var key = keys[i];
		var userInput = dict[key];
		var userInputProcessed = userInput.replaceAll(" ", "").toLowerCase();

		//Only include arguments in the query that coorrespond to fields filled out by the user.
		if (userInputProcessed !== "any" && userInputProcessed !== "") { 
			query += key + "=" + userInput;
			query += "&";
		}
	}

	// If the last character in query is "&", remove that "&" from the query.
	if (query[query.length - 1] == "&") {
		query = query.substring(0, query.length - 1)
	}

	// Now, use the query.
	var url = getAPIBaseURL() + "/advanced_search/" + query;
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(pokemonList) {
    	var search_results = document.getElementById("search_results");
    	var innerHTML = '<div class = "container">\n';
		if (pokemonList.length == 0){
			innerHTML += "sorry, there is no Pokemon with your specified criteria"
		}else{
			for (var i = 0; i < pokemonList.length; i ++) {
				innerHTML += '<div class = "row">\n' + buildPokemonStatsHTML(pokemonList[i]) + '\n</div>';
			}
		}
    	innerHTML += "\n</div>";
    	search_results.innerHTML = innerHTML;
    })
    .catch(function(error) {
        console.log(error);
    });
}

function loadDropdowns() {
	// Legendary status
	loadDropdown("legendary_status_dropdown", "legendaries",
		function(arr, i) { return makePresentable(arr[i]).replace("Null", "Not Legendary"); })
	
	// Types
	loadDropdown("type1_dropdown", "types", null)
	loadDropdown("type2_dropdown", "types", null)

	// Abilities
	abilityAccessor = function(arr, i){ return arr[i]["ability"];}
	loadDropdown("ability1_dropdown", "abilities", abilityAccessor)
	loadDropdown("ability2_dropdown", "abilities", abilityAccessor)
	loadDropdown("hidden_ability_dropdown", "abilities", abilityAccessor)

	// Regions
	loadDropdown("region_dropdown", "regions", null)
	
	// Game of origin
	loadDropdown("game_dropdown", "games", null)

	// Egg groups
	eggGroupsPresentor = function(arr, i) { return makePresentable(arr[i]); }
	loadDropdown("egg_group1_dropdown", "egg_groups", eggGroupsPresentor);
	loadDropdown("egg_group2_dropdown", "egg_groups", eggGroupsPresentor);
}

function loadDropdown(HtmlId, apiEndpoint, accessor) {
	if (accessor === null) {
        accessor = function(arr, i){ return arr[i]; };
    }

	var url = getAPIBaseURL() + "/" + apiEndpoint
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(arr) {
    	// See shared_functions.js for the definition of getDropdownInnerHTML
    	innerHTML = getDropdownInnerHTML(arr, makePresentable, function(arr, i){ return accessor(arr, i);});
		document.getElementById(HtmlId).innerHTML = innerHTML;    	
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


function buildPokemonStatsHTML(pokemonDict){
	var rawName = pokemonDict["pokemon_name"];
	returnString = getPokemonImageWithLink(rawName);
	returnString += '<div class="invisible-vertical-line"></div>';
	
	var firstTableHTML = "<table>\n";
	var firstTableInfo = ["Name", "ID", "Type1", "Type2"];
	var displayDict = {"Name" : "pokemon_name", "ID" : "pokedex_number", "Type1" : "type1", "Type2" : "type2"};
	for (var i = 0; i < firstTableInfo.length; i++){
		firstTableHTML += "<tr>\n";
		firstTableHTML += "<th>" + firstTableInfo[i] + "</th>";
		internalName = displayDict[firstTableInfo[i]]
		firstTableHTML += "<th>" + pokemonDict[internalName] + "</th>";
		firstTableHTML += "</tr>\n";
	}
	firstTableHTML += "</table>\n";
	returnString += firstTableHTML;

	returnString += '<div class="invisible-vertical-line"></div>';

	var secondTableHTML = "<table>\n";
	var secondTableInfo = ["attack", "special_attack", "defense", "special_defense", "health", "speed"];
	for (var i = 0; i < secondTableInfo.length; i++){
		secondTableHTML += "<tr>\n";
		secondTableHTML += "<th>" + makePresentable(secondTableInfo[i]) + "</th>";
		secondTableHTML += "<th>" + pokemonDict[secondTableInfo[i]] + "</th>";
		secondTableHTML += "</tr>\n";
	}
	secondTableHTML += "</table>\n";
	returnString += secondTableHTML;

	return returnString
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