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
  text = $(source).val();
  var html = converter.makeHtml(text);
  $(replace).html(html);
}

$(document).ready(function(){
  highlight($('pre code'));
  convertHtml('#wiki_body','#wiki-preview');

  $('#wiki_body').keyup(function(event){
    convertHtml(this, '#wiki-preview');
  });
});