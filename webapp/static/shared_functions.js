function getTypeImageHTML(type){
    type = type.toLowerCase();
    var result = `<img src="../static/type_images/${type}.png" alt="something is wrong" class="img-thumbnail"`
    result += ` title = "type: ${type}, click to see all type supereffects">`;
    result = '<a href = "../static/type_chart_image.jpg" target = "_blank">' + result + '</a>';
    result = '<div class = "highlight">' + result + '</div>';
    return result;
}

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

function getPokemonImageWithLink(pokemonName) {
    var pokemonImageHtml = `<img src="${getPokemonImagePath(pokemonName)}" alt="sorry, pokemon image missing" 
            class="img-thumbnail" title = "click to know more about this pokemon">\n`;
    var pokeImageLink = `<div class = "highlight"><a href="${getPokemonPageURL(pokemonName)}">${pokemonImageHtml}</a></div>`;
    return pokeImageLink;
}

function getPokemonImagePath(pokemonName) {
    pokemonName = pokemonName.replaceAll("_", "-")
    var base_path = "../static/pokemon_images/";
    var jpg_url = base_path + pokemonName + ".jpg";
    var png_url = base_path + pokemonName + ".png";
    if (doesFileExist(png_url)) return png_url;
    //if (doesFileExist(jpg_url)) return jpg_url;
    return `${base_path}pokemon_picture_missing.png`;
}

function getPokemonPageURL(pokemon_name){
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/pokemon_page/' + pokemon_name;
    return baseURL;
}

function dualColTableBuilder(leftKey, valueDict){
	var tableHtml = "<table>\n";
	for (var i = 0; i < leftKey.length; i++){
		infoTitle = makePresentable(leftKey[i]);
		infoValue = valueDict[leftKey[i]];
		if (typeof infoValue === "string") infoValue = makePresentable(infoValue);
		tableHtml += `<tr><th>${infoTitle}</th><td>${infoValue}</td></tr>\n`;
	}
	tableHtml += "</table>\n";
	return tableHtml;
}

function loadLinkToHomePage() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/';
    var image = "../static/pokemon_images/homePageSign.png";
    image = `<img src="${image}"  width="50" align = "left" alt="homePageSign"></img>`
    var htmlElement = `<a href="${baseURL}">${image}</a>`;
    document.getElementById('link_to_homepage').innerHTML = htmlElement;
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

function makePresentable(txt) {
    txt = txt.replaceAll("_", " ")
    // from https://stackoverflow.com/questions/196972/convert-string-to-title-case-with-javascript
    .replace(/\w\S*/g, function(txt) { return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
   return txt;
}


/* Inputs:
 - arr is an array
 - accessor is a function that takes in an array and an integer and returns an element of that array. If accessor is null, then it is assumed to be
 the function: function(arr, i){ return arr[i]; }

 Given the HTML id HtmlId of a HTML element that should contain <option> tags, this function 
 loads the appropriate inner HTML of that element to be such that inner HTML and value of each option tag
 is loaded from the API endpoint apiEndpoint.
*/
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

/* Inputs:
 - arr is an array
 - presentor is a function that takes a single string as input and returns a string as output
 - accessor is a function that takes in an array and an integer and returns an element of that array. If accessor is null, then it is assumed to be
 the function: function(arr, i){ return arr[i]; }
*/
function getDropdownInnerHTML(arr, presentor, accessor) {
    if (accessor === null) {
        accessor = function(arr, i){ return arr[i]; };
    }
    var innerHTML = "<option value = any> Any </option>\n";
    for (var i = 0; i < arr.length; i ++) {
        innerHTML += "<option value = " + accessor(arr, i) + " >" + presentor(accessor(arr, i)) + " </option>\n";
    }
    return innerHTML;
}




