Fabricator(:chart) do
  title 'fabrication'
  background_color 'white'
  columns 20
  grouplabels 'pizza pasta spaghetti'
  height 1000
  width 1000
  item_height 50
  item_width 50
  file_type 'svg'
  style 'circle'
  data count: 4
end
