class CreateHiveCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :hive_categories do |t|
      t.integer :cat_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
