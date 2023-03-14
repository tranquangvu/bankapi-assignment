module API
  module V1
    module BankAccounts
      class BaseController < API::V1::BaseController
        before_action :prepare_bank_account

        private

        def prepare_bank_account
          @bank_account = current_customer.bank_accounts.find(params[:bank_account_id])
        end
      end
    end
  end
end
