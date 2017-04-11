class AddIsAdminToHiveInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :hive_informations, :is_admin, :boolean
  end
end
