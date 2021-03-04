/* The symbol $ is an alias for JQuery(). To be totally clear, this means that $ is used as the name of a function! In the below, $(document)
 is the function $ acting on the argument whose name is document.
*/

// The anonymous function inside $(document).ready() is called after the document has been loaded.
$(document).ready(function() {
 
  // Initialize the select2 JQuery plugin
  $(".search").select2(); //".search" is a CSS selector string

  // Read selected option
  $('#search_button').click(function(){
    var value = $("#pokemon_name option:selected").text();

    $('#result').html("selected value: " + value);

  });
});