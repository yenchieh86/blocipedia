// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .



function highlight(code){
    $(code).each(function(i, block) {
    hljs.highlightBlock(block);
  });
}

function convertHtml (source, replace) {
    var converter = new showdown.Converter();
    text = $(source).val()
    var html      = converter.makeHtml(text);
    $(replace).html(html)
}

$(document).ready(function(){
    
    highlight($('pre code'))
    

    convertHtml('#wiki_body','#wiki-preview');
    
    $('#wiki_body').keyup(function(event){
        convertHtml(this, '#wiki-preview');
    });
    
    var blocmetrics = {};
        
    blocmetrics.report = function(eventName) {
        var event = {event: { name: eventName }};
        var request = new XMLHttpRequest();
        request.open("POST", "https://bloc-final-project-yenchieh86.c9users.io/api/events", true);
        request.setRequestHeader('Content-Type', 'application/json');
        request.send(JSON.stringify(event));
    };
    
    blocmetrics.report();
    
});


