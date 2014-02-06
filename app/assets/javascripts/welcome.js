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
  
});
