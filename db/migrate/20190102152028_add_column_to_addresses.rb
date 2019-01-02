class AddColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :profileId, :string
  end
end
