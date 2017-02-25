class AddColorSchemeToChart < ActiveRecord::Migration
  def change
    add_column :charts, :color_scheme, :string, default: 'Set1'
  end
end
