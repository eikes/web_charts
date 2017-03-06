$(function(){

  // color picker:
  $.minicolors.defaults.position = 'top right';
  var init_minicolor = function() {
    $('input.minicolors').minicolors();
  };
  var remove_minicolor = function() {
    $('input.minicolors').minicolors('destroy');
  };
  init_minicolor();
  $('#chart_background_color').minicolors({theme: 'bootstrap'});

  var apply_colors = function(){
    var nr_rows = $('#data-table tr.data-tr').length;
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
      $('#data-table .minicolors-input').each(function(i){
        var color = colors[i % colors.length];
        $(this).minicolors('value', { color: color });
      })
    }
  }
  $('#chart_color_scheme').change(apply_colors);

  $('#chart-add-row').on('click', function() {
    remove_minicolor();
    var row = $('#data-table tbody tr.data-tr').last().clone();
    row.find('td.data-td input').val('').attr('name', 'chart[data]['+(new Date()).getTime()+'][column][]');
    $('#data-table tbody tr.data-tr').last().after(row);
    init_minicolor();
    apply_colors();
  });

  $('#chart-add-column').on('click', function() {
    $('#data-table tbody tr').each(function(){
      var last_cell = $(this).find('td.data-td, td.ctrl-column-td').last();
      var new_cell = last_cell.clone();
      new_cell.find('input').val('');
      last_cell.after(new_cell);
    });
  });

  $('#data-table').on('click', '.chart-delete-row', function() {
    $(this).parents('tr').remove();
    apply_colors();
  });

  $('#data-table').on('click', '.chart-delete-column', function() {
    var position = $(this).parent().prevAll('td').length;
    $('#data-table tbody tr').each(function(){
      $(this).find('td').get(position).remove();
    });
  });

});
