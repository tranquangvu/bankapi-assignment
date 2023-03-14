# == Schema Information
#
# Table name: transfers
#
#  id                   :bigint           not null, primary key
#  amount               :decimal(10, 2)   not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  from_bank_account_id :bigint
#  to_bank_account_id   :bigint
#
# Indexes
#
#  index_transfers_on_from_bank_account_id  (from_bank_account_id)
#  index_transfers_on_to_bank_account_id    (to_bank_account_id)
#
# Foreign Keys
#
#  fk_rails_...  (from_bank_account_id => bank_accounts.id)
#  fk_rails_...  (to_bank_account_id => bank_accounts.id)
#
require 'rails_helper'

RSpec.describe Transfer, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:from_bank_account).class_name('BankAccount') }
    it { is_expected.to belong_to(:to_bank_account).class_name('BankAccount') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
  end
end
