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
class BankAccount < ApplicationRecord
  # constants
  INITIAL_BALANCE = 1000

  # associations
  belongs_to :customer
  has_many :sent_transfers, class_name: 'Transfer', foreign_key: :from_bank_account_id
  has_many :received_transfers, class_name: 'Transfer', foreign_key: :to_bank_account_id

  # validations
  validates :bank_number, presence: true, length: { is: 16 }, uniqueness: true
  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.generate_uniq_bank_number
    16.times.map { rand(0..9) }.join
  end

  def add_balance!(amount)
    self.balance += amount
    save!
  end

  def subtract_balance!(amount)
    self.balance -= amount
    save!
  end
end
