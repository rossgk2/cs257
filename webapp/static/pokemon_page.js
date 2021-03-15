window.onload = initialize;

function initialize() {
    var URL = window.location.href;
    URLSplit = URL.split("/");
    var pokemonName = URLSplit[URLSplit.length - 1];

    loadPokemonData(pokemonName);
    loadPokemonImage(pokemonName);
    loadLinkToHomePage();
}

function loadPokemonData(pokemonName) {
    var url = getAPIBaseURL() + '/advanced_search/ASC?pokemon_name=' + pokemonName;
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(queryPokemonResult) {
        // Create a dictionary to hold the attributes for the current pokemon.
        var dict = {};
        for (var i = 0; i < queryPokemonResult.length; i++){
            //make sure only pokemon with the exact name are selected (i.e. "mew" and "mewtwo" are 2 different pokemons)
            if (queryPokemonResult[i]['pokemon_name'] == pokemonName.toLowerCase()){
                dict = queryPokemonResult[i];
            }
        }

		//Now, use dict to fill in the blanks of pokemon_page.html

		// Pokemon number and name
        pokemonName = makePresentable(dict["pokemon_name"]);
        document.getElementById("number_and_name").innerHTML = "(Pokedex ID: " + dict["pokedex_number"] + ") " + pokemonName; 

        // Type 2 (only display it if it exists)
        var hasType2 = dict["type2"] !== "NULL";
        if (hasType2) {
            document.getElementById("type2").innerHTML = makePresentable(dict["type2"]) + "&nbsp;";
            document.getElementById("type2_image").innerHTML = getTypeImageHTML(dict["type2"]);
        }
        else {
            document.getElementById("type2_outer").outerHTML = "";
        }

        // Type 1
        // Type 1 will be labeled as "Primary Type" if Type 2 is present, and just "Type" otherwise
        var type1Label = "#type1_outer td:first-child";
        if (hasType2)
            $(type1Label).html("<b> Primary Type: </b>");
        else
            $(type1Label).html("<b> Type: </b>");

		document.getElementById("type1").innerHTML = makePresentable(dict["type1"]) + "&nbsp;"
        document.getElementById("type1_image").innerHTML = getTypeImageHTML(dict["type1"]);

        // Supereffectiveness and not-very-effective-ness
        loadSupereffectInfo(pokemonName, dict["type1"], dict["type2"]);

		// Stats
		var stats = ['health', 'attack', 'defense', 'special_attack', 'special_defense', 'speed'];
		for (var i = 0; i < stats.length; i ++) {
			key = stats[i];
			document.getElementById(key).innerHTML = `<b> ${makePresentable(stats[i])} </b>: ${dict[key]}`;
		}

        // Ability descriptions
        // It's important that this is done before ability 1 is loaded.
        var abilities = [dict["ability1"], dict["ability2"], dict["hidden_ability"]];
        var htmlTags = ["ability1_description", "ability2_description", "hidden_ability_description"]
        loadAbilityDescriptions(abilities, htmlTags);

        // Hidden ability (only display if it exists)
        var hasHiddenAbility = dict["hidden_ability"] !== "NULL"; 
        if (hasHiddenAbility)
            document.getElementById("hidden_ability").innerHTML = makePresentable(dict["hidden_ability"]);
        else
            clearOuterHTML("hidden_ability_outer");

        // Ability 2 (only display it if it exists)
        var hasAbility2 = dict["ability2"] !== "NULL";
        if (hasAbility2)
            document.getElementById("ability2").innerHTML = makePresentable(dict["ability2"]);
        else
            clearOuterHTML("ability2_outer");

		// Ability 1
        // Ability 1 will be called "Primary Ability" if either the hidden ability or ability 2 are present, and just "Ability" otherwise
        var ability1Label = "#ability1_outer > span";
        if (hasHiddenAbility || hasAbility2)
            $(ability1Label).html("<b> Primary Ability: </b>");
        else { // "Metapod" is a Pokemon that only has a primary ability and triggers this else case
            $(ability1Label).html("<b> Ability: </b>");
            var abilityInnerHTML = document.getElementById("ability1_outer").innerHTML;
            var abilityDescInnerHTML = document.getElementById("ability1_description").innerHTML;
            var abilitiesList = document.getElementById("ability_ul");
            abilitiesList.outerHTML = "<span> " + abilityInnerHTML + "</span>\n<span>" + abilityDescInnerHTML + "</span>\n";
        }
        
		document.getElementById("ability1").innerHTML = makePresentable(dict["ability1"]);

        // Legendary status
        legendaryStatus = dict["legendary_status"].toLowerCase();
		if (legendaryStatus === "null")
            legendaryStatus = `${pokemonName} is not a legendary pokemon`;
        else
            legendaryStatus = `${pokemonName} <b> is </b> a ${makePresentable(legendaryStatus)} pokemon`;

		document.getElementById("legendary_status").innerHTML = legendaryStatus;
		document.getElementById("region").innerHTML = `<b> Region </b>: ${makePresentable(dict["region"])}`;
		document.getElementById("catch_rate").innerHTML = `<b> Catch rate </b>: ${makePresentable(dict["catch_rate"])}%`;

		//Game
		document.getElementById("game").innerHTML = `<b> First appeared in: </b>${makePresentable(dict["game"])} edition.`

		// The following fields coorrespond to HTML id's whose names don't exactly match up to the keys in dict (e.g. "sex_ratios" 
		// is an HTML id but the coorresponding dict key is "male_percent").

		// Sex ratios (some in-line computation is needed)
		document.getElementById("sex_ratios").innerHTML = `${dict["male_percent"]}% of ${pokemonName} are <b> male </b> and 
		${100 - dict["male_percent"]}% are <b> female </b>.`;

		eggGroupString = `<b>Egg group(s)</b>: ${makePresentable(dict["egg_group1"])}`;
		if (dict["egg_group2"].toLowerCase() !== "null") eggGroupString += ` and ${makePresentable(dict["egg_group2"])}`
		document.getElementById("egg_groups").innerHTML = eggGroupString;
    })
    .catch(function(error) {
        console.log(error);
    });
}

