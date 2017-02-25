$(function(){

  // color picker:
  var init_minicolor = function() {
    $('input.minicolors:not(.minicolors-input)').minicolors({ theme: 'bootstrap', position: 'right' });
  };
  $('form').on('cocoon:after-insert', init_minicolor);
  init_minicolor();

  var apply_colors = function(){
    var nr_rows = $('#row-table tbody tr').length;
    var scheme = $('#chart_color_scheme').val();
    var colors, color_count;
    if (scheme && nr_rows > 0) {
      if (colorbrewer[scheme][nr_rows]){
        color_count = nr_rows;
      } else {
        if (nr_rows < 3 ) {
          color_count = 3
        } else {
          color_count = _.last(_.keys(colorbrewer[scheme]));
        }
      }
      colors = colorbrewer[scheme][color_count];
      $('#row-table .minicolors-input').each(function(i){
        var color = colors[i % colors.length];
        $(this).minicolors('value', { color: color });
      })
    }
  }
  $('form').on('cocoon:after-insert', apply_colors);
  $('#chart_color_scheme').change(apply_colors);

  // cocoon:
  $('.chart_form .add_fields').
      data("association-insertion-method", 'append').
      data("association-insertion-node", '.chart_form table tbody');

});
