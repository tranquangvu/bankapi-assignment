module API
  module V1
    class BankAccountsController < BaseController
      before_action :prepare_bank_account, only: %i[show]

      def index
        authorize(BankAccount)
        bank_accounts = Account::GetAllBankAccountsOfCustomerService.call(current_customer)
        render_resource_collection(bank_accounts, status: :ok)
      end

      def create
        authorize(BankAccount)
        bank_account = Account::CreateBankAccountService.call(current_customer)
        render_resource(bank_account, status: :created)
      end

      def show
        authorize(@bank_account)
        render_resource(@bank_account, status: :ok)
      end

      private

      def prepare_bank_account
        @bank_account = current_customer.bank_accounts.find(params[:id])
      end
    end
  end
end
