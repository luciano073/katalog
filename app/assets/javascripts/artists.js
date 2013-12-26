// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(function() {

  $('span.tip').tooltip();
  $('input#artist_height').setMask({ mask: '299'});

  //Plugin select2
  // $('#artist_country').select2(
    // {
      // data: $('#artist_country').data('countries'),
      // allowClear: true,
      // placeholder: "Digite um país",
      // multiple: false,
      // id: function (object) {
        // return object.text;
      // }
    // }
    // );
//Plugin token input
  // $('#artist_country').tokenInput($('#artist_country').data('countries'),
    // { 
      // tokenLimit        : 1,
      // tokenValue        : "name",
      // animateDropdown   : false,
      // hintText          : null,
      // noResultsText     : "Sem resultados",
      // searchingText     : "Buscando...",
      // preventDuplicates : true,
      // theme          : "facebook"
    // }
    // );

  $('#artist_country').autocomplete({
    source: $('#artist_country').data('countries'),//['jô','josé','green','yellow','violet','brown','purple','black','white'],
    delay: 0
    // select: function(event, ui) {
      // $(this).val(ui.item.id);
    // }
  });

  $('#artist_profession_tokens').tokenInput($('#artist_profession_tokens').data('professions'),
    {
     theme: "facebook",
     preventDuplicates: true,
     prePopulate: $('#artist_profession_tokens').data('pre')
    }
    );

});