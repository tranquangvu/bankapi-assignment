module Auth
  class RegisterCustomerService < ApplicationService
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      Customer.create!(params)
    end
  end
end
