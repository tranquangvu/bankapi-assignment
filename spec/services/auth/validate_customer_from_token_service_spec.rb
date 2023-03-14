require 'rails_helper'

RSpec.describe Auth::ValidateCustomerFromTokenService, type: :service do
  subject { described_class.new('Bearer', token) }

  describe '#call' do
    let!(:customer) { create(:customer) }

    context 'with correct token' do
      let(:token) { customer.auth_token }

      it 'returns customer' do
        customer = subject.call
        expect(customer).to eq(customer)
      end
    end

    context 'with incorrect token' do
      let(:token) { 'wrong-auth-token' }

      it 'raises unauthencated error' do
        expect { subject.call }.to raise_error(APIError::NotAuthenticatedError)
      end
    end
  end
end
