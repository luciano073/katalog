// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


// var ready;
// ready = function() {
jQuery(function() {
  $('span.tip').tooltip();
  $('input#artist_height').setMask({ mask: '299'});

  //Plugin select2
  $('#artist_country_id').select2({
    placeholder : '--',
    alowclear   : true,
    ajax: {
      url      : $('#artist_country_id').data('source'), //'/countries.json',
      dataType : 'json',
      data     : function(term, page) { return { q: term, page: page}; },
      results  : function(data, page) { return {results: data};}
           // alert(data[0].flag.flag._16.url);
        // return  {results: $.map(data, function(country, index) {
            // return {id: country.id, text: country.name, flag: country.flag};
          // })
        // }
      // }
    },
    formatResult: format,
    formatSelection: format,
    initSelection: function (item, callback) { //Prepopulate
                var id = item.val();
                var text = item.data('option');
                var flag = item.data('flag');
                var data = { id: id, text: text, img_url: flag };
                callback(data);
    },
    escapeMarkup: function(m) {return m;}
  });

  function format(country) {
    return  "<img class='flag' src='" + country.img_url + "' /> &nbsp;" + country.text;
  }
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

  // $('#artist_country').autocomplete({
  //   source: $('#artist_country').data('countries'),//['jô','josé','green','yellow','violet','brown','purple','black','white'],
  //   delay: 0
    // select: function(event, ui) {
      // $(this).val(ui.item.id);
    // }
  // });

  $('#artist_profession_tokens').tokenInput($('#artist_profession_tokens').data('professions'),
    {
     theme             : "facebook",
     preventDuplicates : true,
     prePopulate       : $('#artist_profession_tokens').data('pre')
    }
  );

});

// };
// $(document).ready(ready);
// $(document).on('page:load', ready); 
