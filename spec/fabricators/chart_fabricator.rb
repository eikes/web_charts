Fabricator(:chart) do
  title 'Chart title'
  # background_color '#ffffff' # implicit by database default
  height 1000
  width 1000
  # file_type 'svg' # implicit by database default
  style 'bar'
  column_labels { ['2010', '2011', '2012'] }
  row_labels { ['fire', 'see', 'grass', 'sand'] }
  colors { ['red', 'blue', 'green', 'yellow'] }
  item_height 50
  item_width 50
  item_columns 20
  data do
    [
      [123, 456, 789],
      [222, 333, 444],
      [100, 200, nil],
      [nil, -1, -100]
    ]
  end
end
