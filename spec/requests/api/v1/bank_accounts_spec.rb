require 'rails_helper'

RSpec.describe 'bank_accounts', type: :request do
  describe 'POST /api/v1/bank_accounts' do
    let!(:customer) { create(:customer) }

    def do_request
      post api_v1_bank_accounts_path, params: {}, headers: auth_api_headers(customer)
    end

    it do
      expect { do_request }.to change(customer.bank_accounts, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end
end
