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
FactoryBot.define do
  factory :transfer do
    amount { 10 }
    association :from_bank_account, factory: :bank_account
    association :to_bank_account, factory: :bank_account
  end
end
