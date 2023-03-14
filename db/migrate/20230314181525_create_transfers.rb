class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.references :from_bank_account, index: true, foreign_key: { to_table: :bank_accounts }
      t.references :to_bank_account, index: true, foreign_key: { to_table: :bank_accounts }
      t.timestamps
    end
  end
end
