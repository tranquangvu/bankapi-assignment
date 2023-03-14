# == Schema Information
#
# Table name: bank_accounts
#
#  id          :bigint           not null, primary key
#  balance     :decimal(10, 2)   default(0.0), not null
#  bank_number :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint
#
# Indexes
#
#  index_bank_accounts_on_bank_number  (bank_number) UNIQUE
#  index_bank_accounts_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
class BankAccountSerializer < ApplicationSerializer
  attributes :id, :balance, :bank_number, :customer_id, :created_at, :updated_at

  attribute :balance do |object|
    object.balance&.to_f&.round(2)
  end
end
