module API
  module V1
    module BankAccounts
      class TransfersController < BaseController
        def index
          authorize(Transfer)
          transfers = Account::GetAllTranfersFromBankAccountService.call(@bank_account)
          render_resource_collection(transfers, each_serializer: BankAccountTransferSerializer, params: { target_bank_account: @bank_account }, status: :ok)
        end
      end
    end
  end
end
