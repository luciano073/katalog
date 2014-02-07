jQuery(document).ready(function($) {

  $('#film_release').setMask('date');

  $('input.directors').tokenInput('/artists/directors.json',
    {
      theme             : "facebook",
      prePopulate       : $('input.directors').data('pre'),
      preventDuplicates : true,
      animateDropdown   : false,
      minChars          : 2,
      searchDelay       : 100,
      hintText          : "Digite para buscar",
      noResultsText     : "Sem resultados",
      searchingText     : "Buscando..."
    });

 $('input.writers').tokenInput('/artists/writers.json',
    {
      theme             : "facebook",
      prePopulate       : $('input.writers').data('pre'),
      preventDuplicates : true,
      animateDropdown   : false,
      minChars          : 2,
      searchDelay       : 100,
      hintText          : "Digite para buscar",
      noResultsText     : "Sem resultados",
      searchingText     : "Buscando..."
    });

  $('input.cast').tokenInput('/artists/cast.json',
    {
      theme             : "facebook",
      prePopulate       : $('input.cast').data('pre'),
      preventDuplicates : true,
      animateDropdown   : false,
      minChars          : 2,
      searchDelay       : 100,
      hintText          : "Digite para buscar",
      noResultsText     : "Sem resultados",
      searchingText     : "Buscando..."
    });

  $('.film_genre').tokenInput($('.film_genre').data('genres'), {
      theme             : "film-genre",
      hintText          : "Digite para buscar",
      noResultsText     : "Sem resultados",
      searchingText     : "Buscando...",
      searchDelay       : 10,
      prePopulate       : $('.film_genre').data('pre'),
      animateDropdown   : false,
      tokenValue        : "name",
      tokenDelimiter    : "|",
      preventDuplicates : true
    });

  $('.film_country').tokenInput('/countries',
    {
      theme            : "film-country",
      tokenLimit       : 1,
      prePopulate      : $('.film_country').data('pre'),
      searchDelay      : 100,
      animateDropdown  : false,
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

  $('#film_cast').bxSlider({
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

  
});
