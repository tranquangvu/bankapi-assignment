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
class Customer < ApplicationRecord
  has_secure_password

  # associations
  has_many :bank_accounts

  # validations
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 }
  validates :fullname, presence: true, length: { minimum: 3 }

  def auth_token
    JsonWebToken.encode(customer_id: id)
  end
end
