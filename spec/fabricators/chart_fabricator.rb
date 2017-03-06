Fabricator(:chart) do
  title 'Chart title'
  # background_color '#ffffff' # implicit by database default
  height 1000
  width 1000
  # file_type 'svg' # implicit by database default
  style 'bar'
  data { 4.times.map { 4.times.map { rand 1e4 } } }
  column_labels { 4.times.map { "Column #{Fabricate.sequence(:column_labels)}" } }
  row_labels { 4.times.map { "Row #{sequence(:column_labels)}" } }
  colors { 4.times.map { '#' + 3.times.map { rand(16..255).to_s(16) }.join } }
  item_height 50
  item_width 50
  item_columns 20
end
