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

function doesFileExist(urlToFile) {
    // from https://www.kirupa.com/html5/checking_if_a_file_exists.htm
    var xhr = new XMLHttpRequest();
    xhr.open('HEAD', urlToFile, false);
    xhr.send();
     
    if (xhr.status == "404") {
        return false;
    } else {
        return true;
    }
}

function loadPokemonImage(pokemonName) {
    pokemonName = pokemonName.replaceAll("_", "-")
    var base_path = "../static/pokemon_images/";
    var jpg_url = base_path + pokemonName + ".jpg";
    var png_url = base_path + pokemonName + ".png";
    pokemonImageElement = document.getElementById('dynamic_pokemon_image');
    if (doesFileExist(jpg_url)) { 
        pokemonImageElement.src = jpg_url;
    }else if (doesFileExist(png_url)) {
        pokemonImageElement.src = png_url;
    }else {
        pokemonImageElement.src = "../static/pokemon_images/pokemon_picture_missing.png";
    }
}

function loadPokemonData(pokemon_name) {
    // Example: http://localhost:5000/api/advanced_search/ASC?pokemon_name=castform
    var url = getAPIBaseURL() + '/advanced_search/ASC?pokemon_name=' + pokemon_name;
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(queryPokemonResult) {
        // Create a dictionary dict that has all the data for the current pokemon
        var dict = {};
        //make sure only pokemon with the exact name are selected (i.e. "mew" and "mewtwo" are 2 different pokemons)
        pokemon_name = pokemon_name.toLowerCase();
        /*var var_names = ['pokemon_name', 'pokedex_number', 'legendary_status', 'type1', 'type2', 'ability1', 
        'ability2', 'hidden_ability', 'health', 'attack', 'defense', 'special_attack', 'special_defense',
        'speed', 'region', 'catch_rate', 'male_percent', 'game', 'egg_group1', 'egg_group2'];*/
        for (var i = 0; i < queryPokemonResult.length; i++){
            if (queryPokemonResult[i]['pokemon_name'] == pokemon_name){
                dict = queryPokemonResult[i];

                /* I thought we do that later, I need the raw ability string to get the ability desciption
                for (var i = 0; i < var_names.length; i ++) {
                    key = var_names[i];
                    if (typeof dict[key] === 'string') {
                        dict[key] = makePresentable(dict[key]); 
                    }
                }*/
            }
        }

		//Now, use dict to fill in the blanks of pokemon_page.html
		// Pokemon number and name
        var numberAndName = document.getElementById("number_and_name");
        number_and_name.innerHTML = "(Pokedex ID: " + dict["pokedex_number"] + ") " + makePresentable(dict["pokemon_name"]);

		// Types and legendary status
		document.getElementById("type1").innerHTML = makePresentable(dict["type1"]) + "&nbsp;"
        document.getElementById("type1_image").innerHTML = getTypeImagesHTML(dict["type1"], "click to learn more about the type of this pokemon");
		document.getElementById("type2").innerHTML = makePresentable(dict["type2"]) + "&nbsp;"
        document.getElementById("type2_image").innerHTML = getTypeImagesHTML(dict["type2"], "click to learn more about the type of this pokemon");
		legendary_status = dict["legendary_status"].toLowerCase();
		if (legendary_status === "null"){
            legendary_status = "Not legendary";
        }else{
            legendary_status = makePresentable(legendary_status);
        }
		document.getElementById("legendary_status").innerHTML = legendary_status;

		// Stats
		stats = ['health', 'attack', 'defense', 'special_attack', 'special_defense', 'speed'];
		for (var i = 0; i < stats.length; i ++) {
			key = stats[i];
			document.getElementById(key).innerHTML = `${makePresentable(stats[i])}: <b>${dict[key]} </b> `;
		}

		// Abilities
		document.getElementById("ability1").innerHTML = makePresentable(dict["ability1"]);
        getAbilityDescription(dict["ability1"], "ability1_description");
		document.getElementById("ability2").innerHTML = makePresentable(dict["ability2"]);
        getAbilityDescription(dict["ability2"], "ability2_description");
		document.getElementById("hidden_ability").innerHTML = makePresentable(dict["hidden_ability"]);
        getAbilityDescription(dict["hidden_ability"], "hidden_ability_description");

		// Region, catch rate
		document.getElementById("region").innerHTML = "Region: " + makePresentable(dict["region"]);
		document.getElementById("catch_rate").innerHTML = "Catch rate: " + makePresentable(dict["catch_rate"]) + "%";

		//Game
		document.getElementById("game").innerHTML = makePresentable(pokemon_name) + " first appeared in the " + makePresentable(dict["game"]) + " edition."

		// The following fields coorrespond to HTML id's whose names don't exactly match up to the keys in dict (e.g. "sex_ratios" 
		// is an HTML id but the coorresponding dict key is "male_percent").

		// Sex ratios (some in-line computation is needed)
		document.getElementById("sex_ratios").innerHTML = dict["male_percent"] + "% of " + makePresentable(pokemon_name) + " are male and " + 
		(100 - dict["male_percent"]) + "% are female.";

		// Egg groups
		document.getElementById("egg_groups").innerHTML = "Egg groups: " + makePresentable(dict["egg_group1"]) + ", " + makePresentable(dict["egg_group2"]);

        //load type supereffect
        loadTypeInformation(dict["type1"], dict["type2"])
    })
    .catch(function(error) {
        console.log(error);
    });
}

