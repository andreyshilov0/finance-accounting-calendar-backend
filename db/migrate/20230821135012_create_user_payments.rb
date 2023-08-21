class CreateUserPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :user_payments, id: false do |t|
      t.belongs_to :user
      t.belongs_to :payment
    end
  end
end
