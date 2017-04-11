class AddIsAdminToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :is_admin, :boolean
  end
end