function loadTypeInformation(type1, type2){
    url = getAPIBaseURL() + "/supereffect_cal/" + type1 + "/" + type2;
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(nonOneEffects) {
        var undereffectTable = `<table class = "gridTable">
        <tr class = "gridTableGray"> <td class = "gridTable">Type </td> <td class = "gridTable"> Effect</td></tr>`;
        var supereffectTable = `<table class = "gridTable">
        <tr class = "gridTableRed"> <td class = "gridTable">Type </td> <td class = "gridTable"> Effect</td></tr>`;
        for (var i = 0; i < nonOneEffects.length; i++){
            defendType = nonOneEffects[i][0];
            effect = nonOneEffects[i][1];
            if (effect > 1){
                supereffectTable += `<tr class = "gridTable"> <td class = "gridTable">${defendType} </td> <td class = "gridTable"> ${effect}</td></tr>`;
            }else{
                undereffectTable += `<tr class = "gridTable"> <td class = "gridTable">${defendType} </td> <td class = "gridTable"> ${effect}</td></tr>`;
            }
        }
        undereffectTable += '</table>';
        supereffectTable += '</table>';
        document.getElementById("type_supereffect_table").innerHTML = `${supereffectTable}`;
        document.getElementById("type_undereffect_table").innerHTML = `${undereffectTable}`;
    })
    .catch(function(error) {
        console.log(error);
    });
}

function getAbilityDescription(abilityName, htmlTag){
    var url = getAPIBaseURL() + '/ability_description/' + abilityName;
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(abilityDescription) {
        abilityDescription = abilityDescription.replaceAll("_", " ");
        document.getElementById(htmlTag).innerHTML = `Description: ${abilityDescription}`
    })
    .catch(function(error) {
        console.log(error);
    });
}

function getAPIBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
    return baseURL;
}

function loadLinkToHomePage() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/';
    var image = "../static/pokemon_images/homePageSign.png";
    image = '<img src="' + image + '"  width="50" align = "left" alt="homePageSign"></img>'
    var htmlElement = '<a href="' + baseURL + '">' + image + '</a>';
    document.getElementById('link_to_homepage').innerHTML = htmlElement;
}

function onRegionButton() {
    var url = getAPIBaseURL() + '/regions';
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(regions) {
        var listBody ='';
        for (var i=0; i < regions.length; i++){
            listBody += '<li>' + regions[i]['regions'] + '</li>\n';
        }
        var listElement = document.getElementById('regions_list');
        if (listElement){listElement.innerHTML = listBody;}
    })
    .catch(function(error) {
        console.log(error);
    });
}

//Helper functions

function makePresentable(str) {
    str = str.replaceAll("_", " ")
    .toLowerCase()
    .split(' ')
    .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
    .join(' ');
   //result = str.charAt(0).toUpperCase() + str.slice(1);
   return str;
}

/** the new makePresentable took care of the function of this
function toTitleCase(str) {
	from https://stackoverflow.com/questions/196972/convert-string-to-title-case-with-javascript
  	return str.replace(/\w\S*/     /*g, function(txt) { return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
}*/

function getTypeImagesHTML(type, imageTitle){
    var typeImageLine = `<img src="../static/type_images/${type}.png" align = "right" alt="something is wrong" class="img-thumbnail" title= "${imageTitle}">\n`;
    return typeImageLine;
}

