module Account
  class GetAllTranfersFromBankAccountService < ApplicationService
    attr_reader :bank_account

    def initialize(bank_account)
      @bank_account = bank_account
    end

    def call
      bank_account.sent_transfers
                  .or(bank_account.received_transfers)
                  .order(created_at: :desc)
    end
  end
end
