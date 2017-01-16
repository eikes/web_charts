$(function(){

  $('form').on('cocoon:after-insert', function() {
    $('[data-minicolors]').minicolors({ theme: 'bootstrap', position: 'right' });
  });

});