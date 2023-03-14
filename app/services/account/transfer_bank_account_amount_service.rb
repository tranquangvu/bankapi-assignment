module Account
  class TransferBankAccountAmountService < ApplicationService
    attr_reader :requested_customer, :transfer_attributes

    def initialize(requested_customer, transfer_attributes)
      @requested_customer = requested_customer
      @transfer_attributes = transfer_attributes
    end

    def call
      fba = verify_from_bank_account!
      tba = verify_to_bank_account!
      amount = verify_amount!

      ActiveRecord::Base.transaction do
        transfer_amount!(fba, tba, amount)
        create_transfer!(fba, tba, amount)
      end
    end

    private

    def verify_from_bank_account!
      requested_customer.bank_accounts.find_by(id: transfer_attributes[:from_bank_account_id]) ||
        raise(APIError::BadRequestError, 'Invalid transfer from_bank_account_id')
    end

    def verify_to_bank_account!
      BankAccount.find_by(id: transfer_attributes[:to_bank_account_id]) ||
        raise(APIError::BadRequestError, 'Invalid transfer to_bank_account_id')
    end

    def verify_amount!
      (transfer_attributes[:amount].positive? && transfer_attributes[:amount]) ||
        raise(APIError::BadRequestError, 'Invalid transfer amount')
    end

    def transfer_amount!(from_bank_account, to_bank_account, amount)
      from_bank_account.lock!
      to_bank_account.lock!

      from_bank_account.subtract_balance!(amount)
      to_bank_account.add_balance!(amount)
    end

    def create_transfer!(from_bank_account, to_bank_account, amount)
      Transfer.create!(
        from_bank_account: from_bank_account,
        to_bank_account: to_bank_account,
        amount: amount
      )
    end
  end
end
