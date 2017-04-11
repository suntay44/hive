class RenameInformationsToInfos < ActiveRecord::Migration[5.0]

  def change
    rename_table :informations, :infos
  end
end
