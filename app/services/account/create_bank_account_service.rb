module Account
  class CreateBankAccountService < ApplicationService
    attr_reader :customer

    def initialize(customer)
      @customer = customer
    end

    def call
      BankAccount.create!(
        customer: customer,
        bank_number: BankAccount.generate_uniq_bank_number,
        balance: BankAccount::INITIAL_BALANCE
      )
    end
  end
end