function clearOuterHTML(className) {
    var elements = document.getElementsByClassName(className);
    for (var i = 0; i < elements.length; i ++) {
        elements[i].outerHTML = "";
        elements[i].innerHTML = "";
    }
}

function loadPokemonImage(pokemonName) {
    var pokemonImagePath = getPokemonImagePath(pokemonName.replaceAll("_", "-"));
    document.getElementById('dynamic_pokemon_image').src = pokemonImagePath;
}


function loadSupereffectInfo(pokemonName, type1, type2){
    url = getAPIBaseURL() + "/supereffect_cal/" + type1 + "/" + type2;
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(effectivenessTuples) {
        // See the comment effectTableBuilder() to understand the format of effectivenessTuples.

        // Load the "not very effective" table and its introductory text.
        $("#undereffect_info > p").html(makePresentable(pokemonName) + " is not very effective against...");
        $("#undereffect_info > div").html(effectTableBuilder(effectivenessTuples, false));

        // Load the "supereffective" table and its introductory text.
        $("#supereffect_info > p").html(makePresentable(pokemonName) + " is supereffective against...");
        $("#supereffect_info > div").html(effectTableBuilder(effectivenessTuples, true));
    })
    .catch(function(error) {
        console.log(error);
    });
}

function effectTableBuilder(effectivenessTuples, isSupereffect){
    color = (isSupereffect) ? "Red" : "Gray";
    var firstRow = `<table class = "gridTable"> <tr class = "gridTable${color}"> <th class = "gridTable"> Type </th> <th class = "gridTable"> Effect</th> </tr>`;
    var tableHTML = firstRow;
    for (var i = 0; i < effectivenessTuples.length; i++){
        // Each element of effectivenessTuples is an array of the form [type, effectiveness], where type is something like
        // "Fire" and effectivness is a positive real number. If effectiveness > 1, then the Pokemon is considered to be "supereffective"
        // against type; if effectiveness < 1, then the Pokemon is considered to be "not very effective" against type.
        var type = makePresentable(effectivenessTuples[i][0]);        
        var effect = effectivenessTuples[i][1];
        var tableRowHTML = `<tr class = "gridTable"> <td class = "gridTable">${type} </td> <td class = "gridTable"> ${effect}</td></tr>`;
        if (effect > 1 && isSupereffect) tableHTML += tableRowHTML;
        if (effect < 1 && !isSupereffect) tableHTML += tableRowHTML;
    }
    //if the table is empty
    if (tableHTML == firstRow) tableHTML = '<tr class = "gridTable"> supereffect is 1 for all types </tr>';

    tableHTML += '</table>';
    return tableHTML;
}

function loadAbilityDescriptions(abilityNames, htmlTags){
    var url = getAPIBaseURL() + '/abilities';
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(allAbilities) {
        for (var i = 0; i < allAbilities.length; i++) {
            for (var j = 0; j < abilityNames.length; j++) {
                if (abilityNames[j] != "NULL" && allAbilities[i]["ability"] == abilityNames[j]) {
                    abilityDescription = allAbilities[i]["ability_description"].replaceAll("_", " ");
                    document.getElementById(htmlTags[j]).innerHTML = `Description: ${abilityDescription}`;
                }
            }
        }
    })
    .catch(function(error) {
        console.log(error);
    });
}
