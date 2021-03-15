/* This class is used to set up a scrolling subwindow that displays "Pokemon cards" of the potentially many Pokemon that satisfy a search query.

- display is the HTML element which the inner HTML of this scrolling subwindow should be written to
- searchButton is the particular <input type = "button"> that will cause the infinite scrolling window to update
when it is clicked.
- scrollContainer is the HTML element whose onscroll() event handler is to be associated with the infinite scrolling window.
If the infinite scrolling window is to take up the whole screen, use scrollContainer = window. Otherwise, it is probably
some <div> in your HTML code.

Exactly what constitutes a Pokemon card is up to the user; the user must provide to the constructor a function "getPokemonCard(pokemon)"" that acts
 on "pokemon", which is a JSON dictionary, and returns the inner HTML that represents a Pokemon card.

The user also decides which API URL is queried when the button is clicked or when the scrollContainer.onscroll() fires, since they
 must provide to the constructor a function "getQueryURLOnUpdate()", accepting no arguments, that returns the URL prefixed with
 "<this-websites-address>/api/" to be visited. When implementing getQueryURLOnUpdate(), the user will likely pull values from input fields 
 to decide which URL to visit.

Lastly (these parameters are not so important):
- numPokemonEachQuery is the maximum number of Pokemon that any API query handled by a InfinitePokemonCardScroller instance will return
- numPokemonPerRow is the number of Pokemon cards per row in the infinite scrolling window 
*/
function InfinitePokemonCardScroller(display, scrollContainer, searchButton, getQueryURLOnUpdate, getPokemonCard, numPokemonEachQuery, numPokemonPerRow) {
	this.display = display;
	this.scrollContainer = scrollContainer;
	this.searchButton = searchButton;
	this.getQueryURLOnUpdate = getQueryURLOnUpdate;
	this.getPokemonCard = getPokemonCard;
	this.numPokemonEachQuery = numPokemonEachQuery;
	this.numPokemonPerRow = numPokemonPerRow;
	this.curNumPokemonOnPage = 0;
	this.morePokemon = true;
	this.loading = false;
	this.query = "";
	
	this.getLoadingGifInnerHtml = function() {
		var nullTypeImage = '<img src="../static/type_images/null.png" class="img-thumbnail">';
		var singleBlock = `<img src="../static/pokemon_images/pokemon_ball_square.gif" class="img-thumbnail">
		<h5>loading</h5> <h6>T1:${nullTypeImage} T2:${nullTypeImage}</h6>`;
		
		// In order to ensure that Pokemon cards don't slightly shift position when loading images are replaced with
		// actual images, we put the loading icons inside a <div class = "container">.
		var loadingDisplay = '<div class="container">\n<div class="row">\n';
		for (var i = 0; i < this.numPokemonPerRow; i ++){
			loadingDisplay += '\n<div class="col-2">' + singleBlock + '</div>';
		}
		loadingDisplay += '</div>\n</div>\n';
		return loadingDisplay;
	};

	this.loadPokemonCards = function(display, all) {
		// Use the advanced search API endpoint to search for the Pokemon that will be displayed as cards.
		// Only search for numPokemonEachQuery many Pokemon.
		this.loading = true;
		var url;
		if (all) { url = getAPIBaseURL() + `/advanced_search/ASC?order_by=pokedex_number&limit=${numPokemonEachQuery}`; }
		else { url = getAPIBaseURL() + "/" + this.query + `&limit=${numPokemonEachQuery}&offset=${this.curNumPokemonOnPage}`; } 

		// Query the API and construct the inner HTML which represents each queried Pokemon as a "card". 
		var oldThis = this; // "this" changes inside each .then statement
		return fetch(url, {method: 'get'})
		.then((response) => response.json())
		.then(function(pokemonList) {
			// In order to ensure that Pokemon cards don't slightly shift position when loading images are replaced with
			// actual images, we put the loading icons inside a <div class = "container">.
			var pokemonDisplayDiv = '<div class="container">\n<div class="row">';
			for (var i = 0; i < pokemonList.length; i ++){
				// Get info about the current Pokemon.
				
				var appendThis = oldThis.getPokemonCard(pokemonList[i]);
				if (numPokemonPerRow > 1) // If there's more than one item per row, then each item goes in its own <div class = "col-2">.
					 appendThis = '<div class = "col-2">' + appendThis + '</div>';

				pokemonDisplayDiv += appendThis;

				// Go to the next row every numPokemonPerRow cards.
				if ((i + 1) % oldThis.numPokemonPerRow == 0) pokemonDisplayDiv += '</div>\n<div class="row">';
			}
			pokemonDisplayDiv += '</div>\n</div>';
			oldThis.curNumPokemonOnPage += numPokemonEachQuery;
			
			// Update this.morePokemon.
			var noResultsSatisfyCriteria = pokemonList.length == 0;
			var endOfQueryReached = pokemonList.length < numPokemonEachQuery;
			oldThis.morePokemon = !(noResultsSatisfyCriteria || endOfQueryReached);

			// Update the page with the inner HTML we constructed.
			var innerHTML = display.innerHTML.replaceAll(oldThis.getLoadingGifInnerHtml(), " ") + pokemonDisplayDiv;

			if (pokemonList.length == 0 && oldThis.curNumPokemonOnPage == numPokemonEachQuery){
				display.innerHTML = `<div class="container"> Sorry, there is no pokemon with the criteria that you specified</div>`;
			}else{
				//normal case
				display.innerHTML = innerHTML;
			}
			oldThis.loading = false;
		})
	};

	this.infiniteUserScroll = function() {
		if (this.morePokemon && !this.loading) {
			//from https://dev.to/sakun/a-super-simple-implementation-of-infinite-scrolling-3pnd
			var scrollHeight = $(document).height();
			var scrollPos = $(window).height() + $(window).scrollTop();
			this.query = this.getQueryURLOnUpdate();
			var smallNumber = 3;
			if (scrollHeight - scrollPos <= smallNumber) {
				display.innerHTML += this.getLoadingGifInnerHtml();
				this.loadPokemonCards(display, false);
			}
		}
	};

	this.initialize = function() {
		// It will take a second or two for the effects of loadPokemonCards() (below) to register, so set up some "loading" GIFs.
		display.innerHTML = this.getLoadingGifInnerHtml();
	
		// Display all Pokemon (initially, don't restrict Pokemon that are shown by type or ability).
		this.loadPokemonCards(display, true);

		// Get the type and ability selected by the user and use them to load the appropriate Pokemon cards.
		var oldThis = this; // "this" will change inside the anonymous function
		this.searchButton.onclick = function() {
			display.innerHTML = oldThis.getLoadingGifInnerHtml();
			oldThis.morePokemon = true;
			oldThis.curNumPokemonOnPage = 0;
			oldThis.query = oldThis.getQueryURLOnUpdate();
			oldThis.loadPokemonCards(display, false);
		};

		// Register the onscroll event handler.  For some reason, doing "this.scrollContainer.onscroll = this.infiniteUserScroll;" doesn't work
		var oldThis = this;
		this.scrollContainer.onscroll = function() { oldThis.infiniteUserScroll(); };
	};	

	this.initialize();
}