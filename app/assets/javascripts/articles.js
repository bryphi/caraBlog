$(document).ready(function() {
init_article_lookup();
});



var init_article_lookup;

init_article_lookup = function(){

$('#article-lookup-form').on('ajax:success', function(event, data, status){

$('#article-lookup').replaceWith(data);

init_article_lookup(); 

});

$('#article-lookup-form').on('ajax:error', function(event, xhr, status, error){

$('#article-lookup-results').replaceWith('');

$('#article-lookup-errors').replaceWith('An article was not found.');

});



};