class RenameModelUser < ActiveRecord::Migration[5.2]
  def change
    rename_table :models, :users
  end
end
