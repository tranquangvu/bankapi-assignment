# == Schema Information
#
# Table name: customers
#
#  id              :bigint           not null, primary key
#  email           :string           default(""), not null
#  fullname        :string           not null
#  password_digest :string           default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_customers_on_email  (email)
#
FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    fullname { Faker::Name.name }
  end
end
