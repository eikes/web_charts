class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.float :value
      t.string :color
      t.string :label
      t.references :chart

      t.timestamps null: false
    end
  end
end
