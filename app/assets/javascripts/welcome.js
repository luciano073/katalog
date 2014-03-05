jQuery(document).ready(function($) {



  $('#film-slider').bxSlider({
      auto            : true,
      // autoControls : true,
      // captions     : true,
      controls        : false,
      autoHover       : true,
      minSlides       : 1,
      maxSlides       : 5,
      speed           : 3000,
      slideMargin     : 10,
      moveSlides      : 2,
      slideWidth      : 130
    });

  $('#artist-slider').bxSlider({
      auto            : true,
      // autoControls : true,
      // captions     : true,
      controls        : false,
      autoHover       : true,
      minSlides       : 1,
      maxSlides       : 5,
      speed           : 3000,
      slideMargin     : 10,
      moveSlides      : 2,
      slideWidth      : 130
    });

  

  var films = new Bloodhound({
    datumTokenizer : function(d) { return Bloodhound.tokenizers.whitespace(d.value); },
    queryTokenizer : Bloodhound.tokenizers.whitespace,
    remote         : {
    url            : '/films/search?q=%QUERY',
    limit          : 10
    }
    // prefetch: 'assets/films.json'
  });

  var artists = new Bloodhound({
    datumTokenizer : function(d) { return Bloodhound.tokenizers.whitespace(d.value); },
    queryTokenizer : Bloodhound.tokenizers.whitespace,
    remote         : {
    url            : '/artists/search?q=%QUERY',
    limit          : 10
    }
    // prefetch: 'assets/artists.json'
  });

  films.initialize();
  artists.initialize();

  $('#g_search').typeahead({
    highlight: true,
    minLength: 2
    },
   {
      name       : 'films',
      displayKey : 'brazilian_title',
      source     : films.ttAdapter(),
      templates  : {
      header     : '<h4 id="h-film">Filmes</h4> <hr width="80%">',
      suggestion : Handlebars.compile([
          '<img src="{{img_url}}" class="img-thumbnail"/>',
          '<p id="suggestion">{{brazilian_title}}</p>',
          '<span id="year-film"> ({{year}})</span>'
          ].join(''))
      }
    },
    {
      name       : "artists",
      displayKey : 'name',
      source     : artists.ttAdapter(),
      templates  : {
      header     : '<h4 id="h-artist">Artistas</h4> <hr width="80%">',
      suggestion : Handlebars.compile([
          '<img src="{{img_url}}" class="img-thumbnail"/>',
          '<p id="suggestion">{{name}}</p>'
          ].join(''))
      }
    });

  $('#g_search').bind('typeahead:selected', function(obj, datum, name) {
    // alert(JSON.stringify(datum));
    window.location.replace(datum.url);
  });
  
});
