class SupportsController < ApplicationController
  def home
    render json: { app: 'go-bank-api', version: '0.0.1' }
  end
end
