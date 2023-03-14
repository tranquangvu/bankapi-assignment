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
class Transfer < ApplicationRecord
  # associations
  belongs_to :from_bank_account, class_name: 'BankAccount'
  belongs_to :to_bank_account, class_name: 'BankAccount'

  # validations
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validate :must_not_transfer_to_your_self

  private

  def must_not_transfer_to_your_self
    if from_bank_account_id.present? && to_bank_account_id.present? && from_bank_account_id == to_bank_account_id
      errors.add(:to_bank_account, "can't be transfer to same bank account")
    end
  end
end
