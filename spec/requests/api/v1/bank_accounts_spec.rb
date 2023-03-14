require 'rails_helper'

RSpec.describe 'bank_accounts', type: :request do
  let!(:customer) { create(:customer) }

  describe 'GET /api/v1/bank_accounts' do
    let!(:bank_accounts) { create_list(:bank_account, 2, customer: customer) }

    def do_request
      get api_v1_bank_accounts_path, headers: auth_api_headers(customer)
    end

    it do
      do_request
      expect(response).to have_http_status(:ok)
      expect(json_response['data'].map { |dt| dt['id'] }).to contain_exactly(*(bank_accounts.map { |ba| ba.id&.to_s }))
    end
  end

  describe 'POST /api/v1/bank_accounts' do
    def do_request
      post api_v1_bank_accounts_path, headers: auth_api_headers(customer)
    end

    it do
      expect { do_request }.to change(customer.bank_accounts, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'GET /api/v1/bank_accounts/:id' do
    let!(:bank_account) { create(:bank_account, customer: customer) }

    def do_request
      get api_v1_bank_account_path(bank_account.id), headers: auth_api_headers(customer)
    end

    it do
      do_request
      expect(response).to have_http_status(:ok)
      expect(json_response['data']['id']).to eq(bank_account.id&.to_s)
    end
  end
end
