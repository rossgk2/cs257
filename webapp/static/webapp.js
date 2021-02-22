/*
    webapp.js
    Jimmy Zhong and Ross Grogan-Kaylor, CS257 Carleton College, Professor Jeff Ondich
    Final Project 2021 Feburary 
*/
window.onload = initialize;

function initialize() {
    var element = document.getElementById('click_and_change_button');
    if (element) {
        element.onclick = onRegionButton;
    }
    load_info("types", "type1_list_selection")
    load_info("types", "type2_list_selection")
    load_info("abilities", "ability_list_selection")
}

function getAPIBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
    return baseURL;
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

function load_info(this_info, tag_name) {
    var url = getAPIBaseURL() + '/' + this_info;
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(info) {
        var listBody ='';
        for (var i=0; i < info.length; i++){
            listBody += '<option value = "' + info[i][this_info] + '">'
                        + info[i][this_info] + '</option>\n';
        }
        var listElement = document.getElementById(tag_name);
        if (listElement){listElement.innerHTML = listBody;}
    })
    .catch(function(error) {
        console.log(error);
    });
}


/* 
    load_all_types();
    load_all_abilities();


function load_all_types() {
    var url = getAPIBaseURL() + '/types';
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(type) {
        var listBody ='';
        for (var i=0; i < type.length; i++){
            thisType = type[i]
            listBody += '<option value = "' + thisType['type_name'] + '">'
                        + thisType['type_name'] + '</option>\n';
        }
        var typeListElement = document.getElementById('type1_list_selection');
        if (typeListElement){typeListElement.innerHTML = listBody;}
        var typeListElement = document.getElementById('type2_list_selection');
        if (typeListElement){typeListElement.innerHTML = listBody;}
    })
    .catch(function(error) {
        console.log(error);
    });
}

function load_all_abilities() {
    var url = getAPIBaseURL() + '/abilities';
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(abilities) {
        var listBody ='';
        for (var i=0; i < abilities.length; i++){
            listBody += '<option value = "' + abilities[i]['ability'] + '">'
                        + abilities[i]['ability'] + '</option>\n';
        }
        var abilityListElement = document.getElementById('ability_list_selection');
        if (abilityListElement){abilityListElement.innerHTML = listBody;}
    })
    .catch(function(error) {
        console.log(error);
    });
}



jQuery attempt
$(document).ready(function() {
    $("ability_list_selection").select2();
});
*/