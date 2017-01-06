class AddStyleToCharts < ActiveRecord::Migration
  def change
    add_column :charts, :style, :string
  end
end
