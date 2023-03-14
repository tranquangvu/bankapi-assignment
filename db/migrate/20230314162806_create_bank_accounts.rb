class CreateBankAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_accounts do |t|
      t.string :bank_number
      t.decimal :balance, precision: 10, scale: 2
      t.references :customer, index: true, foreign_key: true
      t.timestamps
    end
  end
end
