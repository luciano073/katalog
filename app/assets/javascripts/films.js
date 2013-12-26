jQuery(function() {
  $('input.directors').tokenInput('/artists/directors.json',
    {
      theme             : "facebook",
      prePopulate       : $('input.directors').data('pre'),
      preventDuplicates : true,
      minChars          : 2,
      searchDelay       : 200,
      hintText          : "Digite para buscar",
      noResultsText     : "Sem resultados",
      searchingText     : "Buscando..."
    }
  );

 $('input.writers').tokenInput('/artists/writers.json',
    {
      theme             : "facebook",
      prePopulate       : $('input.writers').data('pre'),
      preventDuplicates : true,
      minChars          : 2,
      searchDelay       : 200,
      hintText          : "Digite para buscar",
      noResultsText     : "Sem resultados",
      searchingText     : "Buscando..."
    }
  );

  $('input.cast').tokenInput('/artists/cast.json',
    {
      theme             : "facebook",
      prePopulate       : $('input.cast').data('pre'),
      preventDuplicates : true,
      minChars          : 2,
      searchDelay       : 200,
      hintText          : "Digite para buscar",
      noResultsText     : "Sem resultados",
      searchingText     : "Buscando..."

    }
  );

});
