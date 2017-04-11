class CreateCommentsections < ActiveRecord::Migration[5.0]
  def change
    create_table :commentsections do |t|
      t.string :name
      t.text :body
      t.references :information, index: true, foreign_key: true

      t.timestamps
    end
  end
end
