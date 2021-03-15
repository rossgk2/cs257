window.onload = initialize;

function initialize() {
    var URL = window.location.href;
    URLSplit = URL.split("/");
    var pokemonName = URLSplit[URLSplit.length - 1];
    console.log(pokemonName);

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

		document.getElementById("type1").innerHTML = makePresentable(dict["type1"]) + "&nbsp;"
        document.getElementById("type1_image").innerHTML = getTypeImageHTML(dict["type1"]);
		document.getElementById("type2").innerHTML = makePresentable(dict["type2"]) + "&nbsp;"
        document.getElementById("type2_image").innerHTML = getTypeImageHTML(dict["type2"]);
        loadSupereffectInfo(pokemonName, dict["type1"], dict["type2"]);

		// Stats
		var stats = ['health', 'attack', 'defense', 'special_attack', 'special_defense', 'speed'];
		for (var i = 0; i < stats.length; i ++) {
			key = stats[i];
			document.getElementById(key).innerHTML = `${makePresentable(stats[i])}: <b>${dict[key]} </b> `;
		}

		// Abilities
		document.getElementById("ability1").innerHTML = makePresentable(dict["ability1"]);
		document.getElementById("ability2").innerHTML = makePresentable(dict["ability2"]);
		document.getElementById("hidden_ability").innerHTML = makePresentable(dict["hidden_ability"]);
        var abilities = [dict["ability1"], dict["ability2"], dict["hidden_ability"]];
        var htmlTags = ["ability1_description", "ability2_description", "hidden_ability_description"]
        getAbilityDescriptions(abilities, htmlTags);

        // Legendary status
        legendaryStatus = dict["legendary_status"].toLowerCase();
		if (legendaryStatus === "null")
            legendaryStatus = `${pokemonName} is <b> not </b> a legendary pokemon`;
        else
            legendaryStatus = `${pokemonName} is a ${makePresentable(legendaryStatus)} pokemon`;

		document.getElementById("legendary_status").innerHTML = legendaryStatus;
		document.getElementById("region").innerHTML = `Region: <b>${makePresentable(dict["region"])}</b>`;
		document.getElementById("catch_rate").innerHTML = `Catch rate: <b>${makePresentable(dict["catch_rate"])}%</b>`;

		//Game
		document.getElementById("game").innerHTML = `First appeared in: <b>${makePresentable(dict["game"])}</b> edition.`

		// The following fields coorrespond to HTML id's whose names don't exactly match up to the keys in dict (e.g. "sex_ratios" 
		// is an HTML id but the coorresponding dict key is "male_percent").

		// Sex ratios (some in-line computation is needed)
		document.getElementById("sex_ratios").innerHTML = `<b>${dict["male_percent"]}%</b> of ${pokemonName} are male and 
		<b>${100 - dict["male_percent"]}%</b> are female.`;

		eggGroupString = `Egg group(s): <b>${makePresentable(dict["egg_group1"])}</b>`;
		if (dict["egg_group2"].toLowerCase() !== "null") eggGroupString += ` and <b>${makePresentable(dict["egg_group2"])}</b>`
		document.getElementById("egg_groups").innerHTML = eggGroupString;
    })
    .catch(function(error) {
        console.log(error);
    });
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
        // (Each element of effectivenessTuples is an array of the form [type, effectiveness], where type is something like
        // "Fire" and effectivness is a positive real number).

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
    var firstRow = `<table class = "gridTable"> <tr class = "gridTable${color}"> <td class = "gridTable">Type </td> <td class = "gridTable"> Effect</td></tr>`;
    var tableHTML = firstRow;
    for (var i = 0; i < effectivenessTuples.length; i++){
        //from api, the effectivenessTuples table is a sorted list
        var defendType = effectivenessTuples[i][0];
        var effect = effectivenessTuples[i][1];
        var tableRowHTML = `<tr class = "gridTable"> <td class = "gridTable">${defendType} </td> <td class = "gridTable"> ${effect}</td></tr>`;
        if (effect > 1 && isSupereffect) tableHTML += tableRowHTML;
        if (effect < 1 && !isSupereffect) tableHTML += tableRowHTML;
    }
    //if the table is empty
    if (tableHTML == firstRow) tableHTML = '<tr class = "gridTable"> supereffect is 1 for all types </tr>';

    tableHTML += '</table>';
    return tableHTML;
}

function getAbilityDescriptions(abilityNames, htmlTags){
    var url = getAPIBaseURL() + '/abilities';
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(allAbilities) {
        for (var i = 0; i < allAbilities.length; i++){
            for (var j = 0; j < abilityNames.length; j++){
                if (allAbilities[i]["ability"] == abilityNames[j]){
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
