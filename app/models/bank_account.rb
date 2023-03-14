# == Schema Information
#
# Table name: bank_accounts
#
#  id          :bigint           not null, primary key
#  balance     :decimal(10, 2)
#  bank_number :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint
#
# Indexes
#
#  index_bank_accounts_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
class BankAccount < ApplicationRecord
  # associations
  belongs_to :customer

  # validations
  validates :bank_number, presence: true, length: { is: 16 }
  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
