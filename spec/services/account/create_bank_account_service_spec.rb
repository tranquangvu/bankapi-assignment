require 'rails_helper'

RSpec.describe Account::CreateBankAccountService, type: :service do
  subject { described_class.new(customer) }

  describe '#call' do
    let(:customer) { create(:customer) }

    it do
      bank_account = nil
      expect { bank_account = subject.call }.to change(customer.bank_accounts, :count).by(1)

      expect(bank_account.bank_number).not_to be_nil
      expect(bank_account.customer_id).to eq(customer.id)
      expect(bank_account.balance).to eq(BankAccount::INITIAL_BALANCE)
    end
  end
end
