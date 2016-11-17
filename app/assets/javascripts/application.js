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

function convertHtml (source, replace) {
    var converter = new showdown.Converter();
    text = $(source).val()
    var html      = converter.makeHtml(text);
    $(replace).html(html)
}

$(document).ready(function(){
    convertHtml('#wiki_body','#wiki-preview');
    
    $('#wiki_body').keyup(function(event){
        convertHtml(this, '#wiki-preview');
    })
})
