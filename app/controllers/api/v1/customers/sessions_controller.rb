module API
  module V1
    module Customers
      class SessionsController < BaseController
        skip_before_action :authenticate_customer!, only: :create

        def create
          customer = Auth::LoginCustomerService.call(customer_params[:email], customer_params[:password])
          render_resource(customer, serializer: AuthCustomerSerializer)
        end

        private

        def customer_params
          params.require(:customer).permit(:email, :password)
        end
      end
    end
  end
end
