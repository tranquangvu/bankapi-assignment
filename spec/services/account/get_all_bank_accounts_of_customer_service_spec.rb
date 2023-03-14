require 'rails_helper'

RSpec.describe Account::GetAllBankAccountsOfCustomerService, type: :service do
  subject { described_class.new(customer) }

  describe '#call' do
    let!(:customer) { create(:customer) }
    let!(:bank_acounts) { create_list(:bank_account, 2, customer: customer) }

    it do
      result = subject.call
      expect(result).to contain_exactly(*bank_acounts)
    end
  end
end
