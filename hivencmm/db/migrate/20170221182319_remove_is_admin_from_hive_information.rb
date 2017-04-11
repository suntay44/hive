class RemoveIsAdminFromHiveInformation < ActiveRecord::Migration[5.0]
  def change
    remove_column :hive_informations, :is_admin, :boolean
  end
end
