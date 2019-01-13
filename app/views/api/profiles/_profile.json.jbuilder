# frozen_string_literal: true

json.(profile,
  :id,
  :family_name,
  :family_name_kana,
  :first_name,
  :first_name_kana,
  :birth_date,
  :gender,
  :phone,
  :bloodType,
)

json.addresses_attributes do |profile_address|
  json.id profile_address.id
  json.postal_code profile_address.postal_code
  json.address profile_address.address
  json.address_kana profile_address.address_kana
  json.building profile_address.building
end

json.domiciles_attributes do |profile_domicile|
  json.id profile_domicile.id
  json.postal_code profile_domicile.postal_code
  json.address profile_domicile.address
  json.address_kana profile_domicile.address_kana
  json.building profile_domicile.building
end
