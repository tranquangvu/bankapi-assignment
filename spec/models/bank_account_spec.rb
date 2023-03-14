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
require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to have_many(:sent_transfers).class_name('Transfer').with_foreign_key(:from_bank_account_id) }
    it { is_expected.to have_many(:received_transfers).class_name('Transfer').with_foreign_key(:to_bank_account_id) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:bank_number) }
    it { is_expected.to validate_length_of(:bank_number).is_equal_to(16) }
    it { is_expected.to validate_presence_of(:balance) }
    it { is_expected.to validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }
  end
end
