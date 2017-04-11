class RenameNameToPerson < ActiveRecord::Migration[5.0]
  def change
    
    rename_column :userlogins, :name, :person
  end
end
