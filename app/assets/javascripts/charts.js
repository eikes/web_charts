$(function(){

  // color picker:
  var init_minicolor = function() {
    $('input.minicolors:not(.minicolors-input)').minicolors({ theme: 'bootstrap', position: 'right' });
  };
  $('form').on('cocoon:after-insert', init_minicolor);
  init_minicolor();

  // cocoon:
  $('.chart_form .add_fields').
      data("association-insertion-method", 'append').
      data("association-insertion-node", '.chart_form table tbody');

});
