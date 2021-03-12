function InfiniteScroller(display, searchButton, getQueryURLOnUpdate, getPokemonCard, numPokemonEachQuery, numPokemonPerRow) {
	this.display = display;
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
	    
	    var loadingDisplay = '<div class="container">\n<div class="row">';
	    for (var i = 0; i < this.numPokemonPerRow; i ++){
	        loadingDisplay += '\n<div class="col-2">' + singleBlock + '</div>';
	    }
	    loadingDisplay += '</div>\n</div>';
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
	        var pokemonDisplayDiv = '<div class="container">\n<div class="row">';
	        for (var i = 0; i < pokemonList.length; i ++){
	            // Get info about the current Pokemon.
	            pokemonDisplayDiv += '<div class = "col-2">' + oldThis.getPokemonCard(pokemonList[i]) + '</div>';

	            // Go to the next row every numPokemonPerRow cards.
	            if (i == oldThis.numPokemonPerRow - 1) pokemonDisplayDiv += '</div>\n<div class="row">';
	        }
	        pokemonDisplayDiv += '</div>\n</div>';
	        oldThis.curNumPokemonOnPage += numPokemonEachQuery;
	        
	        // Update this.morePokemon.
	        var noResultsSatisfyCriteria = pokemonList.length == 0;
	        var endOfQueryReached = pokemonList.length < numPokemonEachQuery;
	        oldThis.morePokemon = !(noResultsSatisfyCriteria || endOfQueryReached);

	        // Update the page with the inner HTML we constructed.
	        innerHTML = display.innerHTML.replaceAll(oldThis.getLoadingGifInnerHtml(), " ") + pokemonDisplayDiv;
	        display.innerHTML = innerHTML;
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

	this.onReady = function() {
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

	    // Register the onscroll event handler.
	    var oldThis = this;
	    window.onscroll = function() { oldThis.infiniteUserScroll(); };
	};	
}