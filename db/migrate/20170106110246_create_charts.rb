class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :title
      t.text :data, default: '[[0]]'
      t.text :row_labels, default: '[]'
      t.text :column_labels, default: '[]'
      t.text :colors, default: '[]'
      t.integer :height
      t.integer :width
      t.string :background_color, default: '#ffffff'
      t.string :file_type, default: 'svg'
      t.string :style, default: 'bar'
      t.string :color_scheme, default: 'Set1'
      t.integer :item_height
      t.integer :item_width
      t.integer :item_columns

      t.timestamps null: false
    end
  end
end
