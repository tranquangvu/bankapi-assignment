require 'rails_helper'

RSpec.describe Account::TransferBankAccountAmountService, type: :service do
  describe '#call' do
    let!(:from_bank_account) { create(:bank_account, balance: 1000) }
    let!(:to_bank_account) { create(:bank_account, balance: 1000) }

    context 'valid' do
      it do
        result = Account::TransferBankAccountAmountService.new(
          from_bank_account.customer,
          {
            amount: 10,
            from_bank_number: from_bank_account.bank_number,
            to_bank_number: to_bank_account.bank_number
          }
        ).call
        from_bank_account.reload
        to_bank_account.reload

        expect(result).to be_a(Transfer)
        expect(result.amount).to eq(10)
        expect(result.from_bank_account).to eq(from_bank_account)
        expect(result.to_bank_account).to eq(to_bank_account)
        expect(from_bank_account.balance).to eq(990)
        expect(to_bank_account.balance).to eq(1010)
      end
    end

    context 'invalid' do
      it do
        expect do
          Account::TransferBankAccountAmountService.new(
            from_bank_account.customer,
            {
              amount: -10,
              from_bank_number: from_bank_account.bank_number,
              to_bank_number: to_bank_account.bank_number
            }
          ).call
        end.to raise_error(APIError::BadRequestError)
      end
    end
  end
end
