module API
  module V1
    class TransfersController < BaseController
      def create
        authorize(Transfer)
        transfer = Account::TransferBankAccountAmountService.call(current_customer, transfer_params)
        render_resource(transfer, status: :created)
      end

      private

      def transfer_params
        params.require(:transfer).permit(:amount, :from_bank_number, :to_bank_number)
      end
    end
  end
end
