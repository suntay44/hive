class CreateUserlogins < ActiveRecord::Migration[5.0]
  def change
    create_table :userlogins do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
     
    end
  end
end
