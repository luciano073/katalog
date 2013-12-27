// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery-ui-extension-accentFolding
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
// require bootstrap-tokenfield
//= require meiomask.min
//= require jquery.bxslider.min
//= require lightbox-2.6.min
//= require jquery.tokeninput
// require select2
//= require_tree .


jQuery(function () {

  $('input.date').setMask('date'); //Plugin meiomask

  $('#film_cast').bxSlider({
    auto: true,
    // autoControls: true,
    // captions: true,
    controls: false,
    autoHover: true,
    minSlides: 1,
    maxSlides: 4,
    speed: 3000,
    slideMargin: 10,
    moveSlides: 1,
    slideWidth: 130
  });

});

