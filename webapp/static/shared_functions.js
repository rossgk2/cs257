function getTypeImageHTML(type){
    type = type.toLowerCase();
    var typeImageLine = `<img src="../static/type_images/${type}.png" alt="something is wrong" class="img-thumbnail"`
    if (type != "null"){
        typeImageLine += ` title = "type: ${type}, click to see all type supereffects">`;
        typeImageLine = '<a href = "../static/type_chart_image.jpg" target = "_blank">' + typeImageLine + '</a>';
        typeImageLine = '<div class = "highlight">' + typeImageLine + '</div>';
    }else{
        typeImageLine += ` title = "This pokemone does not have a secondary type">`;
    }
    return typeImageLine;
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
    if (xhr.status == "404") {
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
    if (doesFileExist(jpg_url)) return jpg_url;
    return "../static/pokemon_images/pokemon_picture_missing.png";
}

function getPokemonPageURL(pokemon_name){
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/pokemon_page/' + pokemon_name;
    return baseURL;
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
    if (c.style.display === "none") {
        b.innerHTML = "Hide Help";
        c.style.display = "block";
    } else {
        c.style.display = "none";
        b.innerHTML = "Need Help?";
    }
}

/*function toTitleCase(str) {
	// from https://stackoverflow.com/questions/196972/convert-string-to-title-case-with-javascript
  	return str.replace(/\w\S*/                      /*g, function(txt) { return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
}
*/
function makePresentable(txt) {
    txt = txt.replaceAll("_", " ")
    // from https://stackoverflow.com/questions/196972/convert-string-to-title-case-with-javascript
    .replace(/\w\S*/g, function(txt) { return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
   return txt;
}