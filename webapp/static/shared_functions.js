/* ============================================================ */
/* Functions for getting links */
/* ============================================================ */

function getAPIBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
    return baseURL;
}

function doesFileExist(urlToFile) {
    // from https://www.kirupa.com/html5/checking_if_a_file_exists.htm
    var xhr = new XMLHttpRequest();
    xhr.open('HEAD', urlToFile, false);
    xhr.send();
    if (xhr.status === "404") {
        return false;
    } else {
        return true;
    }
}

function loadLinkToHomePage() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/';
    var image = "../static/pokemon_images/homePageSign.png";
    image = `<img src="${image}"  width="50" align = "left" alt="homePageSign"></img>`
    var htmlElement = `<a href="${baseURL}">${image}</a>`;
    document.getElementById('link_to_homepage').innerHTML = htmlElement;
}

/* ============================================================ */
/* Functions for loading images */
/* ============================================================ */

function getPokemonImageWithLink(pokemonName, textBottom = false, pokedex_number = 0) {
    var pokemonImageHTML = `<img src="${getPokemonImagePath(pokemonName)}" alt="sorry, pokemon image missing" 
            class="img-thumbnail" title = "click to know more about this pokemon">\n`;
    if (textBottom){
        var bottomText = `<div class = "name-and-id"><b>(ID: ${pokedex_number}) ${makePresentable(pokemonName)}</b></div>`;
        pokemonImageHTML = bottomText + pokemonImageHTML;
    }
    var pokeImageLink = `<div class = "highlight"><a href="${getPokemonPageURL(pokemonName)}">${pokemonImageHTML}</a></div>`;
    return pokeImageLink;
}

function getPokemonImagePath(pokemonName) {
    pokemonName = pokemonName.replaceAll("_", "-")
    var base_path = "../static/pokemon_images/";
    var jpg_url = base_path + pokemonName + ".jpg";
    var png_url = base_path + pokemonName + ".png";
    if (doesFileExist(png_url)) return png_url;
    if (doesFileExist(jpg_url)) return jpg_url;
    return "../static/pokemon_images/pokemon_picture_missing.png";
}

function getPokemonPageURL(pokemon_name){
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/pokemon_page/' + pokemon_name;
    return baseURL;
}

function getTypeImageHTML(type){
    type = type.toLowerCase();
    var result = `<img src="../static/type_images/${type}.png" alt="something is wrong" class="img-thumbnail"`
    result += ` title = "type: ${type}, click to see all type supereffects">`;
    result = '<a href = "../static/type_chart_image.jpg" target = "_blank">' + result + '</a>';
    result = '<div class = "highlight">' + result + '</div>';
    return result;
}

/* ============================================================ */
/* Functions for loading dropdown menus */
/* ============================================================ */

/* Reads the contents of the JSON list at the specified API endpoint into the inner HTML of the element with HTML ID HTMLid. 

    accessor is the function used to access elements of the JSON list at the API endpoint. More specifically, accessor must
    be a function with the signature "function(arr, i)", where arr is an array and i is an integer, and it must return a string.
*/
function loadDropdown(HTMLid, APIendpoint, accessor) {
    var url = getAPIBaseURL() + "/" + APIendpoint
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(arr) {
        innerHTML = getDropdownInnerHTML(arr, accessor, makePresentable);
        document.getElementById(HTMLid).innerHTML = innerHTML;      
    })
    .catch(function(error) {
        console.log(error);
    });
}

/* Returns the inner HTML required to fill a searchable dropdown menu (i.e. a <select class = "select2">) with the contents of the array arr.

 accessor is a function that specifies how to access a string from the array arr. (We need this generality because arr might be an array of dicts, 
 or maybe something even crazier). accessor must have the signature "function (arr, i)", where arr is an array and i is an integer, and it 
 must return a string. If accessor is null, then it is assumed to be the function "function(arr, i){ return arr[i]; }". 

 presentor is a function that is used to "prettify" the strings that are returned by accessor() before they are put into
 the final inner HTML. It must have the signature "function(str)", and it must return a string.
*/
function getDropdownInnerHTML(arr, accessor, presentor) {
    if (accessor === null) {
        accessor = function(arr, i){ return arr[i]; };
    }
    var innerHTML = "<option value = any> Any </option>\n";
    for (var i = 0; i < arr.length; i ++) {
        innerHTML += "<option value = " + accessor(arr, i) + " >" + presentor(accessor(arr, i)) + " </option>\n";
    }
    return innerHTML;
}

/* ============================================================ */
/* Other functions */
/* ============================================================ */

// Prettifies strings. For example, makePresentable("pokemon_name") === "Pokemon Name".
function makePresentable(txt) {
    // from https://stackoverflow.com/questions/196972/convert-string-to-title-case-with-javascript
    // Replace underscores with spaces.
    var result = txt.replaceAll("_", " ") 

    // Convert to Title Case.
    result = result.replace(/\w\S*/g, function(x) { return x.charAt(0).toUpperCase() + x.substr(1).toLowerCase();}); 
    
    // Put a space between word and the number contained the word. (We assume only one number is contained in the word).
    var firstDigitIndex = result.indexOf(result.match(/\d/));
    result = result.substring(0, firstDigitIndex) + " " + result.substring(firstDigitIndex, result.length);
    return result;
}

/* Returns the inner HTML for a table with two columns, where the "unprettified" versions
of the names of the items in the first column come from firstColKeys, and where the items in
the second column are obtained by using firstColKeys to access valueDict. */
function dualColTableBuilder(firstColKeys, valueDict){
    var tableHTML = "<table>\n";
    for (var i = 0; i < firstColKeys.length; i++){
        infoTitle = makePresentable(firstColKeys[i]);
        infoValue = valueDict[firstColKeys[i]];
        if (typeof infoValue === "string") {
            if (infoValue === "NULL")
                infoValue = "N/A";
            else
                infoValue = makePresentable(infoValue);
        }
        tableHTML += `<tr><th>${infoTitle}</th><td>${infoValue}</td></tr>\n`;
    }
    tableHTML += "</table>\n";
    return tableHTML;
}

function informationSign(){
    var b = document.getElementById("information_sign_button");
    var c = document.getElementById("information_sign_content"); 
    if (b.value == "Show Help") {
        c.style.display = "block";
        b.value = "Hide Help";
    }else{
        c.style.display = "none";
        b.value = "Show Help";
    }
}