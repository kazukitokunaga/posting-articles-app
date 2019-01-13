class Address < ApplicationRecord
  belongs_to :profile
  accepts_nested_attributes_for :profile
end
