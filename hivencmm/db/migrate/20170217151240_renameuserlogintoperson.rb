class Renameuserlogintoperson < ActiveRecord::Migration[5.0]
  self.table_name = "persons"
  
  def change
    rename_table :userlogins, :people
  end
end
