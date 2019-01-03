class Profile < ApplicationRecord
  belongs_to :user
  has_many :addresses
  has_many :domiciles, class_name: "Address", foreign_key: "domicile_id"
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :domiciles, allow_destroy: true

  enum gender: { male: 1, female: 2 }
end
