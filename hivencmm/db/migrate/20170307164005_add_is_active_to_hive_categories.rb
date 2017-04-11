class AddIsActiveToHiveCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :hive_categories, :is_active, :boolean
  end
end
