require 'rails_helper'

RSpec.describe 'authentications', type: :request do
  describe 'POST /api/v1/customers/register' do
    def do_request
      post api_v1_customers_register_path, params: { customer: customer_params }
    end

    context 'with valid params' do
      let(:customer_params) { attributes_for(:customer) }

      it 'returns created response' do
        expect { do_request }.to change(Customer, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      let(:customer_params) { attributes_for(:customer, password: '') }

      it 'returns unprocessable entity response' do
        expect { do_request }.not_to change(Customer, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'POST /api/v1/customers/login' do
    let!(:customer) { create(:customer, password: 'password123') }

    def do_request
      post api_v1_customers_login_path, params: { customer: customer_params }
    end

    context 'with correct credentials' do
      let(:customer_params) { { email: customer.email, password: 'password123' } }

      it 'returns ok response with customer' do
        do_request
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with incorrect credentials' do
      let(:customer_params) { { email: customer.email, password: 'wrongpassword' } }

      it 'returns unauthorized respoonse' do
        do_request
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET /api/v1/customers/me' do
    let!(:customer) { create(:customer, password: 'password123') }

    def do_request
      get api_v1_customers_me_path, headers: auth_api_headers(customer)
    end

    it 'returns ok response with current customer info' do
      do_request
      expect(response).to have_http_status(:ok)
    end
  end
end
