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
class TransferSerializer < ApplicationSerializer
  attributes :id,
             :amount,
             :from_bank_account_id,
             :to_bank_account_id,
             :created_at,
             :updated_at

  attribute :amount do |object|
    object.amount&.to_f&.round(2)
  end
end
