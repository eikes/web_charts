class AddDefaultsToCharts < ActiveRecord::Migration
  def change
    change_column :charts, :background_color, :string, default: '#ffffff'
    change_column :charts, :file_type, :string, default: 'svg'
    change_column :charts, :style, :string, default: 'pie'
  end
end
