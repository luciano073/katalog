// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


// var ready;
// ready = function() {
jQuery(function() {
  $('span.tip').tooltip();
  $('input#artist_height').setMask({ mask: '299'});

 
$('.artist_professions').tokenInput($('.artist_professions').data('professions'),
    {
     theme             : "facebook",
     preventDuplicates : true,
     prePopulate       : $('.artist_professions').data('pre')
    }
  );

$('.artist_country').tokenInput('/countries',
    {
      theme            : "artist-country",
      tokenLimit       : 1,
      prePopulate      : $('.artist_country').data('pre'),
      searchDelay      : 200,
      hintText         : "Digite para buscar",
      noResultsText    : "Sem resultados",
      searchingText    : "Buscando...",
      resultsFormatter : function(item){
        return "<li><img src='" + item.url_16 + "' /> &nbsp; " + item.name + "</li>";
      },
      tokenFormatter   : function(item){
        return "<li><p><img src='" + item.url_16 + "' /> &nbsp; " + item.name + "</p></li>"; 
      }      
      
    });

  
});

// };
// $(document).ready(ready);
// $(document).on('page:load', ready); 
