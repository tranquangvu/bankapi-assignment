module API
  module V1
    module Customers
      class ProfilesController < BaseController
        def me
          render_resource(current_customer)
        end
      end
    end
  end
end
