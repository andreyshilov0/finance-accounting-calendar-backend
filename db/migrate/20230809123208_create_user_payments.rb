class CreateUserPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :user_payments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true
      t.float :amount, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
