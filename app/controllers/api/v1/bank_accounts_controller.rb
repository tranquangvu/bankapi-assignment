module API
  module V1
    class BankAccountsController < BaseController
      def create
        bank_account = Account::CreateBankAccountService.call(current_customer)
        render_resource(bank_account, include_expenses: true, status: :created)
      end
    end
  end
end
