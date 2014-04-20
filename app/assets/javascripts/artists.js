// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


// var ready;
// ready = function() {
jQuery(document).ready(function($) {

  $('.tip').tooltip();

  $('input#artist_height').setMask({ mask: '999'});
  $('input.date').setMask('date');
  $('#new_artist').validationEngine();

 
  $('.artist_professions').tokenInput($('.artist_professions').data('professions'),
      {
       theme             : "facebook",
       preventDuplicates : true,
       animateDropdown  : false,
       prePopulate       : $('.artist_professions').data('pre'),
       searchDelay       : 100,
       hintText          : "Digite para buscar",
       noResultsText     : "Sem resultados",
       searchingText     : "Buscando..."
      }
    );

  $('.artist_country').tokenInput('/countries',
    {
      theme            : "artist-country",
      tokenLimit       : 1,
      animateDropdown  : false,
      prePopulate      : $('.artist_country').data('pre'),
      searchDelay      : 100,
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

  $('#artist-films').bxSlider({
    auto            : true,
    // autoControls : true,
    // captions     : true,
    controls        : false,
    autoHover       : true,
    minSlides       : 1,
    maxSlides       : 4,
    speed           : 3000,
    slideMargin     : 10,
    moveSlides      : 2,
    slideWidth      : 130
  });

  $('#artist-imgs').bxSlider({
    mode: 'vertical',
    auto            : true,
    // autoControls : true,
    // captions     : true,
    controls        : false,
    autoHover       : true,
    // minSlides       : 1,
    // maxSlides       : 1,
    speed           : 1000,
    adaptiveHeight: true,
    adaptiveHeightSpeed: 1000
    // slideMargin     : 10,
    // moveSlides      : 2,
    // slideWidth      : 130
  });

  
});

// };
// $(document).ready(ready);
// $(document).on('page:load', ready); 
