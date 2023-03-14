class ApplicationController < ActionController::API
  include Pundit::Authorization
  include Pagy::Backend
  include ExceptionFilter
  include JSONAPIRender

  before_action :authenticate_customer!

  attr_reader :current_customer

  def pundit_user
    current_customer
  end

  private

  def authenticate_customer!
    scheme, token = request.headers['Authorization']&.split(' ')
    @current_customer = Auth::ValidateCustomerFromTokenService.call(scheme, token)
  end
end
