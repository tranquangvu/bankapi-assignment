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
#  index_customers_on_email  (email) UNIQUE
#
class CustomerSerializer < ApplicationSerializer
  attributes :id,
             :email,
             :fullname,
             :created_at,
             :updated_at
end
