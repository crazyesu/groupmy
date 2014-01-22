class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :groups, :deccription, :description
  end
end
