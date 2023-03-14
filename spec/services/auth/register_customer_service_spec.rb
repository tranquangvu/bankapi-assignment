require 'rails_helper'

RSpec.describe Auth::RegisterCustomerService, type: :service do
  subject { described_class.new(params) }

  describe '#call' do
    context 'with valid params' do
      let(:params) { attributes_for(:customer) }

      it 'creates customer' do
        result = nil
        expect { result = subject.call }.to change(Customer, :count).by(1)
        expect(result).to be_instance_of(Customer)
      end
    end

    context 'with invalid params' do
      let(:params) { attributes_for(:customer, password: '') }

      it 'raises error and does not create customer' do
        expect { subject.call }.to raise_error(ActiveRecord::RecordInvalid)
          .and(not_change(Customer, :count))
      end
    end
  end
end
