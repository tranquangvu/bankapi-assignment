module Auth
  class ValidateCustomerFromTokenService < ApplicationService
    attr_reader :scheme, :token

    def initialize(scheme, token)
      @scheme = scheme
      @token = token
    end

    def call
      customer = Customer.find_by(id: decoded_token&.dig(:data, :customer_id))
      (scheme == 'Bearer' && customer) || raise(APIError::NotAuthenticatedError)
    end

    private

    def decoded_token
      @decoded_token ||= decode_token(@token)
    end

    def decode_token(token)
      JsonWebToken.decode(token)
    rescue JWT::VerificationError, JWT::DecodeError
      nil
    end
  end
end
