# == Schema Information
#
# Table name: customers
#
#  id              :bigint           not null, primary key
#  email           :string           default(""), not null
#  fullname        :string           not null
#  password_digest :string           default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value('me@go.com').for(:email) }
    it { is_expected.not_to allow_value('me.com').for(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
  end

  describe '#auth_token' do
    let(:customer) { build(:customer, id: 1) }

    it 'returns correct jwt token' do
      token = customer.auth_token
      object = JsonWebToken.decode(token)
      expect(object.dig(:data, :customer_id)).to eq(1)
    end
  end
end
