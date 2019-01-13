class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string  :family_name
      t.string  :family_name_kana
      t.string  :first_name
      t.string  :first_name_kana
      t.date    :birth_date
      t.integer :gender
      t.integer :phone
      t.string  :bloodType
      t.integer :user_id

      t.timestamps
    end
  end
end
