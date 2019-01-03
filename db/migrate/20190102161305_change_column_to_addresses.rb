class ChangeColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :profileId, :string
    add_column :addresses, :profile_id, :integer
  end
end
