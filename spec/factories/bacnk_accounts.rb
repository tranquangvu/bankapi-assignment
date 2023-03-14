FactoryBot.define do
  factory :bank_account do
    bank_number { BankAccount.generate_uniq_bank_number }
    balance { 10000 }
    customer
  end
end
