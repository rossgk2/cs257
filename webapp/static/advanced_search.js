/* The symbol $ is an alias for jQuery(). To be totally clear, this means that $ is used as the name of a function! In the below, $(document)
 is the function $ acting on the argument whose name is document.
*/

// The anonymous function inside $(document).ready() is called after the document has been loaded.
window.onload = initialize;
var numPokemonEachQuery = 6;
var curNumPokemonOnPage = 0;
var morePokemon = true;
var loading = false;

function initialize() {
	// Initialize the select2 JQuery plugin. Functionality is added to HTML elements with class "search2". 
	$(".search2").select2();

	loadDropdowns();
	loadLinkToHomePage();
	registerSexRatioCallbacks();
	loadStatsButtonCallback(); // Adapted from https://www.w3schools.com/howto/howto_js_collapsible.asp
	//initalAskForQuery();

	loadInfinitePokemonCardScroller();
}

function loadInfinitePokemonCardScroller() {
    var display = document.getElementById("pokemon_landing_display");
    var scrollContainer = display;
    var searchButton = document.getElementById("search_button");
	/*
    getSimplePokemonCard = function(pokemon) {
    	var pokedexNum = pokemon['pokedex_number'];
        var name = pokemon['pokemon_name'];
        var pokemonImageHtml = getPokemonImageWithLink(name);
        
        var firstLine = `<h6>(ID: ${pokedexNum}) ${makePresentable(name)}</h6>\n`;
        var secondLine = `<h6>${getTypeImageHTML(pokemon['type1'])} ${getTypeImageHTML(pokemon['type2'])}</h6>\n`;
        return pokemonImageHtml + firstLine + secondLine;
    }

    getPokemonCard = function(pokemon) {
        var rawName = pokemon["pokemon_name"];
		var returnString = '<div class = "simple_card">' + getSimplePokemonCard(pokemon) + '</div>';
		returnString += '<div class="invisible-vertical-line"></div>';
		returnString += dualColTableBuilder(["attack", "special_attack", "defense", "special_defense", "health", "speed"], pokemon, null); //second table
		return returnString;
    }
	*/
	getAllPokemonImages = function(pokemon){
		var returnImages = `<div class = "pokemon-image">${getPokemonImageWithLink(pokemon["pokemon_name"])}</div>`;
		returnImages += `<div class = "type-image1">${getTypeImageHTML(pokemon['type1'])}</div>`;
		returnImages += `<div class = "type-image2">${getTypeImageHTML(pokemon['type2'])}</div>`;
		returnImages += `<div class = "name-and-id"><h4>${makePresentable(pokemon["pokemon_name"])} &nbsp ID: ${pokemon["pokedex_number"]}</h4></div>`;
		return returnImages
	}

	getPokemonCard = function(pokemon) {
		returnString = `<ul class = "row-parent">\n<li>${getAllPokemonImages(pokemon)}</li>`;
		//var keyDisplayConversion = {"Ability1" : "ability1", "Ability2" : "ability2", "Hidden Abty" : "hidden_ability"}
		returnString += `<li> ${dualColTableBuilder(["attack", "special_attack", "defense", "special_defense", "health", "speed"], pokemon)} </li>`; //second table
		returnString += `<li> ${dualColTableBuilder(["ability1", "ability2", "hidden_ability"], pokemon)} </li>`; //first tabl
		returnString += '</ul>';
		return returnString;
	}

    let infinitePokemonCardScroller = new InfinitePokemonCardScroller(display, scrollContainer, searchButton, getQueryURLOnUpdate, getPokemonCard, 6, 1);
    infinitePokemonCardScroller.initialize();
}

function getQueryURLOnUpdate() {
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
	// First, we need to form the query URL.
	// If the user passed in arguments, the query needs to start with "ASC?".
	var url = "advanced_search/ASC?order_by=pokedex_number";
	if (keys.length > 0) {
		url += "&";
	}

	// Add the user input to the query.
	for (var i = 0; i < keys.length; i ++) {
		var key = keys[i];
		var userInput = dict[key];
		var userInputProcessed = userInput.replaceAll(" ", "").toLowerCase();

		//Only include arguments in the query that coorrespond to fields filled out by the user.
		if (userInputProcessed !== "any" && userInputProcessed !== "") { 
			url += key + "=" + userInput;
			url += "&";
		}
	}

	// If the last character in query is "&", remove that "&" from the query.
	if (url[url.length - 1] == "&") {
		url = url.substring(0, url.length - 1)
	}

	return url;
}

function loadDropdowns() {
	// See shared_functions.js for the definition of loadDropdown.

	// Legendary status
	loadDropdown("legendary_status_dropdown", "legendaries",
		function(arr, i) { return arr[i].replace("null", "not legendary"); });
	
	// Types
	loadDropdown("type1_dropdown", "types", null);
	loadDropdown("type2_dropdown", "types", null);

	// Abilities
	abilityAccessor = function(arr, i){ return arr[i]["ability"];};
	loadDropdown("ability1_dropdown", "abilities", abilityAccessor);
	loadDropdown("ability2_dropdown", "abilities", abilityAccessor);
	loadDropdown("hidden_ability_dropdown", "abilities", abilityAccessor);

	// Regions
	loadDropdown("region_dropdown", "regions", null);
	
	// Game of origin
	loadDropdown("game_dropdown", "games", null);

	// Egg groups
	/* eggGroupsPresentor in the place of accessor? 
	This version does not work because we get api query like: /api/advanced_search/ASC?egg_group2=Amorphous
	api query does not take in capitalized letters. "A"
	eggGroupsPresentor = function(arr, i) { return makePresentable(arr[i]); }
	loadDropdown("egg_group1_dropdown", "egg_groups", eggGroupsPresentor);
	loadDropdown("egg_group2_dropdown", "egg_groups", eggGroupsPresentor);
	*/

	loadDropdown("egg_group1_dropdown", "egg_groups", null);
	loadDropdown("egg_group2_dropdown", "egg_groups", null);
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

function pokemonStatsLoop(offset, numEachQuery, pokemonList){
	addingHtml = '';
	var stop = Math.min(pokemonList.length, offset + numEachQuery);
	if (stop == offset) addingHtml = "end of query";
	for (var i = offset; i < stop; i ++) {
		addingHtml += '<div class = "row">\n' + buildPokemonStatsHTML(pokemonList[i]) + '\n</div>';
	}
	return addingHtml;
}

function buildPokemonStatsHTML(pokemonDict){
	var rawName = pokemonDict["pokemon_name"];
	returnString = getPokemonImageWithLink(rawName);
	returnString += '<div class="invisible-vertical-line"></div>';

	var keyDisplayConversion = {"Name" : "pokemon_name", "ID" : "pokedex_number", "Type1" : "type1", "Type2" : "type2"};
	returnString += dualColTableBuilder(["Name", "ID", "Type1", "Type2"], pokemonDict, keyDisplayConversion); //first tabl
	returnString += '<div class="invisible-vertical-line"></div>';
	returnString += dualColTableBuilder(["attack", "special_attack", "defense", "special_defense", "health", "speed"], pokemonDict, null); //second table
	return returnString;
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