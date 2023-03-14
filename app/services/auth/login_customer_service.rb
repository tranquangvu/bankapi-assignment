module Auth
  class LoginCustomerService < ApplicationService
    attr_reader :email, :password

    def initialize(email, password)
      @email = email
      @password = password
    end

    def call
      customer = Customer.find_by(email: email)
      customer&.authenticate(password) || raise(APIError::NotAuthenticatedError, 'Invalid email or password')
    end
  end
end
