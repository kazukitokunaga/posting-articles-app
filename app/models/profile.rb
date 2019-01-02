class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :domicile, class_name: "Address", foreign_key: "domicile_id"

  enum gender: { male: 1, female: 2 }
end
