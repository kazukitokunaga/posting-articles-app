# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    family_name      { "山田" }
    family_name_kana { "ヤマダ" }
    first_name       { "太郎" }
    first_name_kana  { "タロウ" }
    birth_date       { "1970-01-01 00:00:00" }
    gender           { "female" }
    phone            { "00000000000" }
    bloodType        { "AB" }

    association :user, :confirmed
  end
end
