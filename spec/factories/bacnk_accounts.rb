FactoryBot.define do
  factory :bank_account do
    bank_number { Faker::Bank.account_number }
    balance { 10000 }
    customer
  end
end
