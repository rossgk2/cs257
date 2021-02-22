/*
    webapp.js
    Jimmy Zhong and Ross Grogan-Kaylor, CS257 Carleton College, Professor Jeff Ondich
    Final Project 2021 Feburary 
*/

window.onload = initialize;

function initialize() {
    var element = document.getElementById('type_button');
    if (element) {
        element.onclick = onTypeButton;
    }
    load_all_types();
}

function getAPIBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
    return baseURL;
}

function onTypeButton() {
    var url = getAPIBaseURL() + '/types/';
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(type) {
        var listBody ='';
        for (var i=0; i < type.length; i++){
            listBody += '<li>' + type[i]['type_name'] + '</li>\n';
        }
        var typeListElement = document.getElementById('type_list');
        if (typeListElement){typeListElement.innerHTML = listBody;}
    })
    .catch(function(error) {
        console.log(error);
    });
}

function load_all_types() {
    var url = getAPIBaseURL() + '/types/';
    fetch(url, {method: 'get'})
    .then((response) => response.json())
    .then(function(type) {
        var listBody ='';
        for (var i=0; i < type.length; i++){
            thisType = type[i]
            listBody += '<option value = "' + thisType['type_name'] + '">'
                        + thisType['type_name'] + '</option>\n';
        }
        var typeListElement = document.getElementById('type_list_selection');
        if (typeListElement){typeListElement.innerHTML = listBody;}
    })
    .catch(function(error) {
        console.log(error);
    });
}
