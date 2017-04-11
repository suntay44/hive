class Changepersonstopeople < ActiveRecord::Migration[5.0]
  def change
    rename_table :persons, :people
  end
end
