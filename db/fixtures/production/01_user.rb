# frozen_string_literal: true

email    = ENV["ADMIN_EMAIL"]    || "admin@example.com"
password = ENV["ADMIN_PASSWORD"] || "password"

admin = User.seed(:id,
  id: 1,
  email:                 email,
  password:              password,
  password_confirmation: password,
).first
admin.confirm
# admin.add_role :admin