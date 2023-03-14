module Account
  class GetAllBankAccountsOfCustomerService < ApplicationService
    attr_reader :customer

    def initialize(customer)
      @customer = customer
    end

    def call
      customer.bank_accounts
              .order(created_at: :desc)
    end
  end
end
