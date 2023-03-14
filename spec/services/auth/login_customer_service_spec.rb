require 'rails_helper'

RSpec.describe Auth::LoginCustomerService, type: :service do
  subject { described_class.new(email, password) }

  describe '#call' do
    let(:email) { 'me@gobank.com' }
    let(:password) { 'password123' }

    context 'with correct credentials' do
      let!(:customer) { create(:customer, email: email, password: password) }

      it 'returns customer' do
        customer = subject.call
        expect(customer).to eq(customer)
      end
    end

    context 'with incorrect credentials' do
      it 'raises unauthencated error' do
        expect { subject.call }.to raise_error(APIError::NotAuthenticatedError)
      end
    end
  end
end
