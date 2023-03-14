class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :email, null: false, default: ''
      t.string :password_digest, null: false, default: ''
      t.string :fullname, null: false

      t.timestamps
    end
  end
end
