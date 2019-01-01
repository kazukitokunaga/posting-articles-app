# frozen_string_literal: true

password = "password"
user = User.seed(:id,
  id: 1,
  email:                 "example@example.com",
  password:              password,
  password_confirmation: password,
).first
user.confirm