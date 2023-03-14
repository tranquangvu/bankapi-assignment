require 'rails_helper'

RSpec.describe Account::GetAllTranfersFromBankAccountService, type: :service do
  describe '#call' do
    let!(:me_bank_account) { create(:bank_account) }
    let!(:bro_bank_account) { create(:bank_account) }

    let!(:sent_transfers) { create_list(:transfer, 2, amount: 20, from_bank_account: me_bank_account, to_bank_account: bro_bank_account) }
    let!(:recieved_transfers) { create_list(:transfer, 2, amount: 10, from_bank_account: bro_bank_account, to_bank_account: me_bank_account) }

    it do
      result = Account::GetAllTranfersFromBankAccountService.new(me_bank_account).call
      expect(result).to contain_exactly(*(sent_transfers + recieved_transfers))
    end
  end
end
