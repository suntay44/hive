class RenameHiveInformationsToInformations < ActiveRecord::Migration[5.0]
  self.table_name = "information"
  def change
    rename_table :hive_informations, :informations
  end
end
