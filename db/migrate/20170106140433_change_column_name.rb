class ChangeColumnName < ActiveRecord::Migration
 def change
    rename_column :charts, :type, :file_type
  end
end
