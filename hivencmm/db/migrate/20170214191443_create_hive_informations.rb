class CreateHiveInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :hive_informations do |t|
      t.string :title
      t.text :description
      t.text :responsible
      t.text :note
      t.text :solution
      t.integer :category_id
      t.boolean :is_active

      t.timestamps
    end
  end
end
