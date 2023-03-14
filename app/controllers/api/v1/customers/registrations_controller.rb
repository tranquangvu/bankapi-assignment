module API
  module V1
    module Customers
      class RegistrationsController < BaseController
        skip_before_action :authenticate_customer!, only: :create

        def create
          customer = Auth::RegisterCustomerService.call(customer_params)
          render_resource(customer, status: :created)
        end

        private

        def customer_params
          params.require(:customer).permit(:email, :password, :fullname)
        end
      end
    end
  end
end
