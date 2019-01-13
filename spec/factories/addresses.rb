# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    postal_code   { "MyString" }
    address_kana  { "MyString" }
    sequence(:address) { |n| "住所#{n}" }
    building      { "MyString" }

    association :profile
  end
end