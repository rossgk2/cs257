/*
    webapp.js
    Jimmy Zhong and Ross Grogan-Kaylor, CS257 Carleton College, Professor Jeff Ondich
    Final Project 2021 Feburary 
*/
window.onload = initialize;

function initialize() {
    var homePageElement = document.getElementById('click_and_change_button');
    if (homePageElement) {
        homePageElement.onclick = onRegionButton;
        load_info("types", "type1_list_selection");
        load_info("types", "type2_list_selection");
        load_info("abilities", "ability_list_selection")
    }
}