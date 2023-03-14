class SupportsController < ApplicationController
  skip_before_action :authenticate_customer!, only: :home

  def home
    render json: { app: 'go-bank-api', version: '0.0.1' }
  end
end
