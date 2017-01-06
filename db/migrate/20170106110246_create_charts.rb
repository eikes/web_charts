class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :title
      t.string :background_color
      t.integer :columns
      t.text :grouplabels
      t.integer :height
      t.integer :width
      t.integer :item_height
      t.integer :item_width
      t.string :file_type
      t.string :style

      t.timestamps null: false
    end
  end
end
